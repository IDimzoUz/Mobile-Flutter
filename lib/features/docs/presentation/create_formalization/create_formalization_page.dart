import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/extension/build_context_extension.dart";
import "package:imzo/core/extension/custom_snackbar/custom_snack_bar.dart";
import "package:imzo/core/extension/custom_snackbar/top_snack_bar.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/inputs/custom_phone_text_field.dart";
import "package:imzo/core/widgets/inputs/custom_text_field.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
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
  final List<Map<String, String>> fieldValue = []; // umumiy map
  final Map<String, String> resultField = {};
  late ContractsTemplatesResponse? contractsTemplatesResponse = ContractsTemplatesResponse();
  final Map<int, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    context.read<CreateFormalizationBloc>().add(GetContractsTemplatesEvent(langId: widget.contractIDModel?.languageCode ?? 0));
  }

  @override
  void dispose() {
    _controllers.values.forEach((controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocListener<CreateFormalizationBloc, CreateFormalizationState>(
    listener: (BuildContext context, CreateFormalizationState state) async {
      if (state.contractsTemplatesResponse != null) {
        contractsTemplatesResponse = state.contractsTemplatesResponse;
      }
      if (state.createContractsResponse != null) {
        context.pushNamed(Routes.createFormalizationDetailPage, extra: state.createContractsResponse);
      }
      if (state.status == ApiStatus.error) {
        showTopSnackBar(
          Overlay.of(context),
          const CustomSnackBar.error(
            icon: Icon(Icons.close, color: AppColors.red),
            message: "Nimadir xato ketdi.",
          ),
        );
      }
    },
    listenWhen: (CreateFormalizationState p, CreateFormalizationState c) => p.status != c.status || p.contractsTemplatesResponse != c.contractsTemplatesResponse || p.createContractsResponse != c.createContractsResponse,
    child: BlocBuilder<CreateFormalizationBloc, CreateFormalizationState>(
    buildWhen: (p, n) => p.contractsTemplatesResponse != n.contractsTemplatesResponse || p.createContractsResponse != n.createContractsResponse,
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
                  late List<Sections>? sections = contractsTemplatesResponse?.translations?[0].sections;
                  sections?.sort((a, b) => a.orderIndex?.compareTo(b.orderIndex ?? 0) ?? 0);
                  final key = GlobalKey<SumItemWidgetState>();
                  sumItemKeys.add(key);
                  if (!_controllers.containsKey(index)) {
                    _controllers[index] = TextEditingController();
                  }
                  return SumItemWidget(
                    key: key,
                    dataSections: sections?[index],
                    controller: _controllers[index]!,
                    dataReturn: (dataReturn) {
                      fieldValue.add(dataReturn);
                      for (var item in fieldValue) {
                        if (item.values.isNotEmpty) {
                          resultField.addAll(item);
                        }
                      }
                      print({"fieldValues": resultField});
                    },
                  );
                },
                separatorBuilder: (_, __) => AppUtils.kGap,
                itemCount: contractsTemplatesResponse?.translations?[0].sections?.length ?? 0,
              ),
            )
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: CustomButton(
            width: double.infinity,
            label: state.status == ApiStatus.loading
                ? const SizedBox(width: 25, height: 25, child: CircularProgressIndicator(backgroundColor: AppColors.opacity, color: AppColors.white))
                : const Text('Следующий'),
            onPressed: () {
              if (state.status != ApiStatus.loading) {
                for (var key in sumItemKeys) {
                  key.currentState?.validateAll();
                }
                if (widget.contractIDModel != null) {
                  late ContractIDModel data = ContractIDModel(
                    templateId: contractsTemplatesResponse?.id ?? 0,
                    languageCode: widget.contractIDModel?.languageCode ?? 0,
                    language: widget.contractIDModel?.language ?? "",
                    dateBirthDay: widget.contractIDModel?.dateBirthDay ?? "",
                    passportID: widget.contractIDModel?.passportID ?? "",
                    recipientPhoneNumber: widget.contractIDModel?.recipientPhoneNumber ?? "",
                    recipientPhoneNumber2: widget.contractIDModel?.recipientPhoneNumber2 ?? "",
                    recipientPhoneNumber3: widget.contractIDModel?.recipientPhoneNumber3 ?? "",
                  );
                  context.read<CreateFormalizationBloc>().add(CreateContractsEvent(contractIDModel: data, fieldValues: resultField));
                }
              }
            },
          ),
        ),
      )
     )
  );
}
