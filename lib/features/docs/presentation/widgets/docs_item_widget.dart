import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imzo/constants/image_constants.dart';
import 'package:imzo/core/extension/build_context_extension.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';

class DocsItemWidget extends StatelessWidget {
  const DocsItemWidget({
    required this.value,
    required this.onTap,
    required this.title,
    super.key,
  });

  final GestureTapCallback? onTap;
  final bool value;
  final String title;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.baseColor.withOpacity(0.08),
        borderRadius: AppUtils.kBorderRadius12,
        border: Border.all(color: AppColors.baseColor)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 17),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500
        ),
      ),
    ),
  );
}