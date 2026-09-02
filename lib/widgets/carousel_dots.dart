import 'package:flutter/material.dart';

class CarouselDots extends StatelessWidget {
  const CarouselDots({super.key, required this.count, required this.activeIndex, required this.activeColor});

  final int count;
  final int activeIndex;
  final Color activeColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(count, (index) {
        final isActive = index == activeIndex;
        return AnimatedContainer(
          duration: Duration(milliseconds: 250),
          margin: EdgeInsets.symmetric(horizontal: 3),
          width: isActive ? 20 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: isActive ? activeColor : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(3)
          ),
         );
      }),
    );
  }
}