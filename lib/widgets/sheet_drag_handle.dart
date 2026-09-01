import 'package:flutter/material.dart';

// garis kecil abu dibagian atas atau sebuah "shee UI" sebagai tanda, bahwa screen bisa di drag
class SheetDragHandle extends StatelessWidget {
  const SheetDragHandle({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 44,
        height: 5,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(3)
        ),
      ),
    );
  }
}