import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/extension/build_context_extension.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/inputs/custom_text_field.dart";
import "package:imzo/features/docs/presentation/widgets/docs_item_widget.dart";
import "package:imzo/features/others/presentation/pages/language/language_page.dart";
import "package:imzo/features/others/presentation/pages/language/widgets/lan_checkbox_widget.dart";
import "package:imzo/router/app_routes.dart";

class FormalizationPage extends StatefulWidget {
  const FormalizationPage({super.key});

  @override
  State<FormalizationPage> createState() => _PageState();
}

class _PageState extends State<FormalizationPage> {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(
        "Оформление",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14
        ),
      ),
      backgroundColor: AppColors.baseColor.withOpacity(0.08),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.info_outlined),
        )
      ],
    ),
    body: Column(
      children: [
        Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.baseColor.withOpacity(0.08),
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))
          ),
        ),
        Flexible(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 34),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Информация о получателе заявки',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  AppUtils.kGap6,
                  const Text(
                    'Введите данные получателя заявки!',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      color: AppColors.grey2
                    ),
                  ),
                  AppUtils.kGap16,
                  CustomTextField(
                    hintText: "AD12312323",
                    fillColor: AppColors.baseColor.withOpacity(0.08),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: SvgPicture.asset(SvgIcons.icScan),
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
                  AppUtils.kGap12,
                  CustomTextField(
                    hintText: "12.12.2025",
                    fillColor: AppColors.baseColor.withOpacity(0.08),
                    suffixIcon: const Icon(Icons.calendar_today_rounded, color: AppColors.baseColor),
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
                  const Text(
                    'Dilshod Iskandarov',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  AppUtils.kGap12,
                  CustomTextField(
                    hintText: "99 123 45 67",
                    fillColor: AppColors.baseColor.withOpacity(0.08),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 10, top: 12),
                      child: Text(
                        '+998',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
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
                  AppUtils.kGap12,
                  CustomTextField(
                    hintText: "99 123 45 67",
                    fillColor: AppColors.baseColor.withOpacity(0.08),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 10, top: 12),
                      child: Text(
                        '+998',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
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
                  AppUtils.kGap12,
                  CustomButton(
                    width: double.infinity,
                    backgroundColor: AppColors.baseColor.withOpacity(0.08),
                    label: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_circle_outline_sharp, color: AppColors.baseColor),
                        AppUtils.kGap4,
                        Text(
                          'Raqam qo\'shish',
                          style: TextStyle(color: AppColors.black),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ),
    bottomNavigationBar: const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: CustomButton(
        width: double.infinity,
        label: const Text('Отправить'),
      ),
    ),
  );
}
