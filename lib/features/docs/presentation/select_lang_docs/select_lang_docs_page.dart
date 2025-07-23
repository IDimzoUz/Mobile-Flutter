import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/others/presentation/pages/language/language_page.dart";
import "package:imzo/features/others/presentation/pages/language/widgets/lan_checkbox_widget.dart";
import "package:imzo/router/app_routes.dart";


class SelectLangDocsPage extends StatefulWidget {
  const SelectLangDocsPage({super.key});

  @override
  State<SelectLangDocsPage> createState() => _PageState();
}

class _PageState extends State<SelectLangDocsPage> {

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
      title: const Text(
        "Выбирайте сами",
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
        Expanded(
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(left: 16, right: 16, top: 28),
            shrinkWrap: true,
            separatorBuilder: (_, __) => AppUtils.kGap,
            itemCount: items.length,
            itemBuilder: (_, index) => LanCheckboxWidget(
              value: items[index].isCheck,
              image: items[index].icon,
              onTap: () async {
                checked(index);
              },
              title: items[index].name,
            ),
          ),
        ),
      ],
    ),
    bottomNavigationBar: Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: CustomButton(
        width: double.infinity,
        label: const Text('Следующий'),
        onPressed: () => context.pushNamed(Routes.formalizationPage),
      ),
    ),
  );
}
