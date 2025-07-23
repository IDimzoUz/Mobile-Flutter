import 'package:flutter/material.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';

class DateItemWidget extends StatelessWidget {
  const DateItemWidget({super.key});

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    margin: const EdgeInsets.symmetric(vertical: 8),
    decoration: const BoxDecoration(
      color: AppColors.white,
      borderRadius: AppUtils.kBorderRadius48,
    ),
    height: 28,
    child: const Center(
      child: Text(
        "Декабрь 2024",
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}