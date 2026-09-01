import 'package:flutter/material.dart';

// ini adalah tombol bulat dengan icon ditengahnya yang muncul di beberapa screen
class CircleIconButton extends StatelessWidget {
  const CircleIconButton({super.key, required this.icon, required this.onTap, required this.iconColor});

  final IconData icon;
  final VoidCallback onTap;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: CircleBorder(),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 10,
              offset: Offset(0, 3)
            )
          ]
        ),
        child: Icon(icon, size: 20, color: iconColor),
      ),
    );
  }
}