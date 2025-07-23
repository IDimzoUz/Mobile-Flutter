import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:hive/hive.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({super.key, required this.onTap});

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          decoration: const BoxDecoration(borderRadius: AppUtils.kBorderRadius12),
          child: Row(
            children: [
              Flexible(
                child: Row(
                  children: [
                    SvgPicture.asset(SvgIcons.icHistory),
                    AppUtils.kGap8,
                    const Flexible(
                      child: Text(
                        "Контракт на деньги",
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.baseColor,
                      borderRadius: AppUtils.kBorderRadius4
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    child: const Text("Одобренный", style: TextStyle(fontSize: 14, color: AppColors.white)),
                  ),
                  AppUtils.kGap8,
                  Text("25 Янв 12:28", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ],
              ),
            ],
          ),
        ),
        Divider(color: AppColors.grey2.withOpacity(0.2))
      ],
    ),
  );

}
