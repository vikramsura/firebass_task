
import 'package:flutter/material.dart';
import 'package:task_firebase/shared/constant/colors.dart';
import 'package:task_firebase/shared/constant/font_size.dart';

class AppButtons {
  static Container elevatedButton(text,context) {
    return Container(
      height: AppFontSize.font50,
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(AppFontSize.font14),
      ),
      child: Center(child: Text(text,style: TextStyle(
          color: AppColors.white,
          fontSize: AppFontSize.font18,
          fontWeight: FontWeight.bold))),
    );
  }
}
