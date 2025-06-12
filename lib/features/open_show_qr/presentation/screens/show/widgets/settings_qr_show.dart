import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

import '../../../provider/providers.dart';

class SettingsQrShow extends ConsumerStatefulWidget {
  @protected
  final PrettyQrDecoration decoration;

  @protected
  final Future<String?> Function(int)? onExportPressed;

  @protected
  final ValueChanged<PrettyQrDecoration>? onChanged;

  @visibleForTesting
  static const kDefaultQrDecorationImage = PrettyQrDecorationImage(
    image: AssetImage('assets/img/icon.png'),
    position: PrettyQrDecorationImagePosition.embedded,
  );

  const SettingsQrShow({
    super.key,
    required this.decoration,
    this.onChanged,
    this.onExportPressed,
  });

  @override
  ConsumerState<SettingsQrShow> createState() => _PrettyQrSettingsState();
}

class _PrettyQrSettingsState extends ConsumerState<SettingsQrShow> {
  @protected
  late final TextEditingController imageSizeEditingController;

  late Color kDefaultQrDecorationBrush;

  @override
  void initState() {
    super.initState();

    imageSizeEditingController = TextEditingController(
      text: ' 512w',
    );
    kDefaultQrDecorationBrush = ref.read(pickerColorProvider);
  }

  @protected
  int get imageSize {
    final rawValue = imageSizeEditingController.text;
    return int.parse(rawValue.replaceAll('w', '').replaceAll(' ', ''));
  }

  @protected
  Color get shapeColor {
    var shape = widget.decoration.shape;
    if (shape is PrettyQrSmoothSymbol) return shape.color;
    if (shape is PrettyQrRoundedSymbol) return shape.color;
    return Colors.black;
  }

  @protected
  bool get isRoundedBorders {
    var shape = widget.decoration.shape;
    if (shape is PrettyQrSmoothSymbol) {
      return shape.roundFactor > 0;
    } else if (shape is PrettyQrRoundedSymbol) {
      return shape.borderRadius != BorderRadius.zero;
    }
    return false;
  }

  @protected
  void showExportPath(String? path) {
    if (!mounted) return;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        content: Text(path ?? 'Export failed'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile.adaptive(
          value: widget.decoration.quietZone != PrettyQrQuietZone.zero,
          onChanged: (value) => toggleQuietZone(),
          secondary: const Icon(Icons.border_outer),
          title: const Text('Quiet Zone'),
        ),
        const Divider(),
        LayoutBuilder(
          builder: (context, constraints) {
            return PopupMenuButton(
              onSelected: changeShape,
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
              ),
              initialValue: widget.decoration.shape.runtimeType,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: PrettyQrSmoothSymbol,
                    child: Text('Smooth'),
                  ),
                  const PopupMenuItem(
                    value: PrettyQrRoundedSymbol,
                    child: Text('Rounded rectangle'),
                  ),
                ];
              },
              child: ListTile(
                leading: const Icon(Icons.format_paint_outlined),
                title: const Text('Style'),
                trailing: Text(
                  widget.decoration.shape is PrettyQrSmoothSymbol
                      ? 'Smooth'
                      : 'Rounded rectangle',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            );
          },
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            return PopupMenuButton(
              onSelected: toggleColor,
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth,
              ),
              initialValue: shapeColor == kDefaultQrDecorationBrush,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    onTap: () => chageColor(context, ref),
                    value: true,
                    child: const Text('Color'),
                  ),
                  const PopupMenuItem(
                    value: false,
                    child: Text('Gradient'),
                  ),
                ];
              },
              child: ListTile(
                leading: const Icon(Icons.color_lens_outlined),
                title: const Text('Brush'),
                trailing: Text(
                  shapeColor == kDefaultQrDecorationBrush
                      ? 'Color'
                      : 'Gradient',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            );
          },
        ),
        SwitchListTile.adaptive(
          value: widget.decoration.background != Colors.transparent,
          onChanged: (value) => toggleBackground(),
          secondary: const Icon(Icons.format_color_fill),
          title: const Text('Background'),
        ),
        SwitchListTile.adaptive(
          value: isRoundedBorders,
          onChanged: (value) => toggleRoundedCorners(),
          secondary: const Icon(Icons.rounded_corner),
          title: const Text('Rounded corners'),
        ),
        const Divider(),
        SwitchListTile.adaptive(
          value: widget.decoration.image != null,
          onChanged: (value) => toggleImage(),
          secondary: Icon(
            widget.decoration.image != null
                ? Icons.image_outlined
                : Icons.hide_image_outlined,
          ),
          title: const Text('Image'),
        ),
        if (widget.decoration.image != null)
          ListTile(
            enabled: widget.decoration.image != null,
            leading: const Icon(Icons.layers_outlined),
            title: const Text('Image position'),
            trailing: PopupMenuButton(
              onSelected: changeImagePosition,
              initialValue: widget.decoration.image?.position,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: PrettyQrDecorationImagePosition.embedded,
                    child: Text('Embedded'),
                  ),
                  const PopupMenuItem(
                    value: PrettyQrDecorationImagePosition.foreground,
                    child: Text('Foreground'),
                  ),
                  const PopupMenuItem(
                    value: PrettyQrDecorationImagePosition.background,
                    child: Text('Background'),
                  ),
                ];
              },
            ),
          ),
        if (widget.onExportPressed != null) ...[
          const Divider(),
          ListTile(
            leading: const Icon(Icons.save_alt_outlined),
            title: const Text('Export'),
            onTap: () async {
              final path = await widget.onExportPressed?.call(imageSize);
              showExportPath(path);
            },
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                PopupMenuButton(
                  initialValue: imageSize,
                  onSelected: (value) {
                    imageSizeEditingController.text = ' ${value}w';
                    setState(() {});
                  },
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: 256,
                        child: Text('256w'),
                      ),
                      const PopupMenuItem(
                        value: 512,
                        child: Text('512w'),
                      ),
                      const PopupMenuItem(
                        value: 1024,
                        child: Text('1024w'),
                      ),
                    ];
                  },
                  child: SizedBox(
                    width: 72,
                    height: 36,
                    child: TextField(
                      enabled: false,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                      controller: imageSizeEditingController,
                      decoration: InputDecoration(
                        filled: true,
                        counterText: '',
                        contentPadding: EdgeInsets.zero,
                        fillColor: Theme.of(context).colorScheme.surface,
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  void chageColor(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.all(0),
          contentPadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(500),
              bottom: Radius.circular(100),
            ),
          ),
          content: SingleChildScrollView(
            child: HueRingPicker(
              onColorChanged: (value) {
                ref.read(pickerColorProvider.notifier).state = value;
              },
              pickerColor: kDefaultQrDecorationBrush,
            ),
          ),
        );
      },
    );
  }

  @protected
  void changeShape(
    final Type type,
  ) {
    var shape = widget.decoration.shape;
    if (shape.runtimeType == type) return;

    if (shape is PrettyQrSmoothSymbol) {
      shape = PrettyQrRoundedSymbol(color: shapeColor);
    } else if (shape is PrettyQrRoundedSymbol) {
      shape = PrettyQrSmoothSymbol(color: shapeColor);
    }

    widget.onChanged?.call(widget.decoration.copyWith(shape: shape));
  }

  @protected
  void toggleColor(bool value) {
    var shape = widget.decoration.shape;
    var color = value
        ? kDefaultQrDecorationBrush
        : PrettyQrBrush.gradient(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.teal[200]!,
                Colors.blue[200]!,
                Colors.red[200]!,
              ],
            ),
          );

    if (shape is PrettyQrSmoothSymbol) {
      shape = PrettyQrSmoothSymbol(
        color: color,
        roundFactor: shape.roundFactor,
      );
    } else if (shape is PrettyQrRoundedSymbol) {
      shape = PrettyQrRoundedSymbol(
        color: color,
        borderRadius: shape.borderRadius,
      );
    }

    widget.onChanged?.call(widget.decoration.copyWith(shape: shape));
  }

  @protected
  void toggleQuietZone() {
    widget.onChanged?.call(
      widget.decoration.copyWith(
        quietZone: widget.decoration.quietZone != PrettyQrQuietZone.zero
            ? PrettyQrQuietZone.zero
            : PrettyQrQuietZone.standart,
      ),
    );
  }

  @protected
  void toggleBackground() {
    widget.onChanged?.call(
      widget.decoration.copyWith(
        background: widget.decoration.background != Colors.transparent
            ? Colors.transparent
            : Colors.white,
      ),
    );
  }

  @protected
  void toggleRoundedCorners() {
    var shape = widget.decoration.shape;

    if (shape is PrettyQrSmoothSymbol) {
      shape = PrettyQrSmoothSymbol(
        color: shape.color,
        roundFactor: isRoundedBorders ? 0 : 1,
      );
    } else if (shape is PrettyQrRoundedSymbol) {
      shape = PrettyQrRoundedSymbol(
        color: shape.color,
        borderRadius: isRoundedBorders
            ? BorderRadius.zero
            : const BorderRadius.all(Radius.circular(10)),
      );
    }

    widget.onChanged?.call(widget.decoration.copyWith(shape: shape));
  }

  @protected
  void toggleImage() {
    const defaultImage = SettingsQrShow.kDefaultQrDecorationImage;
    final image = widget.decoration.image != null ? null : defaultImage;

    widget.onChanged?.call(
      PrettyQrDecoration(
        image: image,
        shape: widget.decoration.shape,
        quietZone: widget.decoration.quietZone,
        background: widget.decoration.background,
      ),
    );
  }

  @protected
  void changeImagePosition(
    final PrettyQrDecorationImagePosition value,
  ) {
    final image = widget.decoration.image?.copyWith(position: value);
    widget.onChanged?.call(widget.decoration.copyWith(image: image));
  }

  @override
  void dispose() {
    imageSizeEditingController.dispose();

    super.dispose();
  }
}
