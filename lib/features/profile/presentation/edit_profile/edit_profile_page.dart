import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/profile/presentation/edit_profile/widgets/edit_profile_item_widget.dart";

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});
  @override
  State<EditProfilePage> createState() => _PageState();
}

class _PageState extends State<EditProfilePage> {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(
        "Профиль",
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
          padding: const EdgeInsets.only(bottom: 22),
          decoration: BoxDecoration(
              color: AppColors.baseColor.withOpacity(0.08),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 60,
                height: 60,
                margin: const EdgeInsets.only(left: 16),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  borderRadius: AppUtils.kBorderRadius48,
                ),
                child: Center(
                  child: SvgPicture.asset(SvgIcons.icHistory),
                ),
              ),
              AppUtils.kGap16,
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Sitirzaev To’lqin",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "ID: 712831623",
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 17, horizontal: 20),
          child: Text(
            'Личная информация',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500
            ),
          ),
        ),
        const Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: [
                EditProfileItemWidget(
                    title: 'Имя фамилия',
                    desc: 'Sitirzaev To’lqin',
                  ),
                EditProfileItemWidget(
                    title: 'Контактный номер',
                    desc: '+998 77 404 40 40',
                    editPhone: true,
                  ),
                EditProfileItemWidget(
                    title: 'Дата рождения',
                    desc: '14.05.1992',
                  ),
                EditProfileItemWidget(
                    title: 'Пол',
                    desc: 'Мужской',
                  ),
                EditProfileItemWidget(
                    title: 'Личность',
                    desc: 'Физическое лицо',
                  ),
                EditProfileItemWidget(
                    title: 'Адрес',
                    desc: 'Город Ташкент, Чиланзарский район, улица Мехр дом 56.',
                  ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
