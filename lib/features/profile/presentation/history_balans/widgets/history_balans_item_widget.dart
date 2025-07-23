import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';

class HistoryBalansItemWidget extends StatelessWidget {
  const HistoryBalansItemWidget({
    required this.onTap,
    required this.title,
    required this.date,
    required this.sum,
    required this.icon,
    super.key,
  });

  final GestureTapCallback? onTap;
  final String title;
  final String date;
  final String sum;
  final String icon;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        color: AppColors.baseColor.withOpacity(0.08),
        borderRadius: AppUtils.kBorderRadius6,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          AppUtils.kGap8,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                date,
                style: const TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            sum,
            style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    ),
  );
}