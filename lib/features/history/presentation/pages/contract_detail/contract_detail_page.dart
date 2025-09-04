import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/docs/model/create_contracts_response.dart";
import "package:imzo/features/docs/presentation/my_paid/my_paid_page.dart";
import "package:imzo/features/history/presentation/bloc/contract_detail_bloc/contract_detail_bloc.dart";
import "package:imzo/features/history/presentation/bloc/contract_detail_bloc/contract_detail_event.dart";
import "package:imzo/features/history/presentation/bloc/contract_detail_bloc/contract_detail_state.dart";
import "package:imzo/features/history/presentation/model/for_me_history_response.dart";
import "package:imzo/features/history/presentation/pages/widgets/approved_dialog.dart";
import "package:imzo/features/history/presentation/pages/widgets/pending_dialog.dart";
import "package:imzo/features/profile/presentation/identification/widgets/loading_dialog.dart";
import "package:imzo/router/app_routes.dart";


class ContractDetailPage extends StatefulWidget {
  const ContractDetailPage({super.key, this.contractId});
  final int? contractId;
  @override
  State<ContractDetailPage> createState() => _PageState();
}

class _PageState extends State<ContractDetailPage> {

  @override
  void initState() {
    super.initState();
    context.read<ContractDetailBloc>().add(GetContractDetailEvent(id: widget.contractId ?? 0));
  }

  Future<void> alertVerify(String status, CreateContractsResponse? response) async {
    switch (status) {
      case "PENDING":
        await showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (_) => const PendingDialog()
        );
        break;
      case "CREATOR_APPROVED":
        context.pushNamed(Routes.selectPaymentVerifyPage, extra: response);
        break;
      case "RECIPIENT_APPROVED":
        await showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (_) => ApprovedDialog(
              title: 'Ikkinchi tomondan tasdiqlandi!',
              desc: 'Shartnoma har ikkala tomondan tasdiqlandi, sabr qilganngiz uchun raxmat',
              approved: true,
              onTap: () => context.pushNamed(Routes.myPaid, extra: PaidModel(title: response?.templateName ?? "", id: response?.contractId ?? 0))
            )
        );
        break;
      case "CANCELLED":
        await showDialog<void>(
            context: context,
            barrierDismissible: false,
            builder: (_) => const ApprovedDialog(
              title: 'Ikkinchi tomondan tasdiqlanmadi!',
              desc: 'Shartnoma har ikkala tomondan tasdiqlanmadi, sabr qilganngiz uchun raxmat',
              approved: false,
            )
        );
        break;
      default: break;
    }
  }



  @override
  Widget build(BuildContext context) => BlocListener<ContractDetailBloc, ContractDetailState>(
    listener: (BuildContext context, ContractDetailState state) async {
      if (state.response != null) {

      }
    },
    listenWhen: (ContractDetailState p, ContractDetailState c) => p.response != c.response,
    child: BlocBuilder<ContractDetailBloc, ContractDetailState>(
      buildWhen: (p, n) => p.response != n.response,
      builder: (context, state) => Scaffold(
      appBar: AppBar(
        title: Text(
          state.response?.templateName ?? "",
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
        ),
        backgroundColor: AppColors.baseColor.withOpacity(0.08),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.info_outlined),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppUtils.kGap24,
            Text(
              state.response?.filledContent ?? "",
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: CustomButton(
          width: double.infinity,
          label: const Text('Следующий'),
          onPressed: () => alertVerify(state.response?.status ?? "", state.response),
        ),
      ),
     )
    )
  );
}
