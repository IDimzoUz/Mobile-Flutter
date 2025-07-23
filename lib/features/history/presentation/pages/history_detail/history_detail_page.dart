import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/inputs/custom_text_field.dart";
import "package:imzo/features/history/presentation/pages/widgets/history_detail_item_widget.dart";
import "package:imzo/features/home/presentation/notification/widgets/notification_item_widget.dart";

class HistoryDetailPage extends StatefulWidget {
  const HistoryDetailPage({super.key});

  @override
  State<HistoryDetailPage> createState() => _PageState();
}

class _PageState extends State<HistoryDetailPage> {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(
        "Документы",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14
        ),
      ),
      backgroundColor: AppColors.baseColor.withOpacity(0.08),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.info_outlined),
        )
      ],
    ),
    body: Stack(
      alignment: Alignment.bottomRight,
      children: [
        ListView.separated(
          separatorBuilder: (_, __) => AppUtils.kGap,
          itemCount: 1,
          padding: const EdgeInsets.symmetric(vertical: 30),
          itemBuilder: (_, index) => const HistoryDetailItemWidget(),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 42, right: 20),
          child: CustomButton(
            width: 65,
            height: 65,
            padding: EdgeInsets.zero,
            borderRadius: AppUtils.kBorderRadius48,
            backgroundColor: AppColors.baseColor.withOpacity(0.1),
            label: const Icon(Icons.add, size: 43, color: AppColors.baseColor),
          ),
        ),
      ],
    ),
  );
}
