import 'package:flutter/material.dart';

import '../models/flower.dart';
import '../models/promo_banner.dart';

class DummyUser {
  static const String email = 'demo@flowee.com';
  static const String password = 'flowee123';
  static const String name = 'Demo User';
}

final List<Flower> dummyFlowers = [
  Flower(
    id: 'f1',
    name: 'Mawar Merah',
    category: 'Bunga Potong',
    price: 45000,
    rating: 4.8,
    description: 'Mawar merah segar melambangkan cinta dan kasih sayang. Cocok untuk hadiah spesial, perayaan, atau sekadar mempercantik ruangan.',
    imageUrl: 'https://img.pikbest.com/origin/09/17/05/62EpIkbEsTQ8w.jpg!bw800',
    icon: Icons.local_florist,
    color: Colors.red.shade300,
  ),
  Flower(
    id: 'f2',
    name: 'Tulip Kuning',
    category: 'Bunga Potong',
    price: 60000,
    rating: 4.6,
    description: 'Tulip kuning ceria membawa nuansa hangat dan bahagia. Sempurna untuk mengucapkan selamat atau memberi semangat.',
    imageUrl: 'https://images.unsplash.com/photo-1442277469952-8741efd843b2?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    icon: Icons.local_florist,
    color: Colors.amber.shade400,
  ),
  Flower(
    id: 'f3',
    name: 'Anggrek Ungu',
    category: 'Tanaman Hias',
    price: 120000,
    rating: 4.9,
    description: 'Anggrek ungu elegan yang tahan lama, cocok sebagai penghias meja kerja maupun ruang tamu.',
    imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/83/Anggrek_Bulan_Ungu_%28Phalaenopsis_cultivar%29.jpg?utm_source=id.wikipedia.org&utm_campaign=index&utm_content=original',
    icon: Icons.spa,
    color: Colors.deepPurple.shade300,
  ),
  Flower(
    id: 'f4',
    name: 'Matahari (Sunflower)',
    category: 'Bunga Potong',
    price: 35000,
    rating: 4.7,
    description: 'Bunga matahari yang cerah dan besar, simbol kebahagiaan dan optimisme. Cocok untuk mempercantik hari-harimu.',
    imageUrl: 'https://akcdn.detik.net.id/community/media/visual/2023/01/18/bunga-matahari.png?w=700&q=90',
    icon: Icons.wb_sunny,
    color: Colors.orange.shade400,
  ),
  Flower(
    id: 'f5',
    name: 'Lily Putih',
    category: 'Bunga Potong',
    price: 55000,
    rating: 4.5,
    description: 'Lily putih yang anggun dan wangi, sering digunakan untuk acara formal maupun ucapan belasungkawa.',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0724/4637/8302/files/header-bunga-yang-melambangkan-kebahagiaan_480x480.jpg?v=1683023707',
    icon: Icons.local_florist,
    color: Colors.grey.shade300,
  ),
  Flower(
    id: 'f6',
    name: 'Lavender',
    category: 'Tanaman Hias',
    price: 40000,
    rating: 4.4,
    description: 'Lavender dengan aroma menenangkan, cocok untuk relaksasi dan mempercantik taman kecil di rumah.',
    imageUrl: 'https://loremflickr.com/640/480/lavender?lock=1',
    icon: Icons.grass,
    color: Colors.purple.shade200,
  ),
  Flower(
    id: 'f7',
    name: 'Peony Pink',
    category: 'Bunga Potong',
    price: 75000,
    rating: 4.9,
    description: 'Peony pink dengan kelopak berlapis yang mewah, favorit untuk dekorasi pernikahan dan acara spesial.',
    imageUrl: 'https://loremflickr.com/640/480/peony?lock=1',
    icon: Icons.local_florist,
    color: Colors.pink.shade200,
  ),
  Flower(
    id: 'f8',
    name: 'Daisy Putih',
    category: 'Bunga Potong',
    price: 30000,
    rating: 4.3,
    description: 'Daisy putih yang manis dan sederhana, cocok untuk buket kasual sehari-hari.',
    imageUrl: 'https://www.herworld.co.id/gallery/teaser/anastazie-novotna-_lnLMLVF3FQ-unsplash_6120241001135731tjFi6a.jpg',
    icon: Icons.local_florist,
    color: Colors.teal.shade200,
  ),
];

final List<PromoBanner> dummyBanners = [
  PromoBanner(
    title: 'Diskon 20%',
    subtitle: 'Untuk semua buket mawar minggu ini',
    imageUrl: 'https://img.pikbest.com/origin/09/17/05/62EpIkbEsTQ8w.jpg!bw800',
    gradientColors: [Color(0xFFE85C8A), Color(0xFFB23A63)],
  ),
  PromoBanner(
    title: 'Koleksi Pernikahan',
    subtitle: 'Rangkaian bunga eksklusif untuk hari bahagiamu',
    imageUrl: 'https://loremflickr.com/640/480/peony?lock=1',
    gradientColors: const [Color(0xFF8E5FBF), Color(0xFF5B3A87)],
  ),
  PromoBanner(
    title: 'Gratis Ongkir',
    subtitle: 'Se-Jabodetabek untuk pembelian di atas Rp100.000',
    imageUrl: 'https://loremflickr.com/640/480/sunflower?lock=1',
    gradientColors: const [Color(0xFFE8A33D), Color(0xFFC97A1F)],
  ),
];