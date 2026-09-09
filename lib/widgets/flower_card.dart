import 'dart:ui_web';

import 'package:flowee_app/models/flower.dart';
import 'package:flowee_app/state/favorite_controller.dart';
import 'package:flowee_app/theme/app_theme.dart';
import 'package:flowee_app/widgets/flower_image.dart';
import 'package:flutter/material.dart';

// karena hanya menmaapilkan
class FlowerCard extends StatelessWidget {
  const FlowerCard({super.key, required this.flower, required this.onTap});

  final Flower flower;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryDark.withValues(alpha: 0.08),
              blurRadius: 16,
              offset: Offset(0, 6),
            ),
          ],
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
                      top: Radius.circular(20),
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
                  Positioned(
                    top: 8,
                    left: 8,
                    child: _RatingChip(rating: flower.rating), //pemanggil rating chip
                   ),
                   Positioned( //untuk tombol favorit 
                     top: 6,
                     right: 6,
                     child: ValueListenableBuilder<Set<String>>( //akan mendengar action, 
                      valueListenable: FavoriteController.instance, //favortitCnotroller .intance
                      builder: (context, favorites, _) {
                        final isFav = favorites.contains(flower.id);
                        return InkWell( //area yang sensitif dengan touch action
                          borderRadius: BorderRadius.circular(20), //widget yang bisa di dengar 
                          onTap: () => FavoriteController.instance.toggle(flower.id), //Favcontroller intance
                          child: CircleAvatar( //pewarnaan
                              radius: 16,
                              backgroundColor: Colors.white,
                              child: Icon(
                                isFav ? Icons.favorite : Icons.favorite_border,
                                size: 18,
                                color: isFav ? AppTheme.primary : Colors.grey,
                              ),
                          ), 
                        );
                      },
                     ),
                   )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    flower.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: AppTheme.textPrimary
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    formatRupiah(flower.price),
                    style: TextStyle(
                      color: AppTheme.primaryDark,
                      fontWeight: FontWeight.w800,
                      fontSize: 14,
                    ) ,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _RatingChip extends StatelessWidget {
  const _RatingChip({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, size: 13, color: Colors.amber),
          SizedBox(width: 3),
          Text(
            rating.toString(),
            style: TextStyle(
              color: Colors.white,
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}