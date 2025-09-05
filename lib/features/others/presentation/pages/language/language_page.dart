import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/extension/build_context_extension.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/others/presentation/pages/language/widgets/lan_checkbox_widget.dart";
import "package:imzo/router/app_routes.dart";

import "../../../../history/presentation/pages/widgets/text_dialog.dart";

class SelectLanguageData {
  SelectLanguageData( this.name, this.isCheck, this.icon );
  String name;
  bool isCheck;
  String icon;
}

class LanguagePage extends StatefulWidget {
  const LanguagePage({super.key});
  @override
  State<LanguagePage> createState() => _PageState();
}

class _PageState extends State<LanguagePage> {

  List<SelectLanguageData> items = [
    SelectLanguageData("O’zbekcha", localSource.language == 'uz' ? true : false, ImagesUrl.icUz),
    SelectLanguageData("Ўзбекча", localSource.language == 'uz_cyrl' ? true : false, ImagesUrl.icUz),
    SelectLanguageData("Русские", localSource.language == 'ru' ? true : false, ImagesUrl.icRu),
    SelectLanguageData("English", localSource.language == 'en'? true : false, ImagesUrl.icEn),
  ];
  void checked(int index) {
    for (final element in items) {
      element.isCheck = false;
    }
    setState(() { items[index].isCheck = !items[index].isCheck;});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: const SizedBox(),
      actions: [
        IconButton(
          onPressed: () async {
            await showDialog<void>(
              context: context,
              barrierDismissible: true,
              builder: (_) => const TextDialog(title: "Tanlangan til ilova interfeysi uchun ishlatiladi. Tilni keyinchalik sozlamalarda o‘zgartirishingiz mumkin")
            );
          },
          icon: SvgPicture.asset(SvgIcons.icInfoCircle),
        ),
        const SizedBox(width: 5)
      ],
    ),
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              context.tr("select_language"),
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 55, vertical: 12),
              child: Text(
                context.tr("app_interfeys_desc"),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.baseGray
                ),
              ),
            ),
          ),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 16, right: 16),
            shrinkWrap: true,
            separatorBuilder: (_, __) => AppUtils.kGap,
            itemCount: items.length,
            itemBuilder: (_, index) => LanCheckboxWidget(
              value: items[index].isCheck,
              image: items[index].icon,
              onTap: () async {
                if (index == 0) {
                  context.setLocale(const Locale('uz'));
                  await localSource.setLanguage('uz');
                } else if (index == 1) {
                  context.setLocale(const Locale('uz', 'Cyrl'));
                  await localSource.setLanguage('uz_cyrl');
                } else if (index == 2) {
                  context.setLocale(const Locale('ru'));
                  await localSource.setLanguage('ru');
                } else if (index == 3) {
                  context.setLocale(const Locale('en'));
                  await localSource.setLanguage('en');
                }
                setState(() {
                  checked(index);
                });
              }, title: items[index].name
            ),
          ),
        ],
      ),
    ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 54),
      child: CustomButton(
        onPressed: () => context.pushNamed(Routes.auth),
        label: const Text("Keyingisi"),
      ),
    ),
  );
}

