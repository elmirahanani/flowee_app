import 'package:flowee_app/theme/app_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryChipList extends StatelessWidget {
  const CategoryChipList({super.key, required this.categories, required this.selectedCategory, required this.onSelected});

  final List<String> categories;
  final String selectedCategory;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      // semua list, ListView.sepateted dipakai untuk menampilkan list dengan action yang berbeda, menyatu tpi terpisah
      // listview biasa hanya untuk menampilkan
      child: ListView.separated(
        // untuk menjawab pertanyaan, berapa banyak / panjang data yang diinginkan
        itemCount: categories.length,
        // separator -> apa yang membuat widget ada jaraknya
        separatorBuilder: (_, _) => SizedBox(width: 8),
        itemBuilder: (context, index) {
          final category = categories[index];
          // untuk menyamakan antara category dan category yang dipilih
          final isSelected = category == selectedCategory;
          return ChoiceChip(
            label: Text(category),
            selected: isSelected,
            onSelected: (_) => onSelected(category),
            selectedColor: AppTheme.primary,
            // tanda centang, false karena tidak ingin ditampilkan
            showCheckmark: false,
            // untuk mengubah ketika dipilih
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : AppTheme.textPrimary,
              fontWeight: FontWeight.w600,
              fontSize: 13
            ),
            backgroundColor: isSelected ? AppTheme.primary : AppTheme.primarySoft.withValues(alpha: 0.5),
            side: BorderSide.none,
            elevation: 0, // efek yang akan dilakukan ketika tidak di klik dan di klik
            pressElevation: 0,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          );
        },
      ),
    );
  }
}