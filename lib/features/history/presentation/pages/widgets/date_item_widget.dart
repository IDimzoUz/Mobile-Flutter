import 'package:flutter/material.dart';
import 'package:imzo/core/extension/extension.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';

class DateItemWidget extends StatelessWidget {
  const DateItemWidget({super.key, required this.title, required this.colorSelect, required this.onTap});
  final String title;
  final bool colorSelect;
  final VoidCallback onTap;


  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: colorSelect ? AppColors.baseColor : AppColors.white,
        borderRadius: AppUtils.kBorderRadius48,
      ),
      height: 28,
      child: Center(
        child: Text(
          capitalizeFirstLetter(title),
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: colorSelect ? AppColors.white : AppColors.black
          ),
        ),
      ),
    ),
  );
}