import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/inputs/custom_text_field.dart";

class HistoryDeleteBottomSheet extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<HistoryDeleteBottomSheet> {

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(left: 34, right: 34, bottom: 50),
    decoration: const BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.only(topRight: Radius.circular(26), topLeft: Radius.circular(26))
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppUtils.kGap6,
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 42,
            height: 4,
            decoration: const BoxDecoration(
                color: AppColors.grey,
                borderRadius: AppUtils.kBorderRadius4
            ),
          ),
        ),
        AppUtils.kGap24,
        const Text(
          "Вы хотите удалить\n“Документ”?",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17
          ),
        ),
        AppUtils.kGap24,
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              height: 38,
              width: 100,
              backgroundColor: AppColors.red,
              borderRadius: AppUtils.kBorderRadius8,
              padding: EdgeInsets.zero,
              label: Text(
                "Принять",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17
                ),
              ),
            ),
            AppUtils.kGap40,
            CustomButton(
              height: 38,
              width: 100,
              padding: EdgeInsets.zero,
              borderRadius: AppUtils.kBorderRadius8,
              label: Text(
                "Отменить",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
