import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:hive/hive.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/extension/extension.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/history/presentation/model/for_me_history_response.dart";

class HistoryItemWidget extends StatelessWidget {
  const HistoryItemWidget({super.key, required this.onTap, this.responseData});

  final ForMeHistoryResponse? responseData;
  final GestureTapCallback onTap;

  Color statusBgColor() {
    switch (responseData?.status) {
      case "PENDING": return AppColors.orange.withOpacity(0.75);
      case "CREATOR_APPROVED": return AppColors.orangeStatus.withOpacity(0.75);
      case "RECIPIENT_APPROVED": return AppColors.orangeStatus.withOpacity(0.75);
      case "FULLY_APPROVED": return AppColors.greenStatus.withOpacity(0.75);
      case "CANCELLED": return AppColors.red.withOpacity(0.75);
      default: AppColors.opacity;
    }
    return AppColors.opacity;
  }


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
                    Flexible(
                      child: Text(
                        responseData?.templateName ?? "",
                        textAlign: TextAlign.start,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: statusBgColor(),
                      borderRadius: AppUtils.kBorderRadius4
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                    child: Text(responseData?.statusDescription ?? "", style: const TextStyle(fontSize: 14, color: AppColors.white)),
                  ),
                  AppUtils.kGap8,
                  Text(
                    formatDateFormat(responseData?.createdAt ?? ""),
                    textAlign: TextAlign.end,
                    style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
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
