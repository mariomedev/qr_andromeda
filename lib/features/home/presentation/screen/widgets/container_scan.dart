import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class ContainerScan extends StatefulWidget {
  const ContainerScan({super.key});

  @override
  State<ContainerScan> createState() => _ContainerScanState();
}

class _ContainerScanState extends State<ContainerScan>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation =
        Tween<Alignment>(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ),
        );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      height: 300,
      width: 300,
      decoration: BoxDecoration(
        border: Border.all(
          width: 5,
          color: colors.primary,
        ),
        borderRadius: BorderRadius.circular(AppDimensions.kBorderRadius6),
      ),
      child: AlignTransition(
        alignment: _animation,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.kPadding20,
          ),
          child: Divider(
            color: colors.primary,
            height: 20,
          ),
        ),
      ),
    );
  }
}
