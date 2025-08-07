import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';
import 'package:lottie/lottie.dart';


class LoadingDialog extends StatefulWidget {
  const LoadingDialog({
    super.key,
    this.onTapAdd,
  });
  final VoidCallback? onTapAdd;

  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<LoadingDialog> {

  @override
  Widget build(BuildContext context) => Dialog(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    backgroundColor: AppColors.opacity,
    insetPadding: const EdgeInsets.symmetric(horizontal: 22),
    child: BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        decoration: const BoxDecoration(
            borderRadius: AppUtils.kBorderRadius12,
            color: AppColors.white
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppUtils.kGap12,
            CircularProgressIndicator(color: AppColors.baseColor),
            AppUtils.kGap24,
            Text(
              "Iltimos kutib turing...",
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.blackBold,
                  fontWeight: FontWeight.w500
              ),
            ),
            AppUtils.kGap24,
          ],
        ),
      ),
    ),
  );
}



