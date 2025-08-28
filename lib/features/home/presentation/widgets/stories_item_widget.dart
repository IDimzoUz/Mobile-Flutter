import 'package:flutter/material.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';
import 'package:imzo/core/widgets/custom_cached_network_image.dart';
import 'package:imzo/features/home/model/news_response.dart';

class StoriesItemWidget extends StatelessWidget {
  const StoriesItemWidget({super.key, this.data, required this.onTap});
  final NewsResponse? data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xffF4F7F4),
            borderRadius: AppUtils.kBorderRadius64,
            border: Border.all(color: !(data?.viewed ?? false) ? AppColors.baseColor : AppColors.opacity)
          ),
          margin: const EdgeInsets.symmetric(horizontal: 6),
          height: 66,
          width: 66,
          child: ClipRRect(
            borderRadius: AppUtils.kBorderRadius48,
            child: CustomCachedNetworkImage(imageUrl: data?.mediaUrl ?? "", fit: BoxFit.fill),
          ),
        ),
      ),
      AppUtils.kGap6,
      Text(
        data?.title?.uz ?? "",
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
      ),
    ],
  );
}