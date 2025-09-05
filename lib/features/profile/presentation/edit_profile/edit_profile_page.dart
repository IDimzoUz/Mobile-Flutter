import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/features/profile/model/user_me_response.dart";
import "package:imzo/features/profile/presentation/edit_profile/widgets/edit_profile_item_widget.dart";
import "package:imzo/features/profile/presentation/widgets/me_profile_widget.dart";
import "package:imzo/router/app_routes.dart";

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key, this.data});
  final UserMeResponse? data;
  @override
  State<EditProfilePage> createState() => _PageState();
}

class _PageState extends State<EditProfilePage> {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      backgroundColor: AppColors.baseColor.withOpacity(0.08),
      title: const Text(
        "Профиль",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
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
          child: MeProfileWidget(data: widget.data),
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
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: [
                EditProfileItemWidget(
                    title: 'Имя фамилия',
                    desc: "${widget.data?.firstName ?? ""} ${widget.data?.lastName ?? ""}",
                  ),
                EditProfileItemWidget(
                    title: 'Контактный номер',
                    desc: localSource.getPhoneNumber(),
                    editPhone: true,
                  ),
                EditProfileItemWidget(
                    title: 'Дата рождения',
                    desc: widget.data?.birthDate ?? "",
                  ),
                EditProfileItemWidget(
                    title: 'Пол',
                    desc: widget.data?.gender == "MALE" ? 'Мужской' : "Женский",
                  ),
                const EditProfileItemWidget(
                    title: 'Личность',
                    desc: 'Физическое лицо',
                  ),
                if (widget.data?.address != null) EditProfileItemWidget(
                    title: 'Адрес',
                    desc: widget.data?.address ?? "",
                ) else SizedBox(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
