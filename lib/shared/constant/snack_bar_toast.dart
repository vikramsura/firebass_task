import 'package:flutter/material.dart';
import 'package:task_firebase/shared/constant/colors.dart';

class AppSnackBarToast {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
      showSnackBarToast(BuildContext context, title) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 1),
        content: Text(title),
        backgroundColor: AppColor.borderColor(context),
      ),
    );
  }
}
