import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/inputs/custom_text_field.dart";
import "package:imzo/features/profile/presentation/edit_profile/widgets/edit_profile_item_widget.dart";

class IdentificationPage extends StatefulWidget {
  const IdentificationPage({super.key});
  @override
  State<IdentificationPage> createState() => _PageState();
}

class _PageState extends State<IdentificationPage> {

  late double heightAnimated = 70;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(
        "Прохождение идентификации",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14
        ),
      ),
      backgroundColor: AppColors.baseColor.withOpacity(0.08),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              color: AppColors.baseColor.withOpacity(0.08),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              'На единый портал интерактивных государственных услуг!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.baseColor
              ),
            ),
          ),
        ),
        AppUtils.kGap24,
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      heightAnimated = heightAnimated == 320 ? 70 : 320;
                    });
                  },
                  child: AnimatedContainer(
                    height: heightAnimated,
                    duration: Duration.zero,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 22),
                    decoration: BoxDecoration(
                        color: AppColors.baseColor.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Войти через One ID',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black
                              ),
                            ),
                            SvgPicture.asset(SvgIcons.icOneId, height: 23)
                          ],
                        ),
                        if (heightAnimated == 320) Column(
                          children: [
                            AppUtils.kGap24,
                            CustomTextField(
                              hintText: "Логин",
                              fillColor: AppColors.baseColor.withOpacity(0.08),
                              cursorColor: AppColors.grey2,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: AppColors.baseColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: AppColors.baseColor),
                              ),
                            ),
                            AppUtils.kGap12,
                            CustomTextField(
                              hintText: "Пароль",
                              fillColor: AppColors.baseColor.withOpacity(0.08),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(SvgIcons.icEye),
                              ),
                              cursorColor: AppColors.grey2,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: AppColors.baseColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: AppColors.baseColor),
                              ),
                            ),
                            CustomButton(
                              padding: EdgeInsets.zero,
                              backgroundColor: AppColors.opacity,
                              height: 25,
                              onPressed: () {},
                              label: const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Забыли логин или пароль?',
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                            ),
                            CustomButton(
                              height: 35,
                              onPressed: () {},
                              borderRadius: AppUtils.kBorderRadius12,
                              label: Text('Войти'),
                              padding: EdgeInsets.zero,
                            ),
                            AppUtils.kGap12,
                            CustomButton(
                              height: 35,
                              borderButton: true,
                              borderRadius: AppUtils.kBorderRadius12,
                              borderColor: AppColors.baseColor,
                              backgroundColor: AppColors.opacity,
                              padding: EdgeInsets.zero,
                              label: Text(
                                'Регистрация',
                                style: TextStyle(
                                    color: AppColors.baseColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              onPressed: () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  height: 70,
                  duration: Duration.zero,
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 22),
                  decoration: BoxDecoration(
                      color: AppColors.baseColor.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Войти через MyID',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColors.black
                        ),
                      ),
                      SvgPicture.asset(SvgIcons.icMyId, height: 23)
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
