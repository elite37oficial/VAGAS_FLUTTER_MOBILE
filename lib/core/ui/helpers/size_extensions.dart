import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  double get sWidth => MediaQuery.of(this).size.width;
  double get sHeight => MediaQuery.of(this).size.height;

  double percentWith(double percent) => sWidth * percent;
  double percentHeight(double percent) => sHeight * percent;
}
