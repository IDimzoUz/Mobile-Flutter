import "package:flutter/material.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/bottom_sheet/custom_bottom_sheet.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/home/presentation/notification/widgets/notification_note_bottom_sheet.dart";

class NotificationContractItemWidget extends StatelessWidget {
  const NotificationContractItemWidget({super.key, this.title});
  final String? title;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
    color: AppColors.baseColor.withOpacity(0.08),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppUtils.kGap8,
        const Text(
          "Прибыл новый контракт, ожидающий вашего подтверждения",
          textAlign: TextAlign.start,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        AppUtils.kGap8,
        Row(
          children: [
            CustomButton(
              width: 120,
              height: 38,
              borderRadius: AppUtils.kBorderRadius8,
              onPressed: () {

              },
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
              onPressed: () async { },
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
