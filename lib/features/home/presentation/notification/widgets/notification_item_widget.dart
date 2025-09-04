import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:imzo/core/extension/extension.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/bottom_sheet/custom_bottom_sheet.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/home/model/notifications_response.dart";
import "package:imzo/features/home/presentation/notification/widgets/notification_note_bottom_sheet.dart";

class NotificationItemWidget extends StatelessWidget {
  const NotificationItemWidget({super.key, this.data});

  final Content? data;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
    color: (data?.isRead ?? true) ? AppColors.opacity : AppColors.baseColor.withOpacity(0.08),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              data?.title ?? "",
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Text(
              formatTimeAgo(data?.createdAt ?? ""),
              textAlign: TextAlign.start,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        AppUtils.kGap8,
        Text(
          data?.body ?? "",
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        AppUtils.kGap8,
        // CustomButton(
        //   width: 120,
        //   height: 38,
        //   borderRadius: AppUtils.kBorderRadius8,
        //   onPressed: () async {
        //     await customModalBottomSheet<void>(
        //       context: context,
        //       backgroundColor: Colors.transparent,
        //       builder: (BuildContext ctx, _) => NotificationNoteBottomSheet(),
        //     );
        //   },
        //   label: Text(
        //     "Попробуй",
        //     style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        //   ),
        // ),
        AppUtils.kGap24,
        Divider(color: AppColors.grey2.withOpacity(0.2))
      ],
    ),
  );
}
