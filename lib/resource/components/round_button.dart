import 'package:flutter/material.dart';
import 'package:mvvm_sept/resource/colors/app_colors.dart';

class RoundButton extends StatelessWidget {
  VoidCallback onPress;
  bool loading;
  String title;
  RoundButton(
      {super.key,
      required this.onPress,
      required this.title,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 45,
        width: 160,
        decoration: BoxDecoration(
            color: AppColors.yellowColor,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: loading ? const CircularProgressIndicator() : Text(title),
        ),
      ),
    );
  }
}
