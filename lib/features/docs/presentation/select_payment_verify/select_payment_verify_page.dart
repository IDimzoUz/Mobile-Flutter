import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/docs/blocs/create_formalization_detail/create_formalization_detail_bloc.dart";
import "package:imzo/features/docs/model/create_contracts_response.dart";
import "package:imzo/features/docs/presentation/my_paid/my_paid_page.dart";
import "package:imzo/router/app_routes.dart";


class SelectPaymentVerifyPage extends StatefulWidget {
  const SelectPaymentVerifyPage({super.key, this.response});
  final CreateContractsResponse? response;
  @override
  State<SelectPaymentVerifyPage> createState() => _PageState();
}

class _PageState extends State<SelectPaymentVerifyPage> {

  late bool select = true;

  void check() {
    setState(() {
      select = !select;
    });
  }
  @override
  Widget build(BuildContext context) => Scaffold(
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
  );
}
