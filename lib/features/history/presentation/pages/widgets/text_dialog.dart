import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:imzo/constants/image_constants.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';

class TextDialog extends StatefulWidget {
  const TextDialog({super.key, required this.title});
  final String title;
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<TextDialog> {

  @override
  Widget build(BuildContext context) => Dialog(
    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
    backgroundColor: AppColors.opacity,
    insetPadding: const EdgeInsets.symmetric(horizontal: 22),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        padding: const EdgeInsets.all(20),
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
            SizedBox(
              width: 50,
              height: 50,
              child: SvgPicture.asset(SvgIcons.icInfoCircle, color: AppColors.orangeStatus),
            ),
            AppUtils.kGap24,
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.black.withOpacity(0.5),
                  fontWeight: FontWeight.w400
              ),
            ),
            AppUtils.kGap12,
          ],
        ),
      ),
    ),
  );
}



