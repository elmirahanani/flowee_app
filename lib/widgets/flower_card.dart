import 'package:flowee_app/models/flower.dart';
import 'package:flowee_app/theme/app_theme.dart';
import 'package:flowee_app/widgets/flower_image.dart';
import 'package:flutter/material.dart';

class FlowerCard extends StatelessWidget {
  const FlowerCard({super.key, required this.flower, required this.onTap});

  final Flower flower;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius:  BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryDark.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: Offset(0, 6)
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20)
                    ),
                    child: Hero(
                      tag: 'flower-image-${flower.id}',
                      child: FlowerNetworkImage(
                        imageUrl: flower.imageUrl,
                        fallbackIcon: flower.icon,
                        fallbackColor: flower.color,
                      ),
                    ),
                  ),
                  // untuk mendifinisikan rating dan icon
                  Positioned(
                    top: 6,
                    left: 6,
                    child: Placeholder(),
                  ),
                  Positioned(
                    top: 6,
                    right: 6,
                    child: ValueListenableBuilder<Set<String>>(
                      valueListenable: Placeholder(),
                      builder: (context, favorites, _) {
                        final isFav = favorites.contains(flower.id);
                        return InkWell(
                          borderRadius: BorderRadius.circular(20),
                        )
                      },
                    ),
                  )
                ],
              )
              )
          ],
        ),
      ),
    );
  }
}