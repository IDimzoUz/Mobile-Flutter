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
    SelectLanguageData("O’zbekcha", localSource.language == 'uz' ? false : true, ImagesUrl.icUz),
    SelectLanguageData("Ўзбекча", localSource.language == 'uz' ? false : true, ImagesUrl.icUz),
    SelectLanguageData("Qaraqalpaq", localSource.language == 'qr' ? false : true, ImagesUrl.icQr),
    SelectLanguageData("Русские", localSource.language == 'ru' ? false : true, ImagesUrl.icRu),
    SelectLanguageData("English", localSource.language == 'en'? false : true, ImagesUrl.icEn),
  ];
  void checked(int index) {
    for (final element in items) {
      element.isCheck = true;
    }
    setState(() { items[index].isCheck = !items[index].isCheck;});
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: const SizedBox(),
      actions: [
        IconButton(onPressed: () {  }, icon: SvgPicture.asset(SvgIcons.icInfoCircle)),
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
              'Tilni tanlang',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 55, vertical: 12),
              child: Text(
                'Ilova interfeysi siz tanlagan tilda ishlashda davom etadi.',
                textAlign: TextAlign.center,
                style: TextStyle(
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
              if(index == 0){
                context.setLocale(const Locale('en'));
                await localSource.setLanguage('en');
              }else if(index == 1){
                context.setLocale(const Locale('uz'));
                await localSource.setLanguage('uz');
              }else if(index == 2){
                context.setLocale(const Locale('ru'));
                await localSource.setLanguage('ru');
              }
              setState(() {
                checked(index);
              });
            }, title: items[index].name,),
          )
        ],
      ),
    ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 54),
      child: CustomButton(
        onPressed: () => context.pushNamed(Routes.auth),
        label: Text("Keyingisi"),
      ),
    ),
  );
}

