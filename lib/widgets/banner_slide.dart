import 'package:flowee_app/models/promo_banner.dart';
import 'package:flutter/material.dart';

class BannerSlide extends StatelessWidget {
  const BannerSlide({super.key, required this.banner});

  final PromoBanner banner;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(horizontal: 2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              banner.imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(color: banner.gradientColors.first), // untuk menampilkan warna ketika gambar tidak muncul
              loadingBuilder: (context, child, progress) {
                if (progress == null) return child; 
                return Container(color: banner.gradientColors.first); // untuk menampilkan warna ketika gambar sedang loading
              },
            ),
            /**
             * image.network yang akan dikombinasikan dengan stack dan gradiasi, dan akan diberi sentuhan transparasi
             */
            DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    banner.gradientColors.first.withValues(alpha: 0.92),
                    banner.gradientColors.last.withValues(alpha: 0.35),
                  ]
                )
              ),
             ),
             Padding(
              padding: EdgeInsets.fromLTRB(22, 20, 90, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    banner.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      height: 1.1
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    banner.subtitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.92),
                      fontSize: 13,
                      height: 1.35
                    ),
                  )
                ],
              ),
             )
          ],
        ),
      ),
    );
  }
}