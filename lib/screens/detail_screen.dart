import 'package:flowee_app/models/flower.dart';
import 'package:flowee_app/theme/app_theme.dart';
import 'package:flowee_app/widgets/detail_header.dart';
import 'package:flowee_app/widgets/detail_total.dart';
import 'package:flowee_app/widgets/product_summary.dart';
import 'package:flowee_app/widgets/quantity_stepper.dart';
import 'package:flowee_app/widgets/sheet_drag_handle.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.flower});

  final Flower flower;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // nilai ini HIDUP selama widget state ini ada setiap kali diubah oleh set State, flutter akan melakukan rebuild supaya tampilan ikut terupdate
  int _quantity = 1;

  // init state = ada perubahan, sementara set state = setelah ada perubahan
  void _increment() => setState(
    () => _quantity++,
  ); // quantity++ akan dijalankan jika ada increment quantity dijalankan
  // decrement hanya bisa dilakukan setidak tidaknya quantity nya lebih dari 1
  void _decrement() {
    if (_quantity > 1) {
      setState(() => _quantity--);
    }
  }

  void _addToCart() {
    final flower = widget.flower;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // content apa yang mau ditampilkan di SnackBar
        content: Text('$_quantity x ${flower.name} ditambhkan ke keranjang'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final flower = widget.flower;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          DetailHeader(
            flower: flower,
            onBack: () => Navigator.of(context).pop(),
          ),
          // untuk memenuhi semua ruang kosong yang ada
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              // memudahkan untuk bisa di scroll
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(22, 22, 22, 24),
                // child -> untuk memanggil sebuah widget tanpa ada properti yang spesifik
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SheetDragHandle(),
                    SizedBox(height: 20),
                    ProductSummary(flower: flower),
                    SizedBox(height: 22),
                    Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    // untuk memanggil flower description
                    SizedBox(height: 8),
                    Text(
                      flower.description,
                      style: TextStyle(
                        color: AppTheme.textSecondary,
                        height: 1.6,
                        fontSize: 13.5,
                      ),
                    ),
                    SizedBox(height: 8),
                    QuantityStepper(
                      quantity: _quantity,
                      onIncrement: _increment,
                      onDecrement: _decrement,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      // define lokasi dan menambahkan feb
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addToCart,
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white, // depan
        elevation: 2,
        icon: Icon(Icons.shopping_bag_outlined, size: 20),
        label: Text('Tambah', style: TextStyle(fontWeight: FontWeight.w700)),
      ),
      bottomNavigationBar: DetailTotalBar(totalPrice: flower.price * _quantity),
    );
  }
}
