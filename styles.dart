import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    color: AppColors.grey,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle bmiValue = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: AppColors.primary,
  );

  static const TextStyle bmiCategory = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.grey,
  );
}
