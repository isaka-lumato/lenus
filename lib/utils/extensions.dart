import 'dart:math' show Random;
import 'package:flutter/material.dart' show Color;

extension ColorExtension on Color {
  static Color get randomColor {
    Random random = Random();
    int randNumber = random.nextInt(randomColors.length);
    return randomColors[randNumber];
  }
}

extension IterableExtension<T> on Iterable<T> {
  Iterable<E> mapWithIndex<E>(E Function(int index, T value) f) {
    return Iterable.generate(length).map((i) => f(i, elementAt(i)));
  }
}

extension StringExtension on String {
  String get nextLine {
    if (length < 15) {
      return this;
    } else {
      return "${substring(0, 15)} \n${substring(15, length)}";
    }
  }
}

List<Color> randomColors = [
  const Color(0xFFFCE4EC),
  const Color(0xFFF3E5F5),
  const Color(0xFFEDE7F6),
  const Color(0xFFE3F2FD),
  const Color(0xFFE0F2F1),
  const Color(0xFFF1F8E9),
  const Color(0xFFFFF8E1),
  const Color(0xFFECEFF1),
];
