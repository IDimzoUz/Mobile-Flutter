import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:imzo/constants/image_constants.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';
import 'package:imzo/core/widgets/buttons/custom_button.dart';

class ApprovedDialog extends StatefulWidget {
  const ApprovedDialog({super.key, required this.title, required this.desc, required this.approved, this.onTap});
  final String title;
  final String desc;
  final bool approved;
  final VoidCallback? onTap;
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<ApprovedDialog> {

  @override
  Widget build(BuildContext context) => Dialog(
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
    backgroundColor: AppColors.opacity,
    insetPadding: const EdgeInsets.symmetric(horizontal: 22),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: AppUtils.kBorderRadius12,
            color: AppColors.white
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppUtils.kGap12,
            SvgPicture.asset(widget.approved ? SvgIcons.icTaskDone : SvgIcons.icRouteBlock),
            AppUtils.kGap24,
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 18,
                  color: AppColors.blackBold,
                  fontWeight: FontWeight.w500
              ),
            ),
            AppUtils.kGap4,
            Text(
              widget.desc,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 14,
                  color: AppColors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w400
              ),
            ),
            AppUtils.kGap24,
            const Divider(color: AppColors.grey2),
            Row(
              children: [
                Flexible(
                  child: CustomButton(
                    backgroundColor: AppColors.opacity,
                    onPressed: () => (!widget.approved) ? context.pop() : null,
                    label: Text(
                      "Qaytish",
                      style: TextStyle(
                        color: !widget.approved ? AppColors.baseColor : AppColors.grey2
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 1,
                  height: 54,
                  color: AppColors.grey2,
                ),
                Flexible(
                  child: CustomButton(
                    backgroundColor: AppColors.opacity,
                    onPressed: () => (widget.approved) ? widget.onTap : null,
                    label: Text(
                      "Davom etish",
                      style: TextStyle(color: widget.approved ? AppColors.baseColor : AppColors.grey2),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}



