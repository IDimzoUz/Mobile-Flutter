import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imzo/constants/image_constants.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';

class OptionsCheckboxWidget extends StatelessWidget {
  const OptionsCheckboxWidget({
    this.value = false,
    required this.onTap,
    required this.title,
    required this.borderColor,
    super.key,
  });

  final GestureTapCallback? onTap;
  final bool value;
  final String title;
  final Color borderColor;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppUtils.kBorderRadius12,
        border: Border.all(color: borderColor)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      margin: const EdgeInsets.symmetric(vertical: 5),
      height: 60,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 12
              ),
            ),
          ),
          if (value) SvgPicture.asset(SvgIcons.icCheckBox) else SvgPicture.asset(SvgIcons.icCheckBoxEmpty,)
        ],
      ),
    ),
  );
}