import "package:flutter/gestures.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/extension/build_context_extension.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/inputs/custom_phone_text_field.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/auth/presentation/mixin/auth_mixin.dart";
import "package:imzo/features/auth/presentation/widgets/progress_indicator.dart";
import "package:imzo/router/app_routes.dart";


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with AuthMixin {

  late bool checkBoxPolicy = false;

  @override
  Widget build(BuildContext context) => BlocListener<AuthBloc, AuthState>(
    listener: (BuildContext context, AuthState state) async {
      await pageMovement(state);
    },
    listenWhen: (AuthState p, AuthState c) => p.status != c.status,
      child: BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (p, c) => p.status != c.status,
        builder: (_, state) => Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
            actions: [
              IconButton(onPressed: () {  }, icon: SvgPicture.asset(SvgIcons.icInfoCircle)),
              const SizedBox(width: 5)
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 22),
                  Center(
                    child: Image.asset(
                      ImagesUrl.icImzoLogo,
                      width: 150,
                      height: 38,
                    ),
                  ),
                  const SizedBox(height: 55),
                  const Text(
                    "Войдите в приложение",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Container(
                        width: 65,
                        height: 47,
                        decoration: BoxDecoration(
                          borderRadius: AppUtils.kBorderRadius8,
                          border: Border.all(color: AppColors.lightGrey)
                        ),
                        child: const Center(
                          child: Text(
                            "+998",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      AppUtils.kGap12,
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: SizedBox(
                            height: 55,
                            child: CustomPhoneTextField(
                              filled: true,
                              fillColor: const Color(0x0fffffff),
                              controller: loginController,
                              hintText: '99 123 45 67',
                              onChanged: (value) {
                                setState(() {});
                              },
                              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Colors.red)),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.black),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(color: Colors.transparent),
                              ),
                              validator: (String? value) {
                                return null;
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: AnimatedPadding(
            duration: const Duration(milliseconds: 50),
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            checkBoxPolicy = !checkBoxPolicy;
                          });
                        },
                      icon: SvgPicture.asset(checkBoxPolicy ? SvgIcons.icCheckBox : SvgIcons.icCheckBoxEmpty),
                    ),
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          style: context.textTheme.titleMedium,
                          children: <InlineSpan>[
                            const TextSpan(
                              text: "Регистрируясь, вы подтверждаете, что прочитали и согласны с",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.grey2
                                )
                            ),
                            TextSpan(
                              text: " Политикой конфиденциальности.",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: AppColors.selectedDayBack
                              ),
                              recognizer: TapGestureRecognizer()..onTap = () => context.pushNamed(Routes.publicOfferPage)
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 44),
                  child: CustomButton(
                    backgroundColor: (checkBoxPolicy && loginController.text.length == 12) ? AppColors.baseColor : AppColors.grey,
                    onPressed: () {
                      late String phone = loginController.text.replaceAll(' ', '');
                      if (checkBoxPolicy && state.status != ApiStatus.loading) {
                        localSource.setPhoneNumber("+998 ${loginController.text}");
                        context.read<AuthBloc>().add(AuthLoginEvent(phoneNumber: "+998$phone"));
                      }
                    },
                    label: state.status == ApiStatus.loading
                        ? const CustomProgressIndicator()
                        : const Text("Keyingisi"),
                  ),
                ),
              ],
            ),
          ),
        ),
      )
  );
}

