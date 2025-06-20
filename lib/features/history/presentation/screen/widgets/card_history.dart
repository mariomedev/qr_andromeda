import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../core/core.dart';
import '../../../../open_show_qr/domain/domain.dart';
import '../../providers/providers.dart';

class CardHistory extends ConsumerStatefulWidget {
  final QREntity qr;

  const CardHistory({super.key, required this.qr});

  @override
  ConsumerState<CardHistory> createState() => _CardHistoryState();
}

class _CardHistoryState extends ConsumerState<CardHistory>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  final GlobalKey _cardKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animation =
        Tween<Offset>(
          begin: const Offset(0, 0),
          end: const Offset(300, 0),
        ).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Curves.easeInOut,
          ),
        );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final cardContext = _cardKey.currentContext;
      if (cardContext != null) {
        final width = cardContext.size?.width ?? 300;
        setState(() {
          _animation =
              Tween<Offset>(
                begin: const Offset(0, 0),
                end: Offset(width, 0),
              ).animate(
                CurvedAnimation(
                  parent: _controller,
                  curve: Curves.easeInOut,
                ),
              );
        });
      }
    });
    _controller.addStatusListener((status) async {
      if (status == AnimationStatus.completed) {
        final result = await ref
            .read(historyProvider.notifier)
            .delete(widget.qr.id);

        if (result == true) {
          _controller.reset();
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final createdAtformatted = DateFormat(
      'dd/MM/yyyy – HH:mm',
    ).format(widget.qr.createdAt ?? DateTime.now());
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: _animation.value,
          child: child,
        );
      },
      child: Card(
        key: _cardKey,
        color: colors.onPrimaryContainer,
        child: ListTile(
          onTap: () => context.push('/show_qr', extra: widget.qr),
          leading: Icon(
            Icons.arrow_forward_ios_rounded,
            color: colors.primary,
          ),
          title: Text(widget.qr.data),
          subtitle: Text(
            widget.qr.type,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  _controller.forward();
                },
                child: SvgPicture.asset(
                  AppAssets.deleteIcon,
                  colorFilter: ColorFilter.mode(
                    colors.primary,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Text(createdAtformatted),
            ],
          ),
        ),
      ),
    );
  }
}
