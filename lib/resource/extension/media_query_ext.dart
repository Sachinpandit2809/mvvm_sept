import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

extension MediaQueryExt on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
