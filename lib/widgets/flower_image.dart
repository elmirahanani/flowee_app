import 'package:flutter/material.dart';

/**
 * untuk menampilkan gambar dari URL internet
 * 1. sedang dimuat: menampilkan indikator loading
 * 2. gagal dimuat: menampilkan icon pengganti
 */
class FlowerNetworkImage extends StatelessWidget {
  const FlowerNetworkImage({
    super.key, 
    required this.imageUrl, required this.fallbackIcon, required this.fallbackColor, required this.fit,
    });

    final String imageUrl;
    final IconData fallbackIcon;
    final Color fallbackColor;
    final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      fit: fit,
      width: double.infinity,
      height: double.infinity,
      // loading indikator, yang akan dijalankan terus menerus oleh flutter, selama gambarnya masih proses download dari internet
      loadingBuilder: (context, child, progress) {
        if (progress == null) return child;
        return _Placeholder(
          color: fallbackColor,
          child: SizedBox(
            width: 22,
            height: 22,
            child: CircularProgressIndicator(
              strokeWidth: 2.2,
              color: fallbackColor,
              // kalau flutter tau ukuran total file, maka akan menghitung proses download gambar
              // kalau flutter tidak tau total file, makan akan mengembalikan null
              value: progress.expectedTotalBytes != null ? progress.cumulativeBytesLoaded / progress.expectedTotalBytes! : null,
            ),
          ),
        );
      },
      // error builder yang akan dipanggil jika proses DI ATAS (loading gambar) GAGAL TOTAL
      errorBuilder: (context, error, stackTrace) {
        return _Placeholder(
          color: fallbackColor,
          child: Icon(fallbackIcon, size: 48, color: fallbackColor),
        );
      },
    );
  }
}

class _Placeholder extends StatelessWidget {
  const _Placeholder({required this.color, required this.child});

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color.withValues(alpha: 0.18),
      alignment: Alignment.center,
      child: child,
    );
  }
}