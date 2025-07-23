import "package:flutter/material.dart";
import "package:hive/hive.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/inputs/custom_text_field.dart";

class NotificationNoteBottomSheet extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<NotificationNoteBottomSheet> {

  final FocusNode _focusNode = FocusNode();
  bool isKeyboardOpen(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.only(left: 34, right: 34, bottom: 50),
    decoration: const BoxDecoration(
      color: AppColors.white,
      borderRadius: BorderRadius.only(topRight: Radius.circular(26), topLeft: Radius.circular(26))
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        AppUtils.kGap16,
        const Text(
          "Примечание",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16
          ),
        ),
        AppUtils.kGap12,
        CustomTextField(
          currentFocus: _focusNode,
          hintText: "Написать комментарий",
          fillColor: AppColors.white,
          cursorColor: AppColors.grey2,
          maxLines: 10,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.baseColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.lightGrey),
          ),
        ),
        AppUtils.kGap24,
        const CustomButton(
          height: 50,
          label: Text(
            "Отправлять",
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16
            ),
          ),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 10),
          height: isKeyboardOpen(context) ? MediaQuery.of(context).viewInsets.bottom : 0,
        )
      ],
    ),
  );
}
