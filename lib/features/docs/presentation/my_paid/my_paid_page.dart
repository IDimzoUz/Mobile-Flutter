import "package:external_app_launcher/external_app_launcher.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/docs/blocs/my_paid/my_paid_bloc.dart";
import "package:imzo/router/app_routes.dart";
import "package:url_launcher/url_launcher.dart";
import "package:url_launcher/url_launcher_string.dart";
import "package:widget_lifecycle/widget_lifecycle.dart";

class PaidModel {
  const PaidModel({required this.title, required this.id});
  final String title;
  final int id;
}


class MyPaidPage extends StatefulWidget {
  const MyPaidPage({super.key, this.paidModel});
  final PaidModel? paidModel;
  @override
  State<MyPaidPage> createState() => _PageState();
}

class _PageState extends State<MyPaidPage> {

  @override
  void initState() {
    super.initState();
  }

  Future<void> openClickPayment(String link) async {
    await launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
    // try {
    //   await LaunchApp.openApp(
    //     androidPackageName: 'uz.dida.click',
    //     iosUrlScheme: "click:",
    //     appStoreLink: 'https://apps.apple.com/app/id6450523486',
    //     openStore: false, // app topilmasa store ochilmasin
    //   );
    // } catch (e) {
    //   // Agar app topilmasa — webda ochiladi
    //   await launchUrl(Uri.parse(link), mode: LaunchMode.externalApplication);
    // }
  }


  @override
  Widget build(BuildContext context) => BlocListener<MyPaidBloc, MyPaidState>(
    listener: (BuildContext context, MyPaidState state) async {
      if (state.responsePaymentStatus?.isPaid ?? false) {
        context.goNamed(Routes.explore);
      }
    },
    listenWhen: (MyPaidState p, MyPaidState c) => p.responsePaymentStatus != c.responsePaymentStatus,
    child: LifecycleAware(
      observer: LifecycleObserver(
          onVisible: (Lifecycle l) {
            context.read<MyPaidBloc>().add(GetPaymentStatusEvent(id: widget.paidModel?.id ?? 0));
          }
      ),
      builder: (BuildContext context, Lifecycle lifecycle) => BlocBuilder<MyPaidBloc, MyPaidState>(
        buildWhen: (p, n) => p.responsePaymentStatus != n.responsePaymentStatus,
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text(
              "Мой счет",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
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
              Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 116,
                      clipBehavior: Clip.hardEdge,
                      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: AppUtils.kBorderRadius12,
                        color: AppColors.baseColor.withOpacity(0.08)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            widget.paidModel?.title ?? "",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                          AppUtils.kGap24,
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Номер счета",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 8,
                                    ),
                                  ),
                                  AppUtils.kGap4,
                                  Text(
                                    state.responsePaymentStatus?.orderId.toString() ?? "",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              AppUtils.kGap40,
                              AppUtils.kGap40,
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Оплата",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 8,
                                    ),
                                  ),
                                  AppUtils.kGap4,
                                  Text(
                                    "2 000 UZS",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    AppUtils.kGap16,
                    CustomButton(
                      onPressed: () {
                        openClickPayment(state.responsePaymentStatus?.paymentUrl ?? "");
                        // launchUrlString(state.responsePaymentStatus?.paymentUrl ?? "", mode: LaunchMode.externalApplication);
                      },
                      backgroundColor: AppColors.baseColor.withOpacity(0.08),
                      borderRadius: AppUtils.kBorderRadius12,
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                      label: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 24,
                            clipBehavior: Clip.hardEdge,
                            decoration: const BoxDecoration(borderRadius: AppUtils.kBorderRadius4),
                            child: SvgPicture.asset(SvgIcons.icClick, fit: BoxFit.cover),
                          ),
                          AppUtils.kGap16,
                          const Text(
                            "Click",
                            style: TextStyle(
                                fontSize: 16,
                                color: AppColors.black
                            ),
                          ),
                          const Spacer(),
                          Icon(Icons.arrow_forward_ios_outlined, size: 20, color: AppColors.black.withOpacity(0.5))
                        ],
                      ),
                    ),
                    // CustomButton(
                    //   backgroundColor: AppColors.baseColor.withOpacity(0.08),
                    //   borderRadius: AppUtils.kBorderRadius12,
                    //   padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    //   label: Row(
                    //     children: [
                    //       Container(
                    //         width: 50,
                    //         height: 24,
                    //         clipBehavior: Clip.hardEdge,
                    //         decoration: const BoxDecoration(borderRadius: AppUtils.kBorderRadius4),
                    //         child: SvgPicture.asset(SvgIcons.icPayme, fit: BoxFit.cover),
                    //       ),
                    //       AppUtils.kGap16,
                    //       const Text(
                    //         "Payme",
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           color: AppColors.black
                    //         ),
                    //       ),
                    //       const Spacer(),
                    //       Icon(Icons.arrow_forward_ios_outlined, size: 20, color: AppColors.black.withOpacity(0.5))
                    //     ],
                    //   ),
                    // ),
                    // AppUtils.kGap12,
                  ],
                ),
              )
            ],
          ),
        )
      ),
    )
  );
}
