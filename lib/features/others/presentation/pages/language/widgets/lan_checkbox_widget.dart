import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imzo/constants/image_constants.dart';
import 'package:imzo/core/extension/build_context_extension.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';

class LanCheckboxWidget extends StatelessWidget {
  const LanCheckboxWidget({
    required this.value,
    required this.onTap,
    required this.title,
    required this.image,
    super.key,
  });

  final GestureTapCallback? onTap;
  final bool value;
  final String title;
  final String image;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: const Color(0xffF4F7F4),
      borderRadius: AppUtils.kBorderRadius12,
      border: Border.all(color: !value ? const Color(0xff007BFF).withOpacity(0.3) : AppColors.opacity)
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
    margin: const EdgeInsets.symmetric(vertical: 5),
    height: 60,
    child: InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(image, width: 28, height: 28),
          AppUtils.kGap12,
          Text(
            title,
            style: context.theme.listTileTheme.leadingAndTrailingTextStyle,
          ),
          const Spacer(),
          if (!value) SvgPicture.asset(SvgIcons.icTickSquare)
        ],
      ),
    ),
  );
}