import "dart:async";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/extension/build_context_extension.dart";
import "package:imzo/core/extension/custom_snackbar/custom_snack_bar.dart";
import "package:imzo/core/extension/custom_snackbar/top_snack_bar.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/auth/data/login/login_user_response.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/auth/presentation/bloc/otp/otp_bloc.dart";
import "package:imzo/features/auth/presentation/widgets/progress_indicator.dart";
import "package:imzo/router/app_routes.dart";
import "package:pin_input_text_field/pin_input_text_field.dart";


class OtpPage extends StatefulWidget {
  const OtpPage({super.key, required this.data});
  final LoginResponse data;
  @override
  State<OtpPage> createState() => _PageState();
}

class _PageState extends State<OtpPage> {

  late final TextEditingController controller = TextEditingController();
  late int _seconds = 60;
  late bool sendCode = true;
  late bool activeButton = false;
  late Color otpColor = AppColors.baseColor;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_seconds == 0) {
        timer.cancel();
        setState(() {
          sendCode = false;
        });
      } else {
        sendCode = true;
        setState(() {
          _seconds--;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final int minutes = _seconds ~/ 60;
    final int seconds = _seconds % 60;
    return BlocListener<OtpBloc, OtpState>(
      listener: (BuildContext context, OtpState state) async {
        if (state.status == ApiStatus.success) {
          if (state.result != null) {
            context.goNamed(Routes.explore);
          } else if (state.loginResponse != null) {
            setState(() {
              otpColor = AppColors.baseColor;
              widget.data.code = state.loginResponse?.code;
              controller.clear();
              activeButton = false;
            });
          }
        } else if (state.status == ApiStatus.error) {
          otpColor = AppColors.red;
          showTopSnackBar(
            Overlay.of(context),
            CustomSnackBar.error(
              icon: const Icon(Icons.close, color: AppColors.red,),
              message: state.message ?? "",
            ),
          );
        }
      },
      listenWhen: (OtpState p, OtpState c) => p.status != c.status || p.result != c.result || p.loginResponse != c.loginResponse,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
          actions: [
            IconButton(onPressed: () {  }, icon: SvgPicture.asset(SvgIcons.icInfoCircle)),
            const SizedBox(width: 5)
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 44),
                Center(child: SvgPicture.asset(SvgIcons.icMessages, width: 40, height: 40)),
                const SizedBox(height: 36),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: context.textTheme.titleMedium,
                    children: <InlineSpan>[
                      const TextSpan(
                          text: "Введите проверочный код, который мы отправили на номер ",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.grey2
                          )
                      ),
                      TextSpan(
                          text: localSource.getPhoneNumber(),
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.selectedDayBack
                          )
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  height: 44,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12))
                  ),
                  padding: const EdgeInsets.only(left: 65, right: 65),
                  child: PinInputTextField(
                    pinLength: 4,
                    cursor: Cursor(
                      color: Colors.black,
                      enabled: true,
                      width: 2,
                      height: 30,
                    ),
                    controller: controller,
                    autoFocus: true,
                    onChanged: (String? v) {
                      setState(() {
                        otpColor = AppColors.baseColor;
                        activeButton = v?.length == 4;
                      });
                    },
                    decoration: BoxLooseDecoration(
                      textStyle: TextStyle(color: otpColor, fontSize: 18, fontWeight: FontWeight.w500),
                      strokeColorBuilder: PinListenColorBuilder(otpColor, const Color(0xffECECEC)),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      color: Color(0xFFA4ACB6),
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      const TextSpan(text: 'Отправить повторно '),
                      TextSpan(
                        text: '$minutes:${seconds.toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: Color(0xFFA4ACB6),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                if (!sendCode) IconButton(
                  onPressed: () {
                    _seconds = 60;
                    startTimer();
                    sendCode = true;
                    context.read<OtpBloc>().add(SendLoginEvent(phoneNumber: localSource.getPhoneNumber().replaceAll(" ", "")));
                    setState(() {});
                  },
                  icon: SvgPicture.asset(SvgIcons.icReload),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BlocBuilder<OtpBloc, OtpState>(
          buildWhen: (p, c) => p.status != c.status,
          builder: (_, state) => AnimatedPadding(
            duration: const Duration(milliseconds: 50),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 44),
              child: CustomButton(
                backgroundColor: activeButton ? AppColors.baseColor : AppColors.neutralDenger7,
                onPressed: () {
                  setState(() {
                    if (controller.text.length == 4 && state.status != ApiStatus.loading) {
                      context.read<OtpBloc>().add(OtpAuthEvent(code: controller.text));
                    }
                  });
                },
                label: state.status == ApiStatus.loading
                    ? const CustomProgressIndicator()
                    : Text(
                      "Подтвердить",
                      style: TextStyle(color: activeButton ? AppColors.white : AppColors.neutralDenger5),
                    ),
              ),
            ),
          ),
        )
      )
    );
  }
}

