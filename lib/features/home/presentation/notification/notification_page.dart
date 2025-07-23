import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/inputs/custom_text_field.dart";
import "package:imzo/features/home/presentation/notification/widgets/notification_item_widget.dart";

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _PageState();
}

class _PageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(
        "Уведомление",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14
        ),
      ),
      backgroundColor: AppColors.baseColor.withOpacity(0.08),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(SvgIcons.icChecks, color: AppColors.baseColor),
        )
      ],
    ),
    body: ListView.separated(
      separatorBuilder: (_, __) => AppUtils.kGap,
      itemCount: 3,
      itemBuilder: (_, index) => NotificationItemWidget(),
    ),
  );
}
