import 'package:flutter/material.dart';
import "package:flutter_svg/flutter_svg.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/extension/build_context_extension.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    super.key,
    required this.onTapContinue,
    required this.onTapEnd,
  });

  final VoidCallback onTapContinue;
  final VoidCallback onTapEnd;


  @override
  Widget build(BuildContext context) => Dialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        backgroundColor: AppColors.opacity,
        insetPadding: const EdgeInsets.symmetric(horizontal: 40),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: AppUtils.kBorderRadius22,
            gradient: LinearGradient(
              colors: [Color(0xff32B141), Color(0xff154B1C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: AppUtils.kPaddingAll16,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppUtils.kGap24,
                const Text(
                  "Skanerlash muvaffaqiyatli yakunlandi",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                      color: Colors.white,
                    fontWeight: FontWeight.w700
                  ),
                ),
                AppUtils.kGap12,
                const Text(
                  "Yaxshi, siz davom ettirishingiz yoki boshqa yuzni skanerlashingiz mumkin",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.w500
                  ),
                ),
                AppUtils.kGap24,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: CustomButton(
                        onPressed: onTapEnd,
                        width: 140,
                        height: 52,
                        borderColor: AppColors.white,
                        borderButton: true,
                        shadowEnabled: false,
                        backgroundColor: AppColors.opacity,
                        label:  Text(context.tr("Tugatish"), style:const TextStyle(color: Colors.white),),
                      ),
                    ),
                    AppUtils.kGap8,
                    Expanded(
                      child: CustomButton(
                        onPressed: onTapContinue,
                        width: 140,
                        height: 52,
                        shadowEnabled: false,
                        backgroundColor: AppColors.white,
                        label: Text(
                          context.tr("Davom etish"),
                          style: TextStyle(
                            color: AppColors.black
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
}
