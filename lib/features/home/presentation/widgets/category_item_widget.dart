import 'package:flutter/material.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';
import 'package:imzo/features/home/model/category_response.dart';

class CategoryItemWidget extends StatelessWidget {
  const CategoryItemWidget({super.key, this.data, this.onTap});

  final CategoryResponse? data;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppUtils.kBorderRadius8,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 5,
            color: AppColors.grey2.withOpacity(0.5)
          )
        ]
      ),
      height: 44,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
      child: Center(
        child: Text(
          data?.nameUz ?? "",
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    ),
  );
}