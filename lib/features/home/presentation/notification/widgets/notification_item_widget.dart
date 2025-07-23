import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/bottom_sheet/custom_bottom_sheet.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/home/presentation/notification/widgets/notification_note_bottom_sheet.dart";

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({super.key, this.title, this.desc});
  final String? title;
  final String? desc;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
    color: AppColors.baseColor.withOpacity(0.08),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Оповещение о новой функции!",
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(
              "14h",
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        AppUtils.kGap8,
        Text(
          "Мы рады представить последние улучшения в нашей работе с шаблонами.",
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        AppUtils.kGap8,
        CustomButton(
          width: 120,
          height: 45,
          borderRadius: AppUtils.kBorderRadius8,
          onPressed: () async {
            await customModalBottomSheet<void>(
              context: context,
              backgroundColor: Colors.transparent,
              builder: (BuildContext ctx, _) => NotificationNoteBottomSheet(),
            );
          },
          label: Text(
            "Попробуй",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        AppUtils.kGap24,
        Divider(color: AppColors.grey2.withOpacity(0.2))
      ],
    ),
  );
}
