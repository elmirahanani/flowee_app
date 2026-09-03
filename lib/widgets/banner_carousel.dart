import 'dart:async';

import 'package:flowee_app/models/promo_banner.dart';
import 'package:flowee_app/widgets/banner_slide.dart';
import 'package:flowee_app/widgets/carousel_dots.dart';
import 'package:flutter/material.dart';

// carousel banner, akan bergeser otomatis setiap beberapa detik, untuk timer seperti ini, kita butuh peran StatefulWidget untuk perubahan widget pada layar
class BannerCarousel extends StatefulWidget {
  const BannerCarousel({super.key, required this.banners});

  final List<PromoBanner> banners;

  @override
  State<BannerCarousel> createState() => _BannerCarouselState();
}

class _BannerCarouselState extends State<BannerCarousel> {
  /**
   * PageController --> untuk mengatur slide mana yang sedang tampil di PageView
   */

  late final PageController _controller = PageController();
  Timer? _timer; 
  int _page = 0;

  @override
  void initState() {
    super.initState(); 
    // Timer.Periodic --> akan menjalankan fungsi di dalamnya secara berulang-ulang
    _timer = Timer.periodic(Duration(seconds: 4), (_) {
      // pengecekan apakah widget masih ada di layar, dan apakah list banner kosong atau tidak, tidak akan mereturn apapun
      if (!mounted || widget.banners.isEmpty) return; // true
      // mengatur page selanjutnya, jika sudah sampai di akhir list, maka akan kembali ke awal
      final next = (_page + 1) % widget.banners.length; // false, untuk mengambil index selanjutnya agar tidak lebih dari yang dipunya
      // untuk mengatur page yang sedang ditampilkan, (slide), _controller adalah
      _controller.animateToPage(
        next,
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic
      );
    });
  }

  @override
  /**
   * Timer HARUS dicancel saat widget dihancurkan (tidak tampil dilayar). Kalau lupa timer akan terus mencoba jalan di latar belakang (background),
   * walau carouselnya sudah tidak muncul di layar, ini salah satu penyebab umum memory leak di flutter.
   */

  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    // untuk benar benar mengpause
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.banners.isEmpty) return const SizedBox.shrink(); 
      
    return Column(
      children: [
        SizedBox(
          height: 168,
          child: PageView.builder(
            controller: _controller,
            // untuk memberi tahu berapa item yang ingin ditampilkan
            itemCount: widget.banners.length, // legnth untuk mengukur panjang index list, agar tidak error saat index melebihi panjang list
            /**
             * dipanggil juga saat pengguna SWIPE manual, bukan cuman saat digeser otomatis oleh timer, supaya titik indikator dibawah selalu sinkron dengan slide benar benar tampil
             * initState dipanggil saat belum ada perubahan
             * setState dipanggil saat setelah ada perubahan
             */
            onPageChanged: (index) => setState(() => _page = index),
            itemBuilder: (context, index) => BannerSlide(banner: widget.banners[index]),
          ),
        ),
        SizedBox(height: 10,),
        CarouselDots(count: widget.banners.length,
        activeIndex: _page,
        activeColor: widget.banners[_page].gradientColors.first,
        )
      ],
    );
  }
}