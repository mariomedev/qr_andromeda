import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/core.dart';
import '../../../domain/domain.dart';

class GenerateItemCard extends StatelessWidget {
  const GenerateItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GridView.builder(
        itemCount: 12,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return _ItemCard(index: index);
        },
      ),
    );
  }
}

class _ItemCard extends StatelessWidget {
  final int index;
  const _ItemCard({required this.index});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final styleText = Theme.of(context).textTheme;
    return InkWell(
      onTap: () {
        if (itemsGeneraCard[index].route.isNotEmpty) {
          context.push(itemsGeneraCard[index].route);
        }
      },
      child: Container(
        margin: const EdgeInsets.all(AppDimensions.kMargin25),
        child: Stack(
          children: [
            Positioned.fill(
              top: 15,
              child: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    AppDimensions.kBorderRadius8,
                  ),
                  color: colors.onPrimaryContainer,
                  border: Border.all(color: colors.primary),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(AppDimensions.kMargin30),
                  child: Hero(
                    tag: itemsGeneraCard[index].pathIcon,
                    child: SvgPicture.asset(
                      itemsGeneraCard[index].pathIcon,
                      colorFilter: ColorFilter.mode(
                        colors.primary,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 30,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(
                horizontal: AppDimensions.kMargin25,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppDimensions.kBorderRadius8,
                ),
                color: colors.primary,
              ),
              child: Center(
                child: Text(
                  itemsGeneraCard[index].title,
                  style: styleText.bodyMedium!.copyWith(
                    color: colors.surface,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
