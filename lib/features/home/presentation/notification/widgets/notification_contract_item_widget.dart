import "package:flutter/material.dart";
import "package:imzo/core/extension/extension.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/bottom_sheet/custom_bottom_sheet.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/home/model/notifications_response.dart";
import "package:imzo/features/home/presentation/notification/widgets/notification_note_bottom_sheet.dart";

class NotificationContractItemWidget extends StatelessWidget {
  const NotificationContractItemWidget({super.key, this.data, this.onTapOpen, this.onTapDelete});

  final Content? data;
  final VoidCallback? onTapOpen;
  final VoidCallback? onTapDelete;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
    color: (data?.isRead ?? true) ? AppColors.opacity : AppColors.baseColor.withOpacity(0.08),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppUtils.kGap8,
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                data?.title ?? "",
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            Text(
              formatTimeAgo(data?.createdAt ?? ""),
              textAlign: TextAlign.start,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        AppUtils.kGap8,
        Row(
          children: [
            CustomButton(
              width: 120,
              height: 38,
              borderRadius: AppUtils.kBorderRadius8,
              onPressed: onTapOpen,
              label: const Text(
                "Открытие",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
            AppUtils.kGap8,
            CustomButton(
              width: 120,
              height: 38,
              backgroundColor: AppColors.red,
              borderRadius: AppUtils.kBorderRadius8,
              onPressed: onTapDelete,
              label: const Text(
                "Отменить",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
        AppUtils.kGap24,
        Divider(color: AppColors.grey2.withOpacity(0.2))
      ],
    ),
  );
}
