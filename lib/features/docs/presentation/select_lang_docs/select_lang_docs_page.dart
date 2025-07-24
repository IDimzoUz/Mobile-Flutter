import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/docs/blocs/select_lang_docs/select_lang_docs_bloc.dart";
import "package:imzo/features/docs/model/contract_tem_category_response.dart";
import "package:imzo/features/others/presentation/pages/language/language_page.dart";
import "package:imzo/features/others/presentation/pages/language/widgets/lan_checkbox_widget.dart";
import "package:imzo/router/app_routes.dart";


class SelectLangDocsPage extends StatefulWidget {
  const SelectLangDocsPage({super.key, required this.id});
  final int id;
  @override
  State<SelectLangDocsPage> createState() => _PageState();
}

class _PageState extends State<SelectLangDocsPage> {

  late int id = 0;

  @override
  void initState() {
    super.initState();
    context.read<SelectLangDocsBloc>().add(GetLanguageCategoryDocsEvent(id: widget.id));
  }

  void checked(int index, List<ContractTemplatesCategoryResponse> items) {
    for (final element in items) {
      element.isCheck = false;
    }
    id = items[index].id ?? 0;
    setState(() { items[index].isCheck = !(items[index].isCheck ?? false);});
  }

  String setImageLang(ContractTemplatesCategoryResponse data) {
    for (final element in data.availableLanguages ?? []) {
      switch (element) {
        case "ru": return ImagesUrl.icRu;
        case "en": return ImagesUrl.icEn;
        case "uz": return ImagesUrl.icUz;
        default: return ImagesUrl.icUz;
      }
    }
    return '';
  }


  @override
  Widget build(BuildContext context) => BlocBuilder<SelectLangDocsBloc, SelectLangDocsState>(
  buildWhen: (p, n) => p.status != n.status || p.langCategoryResponse != n.langCategoryResponse,
  builder: (context, state) => Scaffold(
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
          icon: const Icon(Icons.info_outlined),
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
            itemCount: state.langCategoryResponse?.length ?? 0,
            itemBuilder: (_, index) => LanCheckboxWidget(
              value: state.langCategoryResponse?[index].isCheck ?? false,
              image: setImageLang(state.langCategoryResponse![index]),
              onTap: () => checked(index, state.langCategoryResponse ?? []),
              title: state.langCategoryResponse?[index].name ?? "",
            ),
          ),
        ),
      ],
    ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: CustomButton(
        width: double.infinity,
        backgroundColor: (id != 0) ? AppColors.baseColor : AppColors.neutralDenger5.withOpacity(0.5),
        label: const Text('Следующий'),
        onPressed: () => (id != 0) ? context.pushNamed(Routes.formalizationPage) : null,
      ),
    ),
   )
  );
}
