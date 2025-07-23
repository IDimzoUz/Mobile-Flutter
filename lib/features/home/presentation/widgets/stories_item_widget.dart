import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imzo/constants/image_constants.dart';
import 'package:imzo/core/extension/build_context_extension.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';

class StoriesItemWidget extends StatelessWidget {
  const StoriesItemWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: const Color(0xffF4F7F4),
          borderRadius: AppUtils.kBorderRadius64,
          border: Border.all(color: AppColors.baseColor)
        ),
        margin: const EdgeInsets.symmetric(horizontal: 6),
        height: 66,
        width: 66,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(ImagesUrl.icImzoLogo),
        ),
      ),
      AppUtils.kGap6,
      Text(
        "Yangilik",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}