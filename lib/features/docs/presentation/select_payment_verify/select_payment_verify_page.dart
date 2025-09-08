import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/constants.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/extension/custom_snackbar/custom_snack_bar.dart";
import "package:imzo/core/extension/custom_snackbar/top_snack_bar.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/docs/blocs/select_payment_verify/select_payment_verify_bloc.dart";
import "package:imzo/features/docs/model/create_contracts_response.dart";
import "package:imzo/features/profile/presentation/identification/widgets/loading_dialog.dart";
import "package:imzo/router/app_routes.dart";
import "package:myid/enums.dart";
import "package:myid/myid.dart";
import "package:myid/myid_config.dart";


class SelectPaymentVerifyPage extends StatefulWidget {
  const SelectPaymentVerifyPage({super.key, this.response});
  final CreateContractsResponse? response;
  @override
  State<SelectPaymentVerifyPage> createState() => _PageState();
}

class _PageState extends State<SelectPaymentVerifyPage> {

  late bool select = true;
  String? _error;
  MyIdResult? _result;

  void check() {
    setState(() {
      select = !select;
    });
  }

  Future<void> init() async {
    String? error;
    MyIdResult? result;
    try {
      final myIdResult = await MyIdClient.start(
        iosAppearance: const MyIdIOSAppearance(),
        config: MyIdConfig(
            clientId: DatabaseKeys.myIDClientId,
            clientHash: DatabaseKeys.myIDClientHash,
            clientHashId: DatabaseKeys.myIDClientHashId,
            environment: MyIdEnvironment.DEBUG,
            entryType: MyIdEntryType.IDENTIFICATION,
            locale: MyIdLocale.UZBEK,
            imageFormat: MyIdImageFormat.JPEG,
            presentationStyle: MyIdPresentationStyle.FULL,
            cameraShape: MyIdCameraShape.ELLIPSE
        ),
      );
      error = null;
      result = myIdResult;
      print('CODE- ${result.code}');
      loadingMyID();
      context.read<SelectPaymentVerifyBloc>().add(GetMyIDTokenVerifyEvent(code: result.code ?? ""));
    } catch (e) {
      error = e.toString();
      result = null;
      print(error);
    }
    if (!mounted) return;
    setState(() {
      _error = error;
      _result = result;
    });
  }

  Future<void> loadingMyID() async {
    await showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (_) => const LoadingDialog()
    );
  }

  Future<void> topSnackbar(bool error) async {
    if (error) {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          icon: Icon(Icons.close, color: AppColors.red),
          message: "Tasdiqlashda xatolik bo'ldi.",
        ),
      );
    } else {
      showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.success(
          type: true,
          icon: Icon(Icons.check, color: AppColors.green),
          message: "Ma'lumotlaringiz tasdiqlandi.",
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) => BlocListener<SelectPaymentVerifyBloc, SelectPaymentVerifyState>(
    listener: (BuildContext context, SelectPaymentVerifyState state) async {
      if (state.myIDAccessToken != null) {
        print('State Token => ${state.myIDAccessToken?.accessToken}');
        context.read<SelectPaymentVerifyBloc>().add(GetMyIDMeEvent(token: state.myIDAccessToken?.accessToken ?? ""));
      }
      if (state.myIDMeResponse != null) {
        context.read<SelectPaymentVerifyBloc>().add(
            EditMyIDStatusEvent(
              contractID: widget.response?.contractId ?? 0,
              creator: widget.response?.status == "PENDING" ? true : false,
            ),
        );
      } else if (state.status == ApiStatus.error) {
        context.pop();
        topSnackbar(true);
      }
      Future.delayed(const Duration(seconds: 3));
      if (state.contractsResponse != null) {
        topSnackbar(false);
        context.pop();
        context.pop();
      } else if (state.status == ApiStatus.error) {
        context.pop();
        topSnackbar(true);
      }
    },
    listenWhen: (SelectPaymentVerifyState p, SelectPaymentVerifyState c) => p.status != c.status || p.myIDAccessToken != c.myIDAccessToken || p.myIDMeResponse != c.myIDMeResponse || p.contractsResponse != c.contractsResponse,
    child: Scaffold(
      appBar: AppBar(
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppUtils.kGap40,
                  AppUtils.kGap40,
                  AppUtils.kGap40,
                  Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(SvgIcons.icCheckBox, width: 70, height: 70),
                  ),
                  AppUtils.kGap40,
                  CustomButton(
                    width: double.infinity,
                    backgroundColor: AppColors.opacity,
                    onPressed: () {
                      setState(() {
                        select = true;
                      });
                    },
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: AppUtils.kBorderRadius48,
                            border: Border.all(color: select ? AppColors.baseColor : AppColors.grey2, width: select ? 5 : 2)
                          ),
                        ),
                        AppUtils.kGap16,
                        const Text(
                          "MyID - 5 000 UZS",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                  // AppUtils.kGap24,
                  CustomButton(
                    width: double.infinity,
                    backgroundColor: AppColors.opacity,
                    onPressed: () {
                      setState(() {
                        select = false;
                      });
                    },
                    label: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              borderRadius: AppUtils.kBorderRadius48,
                              border: Border.all(color: !select ? AppColors.baseColor : AppColors.grey2, width: !select ? 5 : 2)
                          ),
                        ),
                        AppUtils.kGap16,
                        const Text(
                          "CMC - 2 000 UZS",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: AppColors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: CustomButton(
          onPressed: () {
            if (select) {
              init();
            } else {
              print("Подтвердить creatorApproved ${widget.response?.creatorApproved}");
              print("Подтвердить recipientApproved ${widget.response?.recipientApproved}");
              context.pushNamed(Routes.createOtpPage, extra: widget.response);
            }
          },
          width: double.infinity,
          label: const Text('Подтвердить'),
        ),
      ),
    ),
  );
}
