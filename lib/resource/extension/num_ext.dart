import 'package:flutter/material.dart';

extension NumExt on num {
  SizedBox get heightBox => SizedBox(
        height: toDouble(),
      );
      SizedBox get widthBox => SizedBox(
        height: toDouble(),
      );
}
