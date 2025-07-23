import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({super.key, this.title, this.desc, this.icon, this.onTap});
  final String? title;
  final String? desc;
  final String? icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Container(
            height: 56,
            decoration: const BoxDecoration(borderRadius: AppUtils.kBorderRadius12),
            child: Row(
              children: [
                Flexible(
                  child: Row(
                    children: [
                      SvgPicture.asset(icon ?? ""),
                      AppUtils.kGap24,
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              title ?? "",
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            if (desc?.isNotEmpty ?? false) Text(
                              desc ?? "",
                              textAlign: TextAlign.start,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.grey2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.keyboard_arrow_right, color: AppColors.grey2.withOpacity(0.5))
              ],
            ),
          ),
          Divider(color: AppColors.grey2.withOpacity(0.2))
        ],
      ),
    ),
  );
}
