import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:go_router/go_router.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/loading/circular_progress_indicator.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/docs/model/create_contracts_response.dart";
import "package:imzo/features/docs/presentation/my_paid/my_paid_page.dart";
import "package:imzo/features/history/presentation/bloc/contract_detail_bloc/contract_detail_bloc.dart";
import "package:imzo/features/history/presentation/bloc/contract_detail_bloc/contract_detail_event.dart";
import "package:imzo/features/history/presentation/bloc/contract_detail_bloc/contract_detail_state.dart";
import "package:imzo/features/history/presentation/model/for_me_history_response.dart";
import "package:imzo/features/history/presentation/pages/widgets/approved_dialog.dart";
import "package:imzo/features/history/presentation/pages/widgets/pending_dialog.dart";
import "package:imzo/router/app_routes.dart";
import "package:widget_lifecycle/widget_lifecycle.dart";


class ContractDetailMyCreatorPage extends StatefulWidget {
  const ContractDetailMyCreatorPage({super.key, this.dataResponse});
  final ForMeHistoryResponse? dataResponse;
  @override
  State<ContractDetailMyCreatorPage> createState() => _PageState();
}

class _PageState extends State<ContractDetailMyCreatorPage> {



  Future<void> alertVerify(CreateContractsResponse? response) async {
    switch (response?.status) {
      case "PENDING":
        if (response?.creatorApproved ?? false) {
          await showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (_) => const PendingDialog()
          );
        } else {
          context.pushNamed(Routes.selectPaymentVerifyPage, extra: response);
        }
        break;
      case "CREATOR_APPROVED":
        if (response?.creatorApproved ?? false) {
          await showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (_) => const PendingDialog()
          );
        } else {
          context.pushNamed(Routes.selectPaymentVerifyPage, extra: response);
        }
        break;
      case "RECIPIENT_APPROVED":
        context.pushNamed(Routes.selectPaymentVerifyPage, extra: response);
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
        print("state.response?.paid ${state.response?.paid}");
        print("state.response?.status ${state.response?.status}");
        print("widget.dataResponse?.forMe ${widget.dataResponse?.forMe}");

      }
    },
    listenWhen: (ContractDetailState p, ContractDetailState c) => p.response != c.response,
    child: LifecycleAware(
      observer: LifecycleObserver(
          onVisible: (a) {
            context.read<ContractDetailBloc>().add(GetContractDetailEvent(id: widget.dataResponse?.contractId ?? 0));
          }
      ),
      builder: (BuildContext context, Lifecycle lifecycle) => BlocBuilder<ContractDetailBloc, ContractDetailState>(
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
          body: state.status == ApiStatus.loading || state.response == null
              ? const Center(child: CustomCircularProgressIndicator(color: AppColors.baseColor))
              : SingleChildScrollView(
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
          bottomNavigationBar: Visibility(
            visible: !(state.response?.paid ?? false),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: CustomButton(
                width: double.infinity,
                label: const Text('Следующий adas'),
                onPressed: () async {
                  if (!(state.response?.creatorApproved ?? false) || !(state.response?.recipientApproved ?? false)) {
                    alertVerify(state.response);
                  } else {
                    if (state.response?.recipientApproved ?? false) {
                      await showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (_) => ApprovedDialog(
                            title: 'Ikkinchi tomondan tasdiqlandi!',
                            desc: 'Shartnoma har ikkala tomondan tasdiqlandi, sabr qilganngiz uchun raxmat',
                            approved: true,
                            onTap: () => context.pushNamed(Routes.myPaid, extra: PaidModel(title: state.response?.templateName ?? "", id: state.response?.contractId ?? 0)),
                          )
                      );
                    }
                  }
                },
              ),
            ),
          ),
        )
      ),
    )
  );
}
