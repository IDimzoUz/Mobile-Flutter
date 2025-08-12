import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/extension/build_context_extension.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/inputs/custom_phone_text_field.dart";
import "package:imzo/core/widgets/inputs/custom_text_field.dart";
import "package:imzo/features/docs/blocs/create_formalization/create_formalization_bloc.dart";
import "package:imzo/features/docs/model/contract_templates_response.dart";
import "package:imzo/features/docs/presentation/create_formalization/widgets/sum_item_widget.dart";
import "package:imzo/features/docs/presentation/select_lang_docs/select_lang_docs_page.dart";
import "package:imzo/features/docs/presentation/widgets/docs_item_widget.dart";
import "package:imzo/features/others/presentation/pages/language/language_page.dart";
import "package:imzo/features/others/presentation/pages/language/widgets/lan_checkbox_widget.dart";
import "package:imzo/router/app_routes.dart";

class CreateFormalizationPage extends StatefulWidget {
  const CreateFormalizationPage({super.key, this.contractIDModel});
  final ContractIDModel? contractIDModel;
  @override
  State<CreateFormalizationPage> createState() => _PageState();
}

class _PageState extends State<CreateFormalizationPage> {

  final List<GlobalKey<SumItemWidgetState>> sumItemKeys = [];

  @override
  void initState() {
    super.initState();
    context.read<CreateFormalizationBloc>().add(GetContractsTemplatesEvent(langId: widget.contractIDModel?.languageCode ?? 0));
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<CreateFormalizationBloc, CreateFormalizationState>(
    buildWhen: (p, n) => p.contractsTemplatesResponse != n.contractsTemplatesResponse,
    builder: (context, state) => Scaffold(
      appBar: AppBar(
        title: Text(
          state.contractsTemplatesResponse?.name ?? "",
          style: const TextStyle(
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
          Flexible(
            child: ListView.separated(
              itemBuilder: (_, index) {
                late List<Sections>? sections = state.contractsTemplatesResponse?.translations?[0].sections;
                sections?.sort((a, b) => a.orderIndex?.compareTo(b.orderIndex ?? 0) ?? 0);
                final key = GlobalKey<SumItemWidgetState>();
                sumItemKeys.add(key);
                return SumItemWidget(
                  key: key,
                  dataSections: sections?[index]
                );
              },
              separatorBuilder: (_, __) => AppUtils.kGap,
              itemCount: state.contractsTemplatesResponse?.translations?[0].sections?.length ?? 0,
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: CustomButton(
          width: double.infinity,
          label: const Text('Следующий'),
          onPressed: () {
            for (var key in sumItemKeys) {
              key.currentState?.validateAll();
            }
          },
        ),
      ),
    )
  );
}
