import 'package:flutter/material.dart';

class FavoriteController extends ValueNotifier<Set<String>> {
  FavoriteController._() : super(<String>{});

  static final FavoriteController instance = FavoriteController._();

  bool isFavorite(String id) => value.contains(id);

  void toggle(String id) {
    final updated = Set<String>.from(value);
    if (!updated.remove(id)) {
      updated.add(id);
    }
    value = updated;
  }
}