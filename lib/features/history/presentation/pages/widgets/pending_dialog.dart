import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';
import 'package:lottie/lottie.dart';


class PendingDialog extends StatefulWidget {
  const PendingDialog({super.key});

  @override
  _LoadingDialogState createState() => _LoadingDialogState();
}

class _LoadingDialogState extends State<PendingDialog> {

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            AppUtils.kGap12,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CloseButton(color: AppColors.opacity),
                const CircularProgressIndicator(color: AppColors.baseColor),
                CloseButton(
                  onPressed: () {
                    context.pop();
                    context.pop();
                  },
                )
              ],
            ),
            AppUtils.kGap24,
            const Text(
              "Ikkinchi tomondan tasdiqlash kutilmoqda!",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 18,
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



