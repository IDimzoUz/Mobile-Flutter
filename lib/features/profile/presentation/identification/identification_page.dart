import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/extension/custom_snackbar/custom_snack_bar.dart";
import "package:imzo/core/extension/custom_snackbar/top_snack_bar.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/inputs/custom_text_field.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/profile/blocs/identification_bloc/identification_bloc.dart";
import "package:imzo/features/profile/presentation/edit_profile/widgets/edit_profile_item_widget.dart";
import "package:imzo/features/profile/presentation/identification/widgets/loading_dialog.dart";
import "package:myid/enums.dart";
import "package:myid/myid.dart";
import "package:myid/myid_config.dart";

class IdentificationPage extends StatefulWidget {
  const IdentificationPage({super.key});
  @override
  State<IdentificationPage> createState() => _PageState();
}

class _PageState extends State<IdentificationPage> {

  late double heightAnimated = 75;
  String? _error;
  MyIdResult? _result;

  Future<void> init() async {
    String? error;
    MyIdResult? result;

    try {
      const clientId = 'idimzo_sdk-e2PanrcJgk74CaAL3xIjBbsMkPJFKERlNDQvP8AV';
      const clientHashId = '2a67a6e0-19d9-4f8f-80fc-cd482a820723';
      const clientHash = 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxWTEjiwm/++Jeo7paGwhXtpgV+k770aW1dyzUoWTZJoWNOpQuFVdN29wk0i+POtJScQXrgi3h83g8ljWhjsPDhWFhmdf17i1dEHMo/iExATwNBNL4nxGXD2W0PpsJyf9PBR502IOCXDjsBmIOG6npI7JVCxXb7H3IajcN4+c44u2fQ0S8GY1UMavmMjVQE0LSvmOnhZQ6zgSCPPgSL22sX+Fq5KPpfKco2brfgyibRt4SzVZHUWlzSqGXs9pIpjHkS7MXNVMpSe3RndAPIec8+diL2yIV3LrNuXrtM4L+6RB5ciR7rWKj29HFFfydBR/MjvE0pXJ5OdBJrcz/Y+8XQIDAQAB';

      final myIdResult = await MyIdClient.start(
        config: MyIdConfig(
            clientId: clientId,
            clientHash: clientHash,
            clientHashId: clientHashId,
            environment: MyIdEnvironment.DEBUG,
            entryType: MyIdEntryType.IDENTIFICATION,
            locale: MyIdLocale.UZBEK,
            imageFormat: MyIdImageFormat.JPEG
        ),
        iosAppearance: const MyIdIOSAppearance(),
      );
      error = null;
      result = myIdResult;
      print('CODE- ${result.code}');
      loadingMyID();
      context.read<IdentificationBloc>().add(GetMyIDTokenEvent(code: result.code ?? ""));
    } catch (e) {
      error = e.toString();
      result = null;
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
  Widget build(BuildContext context) => BlocListener<IdentificationBloc, IdentificationState>(
  listener: (BuildContext context, IdentificationState state) async {
    if (state.myIDAccessToken != null) {
      print('State Token => ${state.myIDAccessToken?.accessToken}');
      context.read<IdentificationBloc>().add(GetMyIDMeEvent(token: state.myIDAccessToken?.accessToken ?? ""));
    }
    if (state.myIDMeResponse != null) {
      context.read<IdentificationBloc>().add(
        EditProfileEvent(
          firstName: state.myIDMeResponse?.profile?.commonData?.firstName,
          lastName: state.myIDMeResponse?.profile?.commonData?.lastName,
          email: state.myIDMeResponse?.profile?.contacts?.email,
        ),
      );
    } else if (state.status == ApiStatus.error) {
      context.pop();
      topSnackbar(true);
    }
    Future.delayed(const Duration(seconds: 3));
    if (state.userMeResponse != null) {
      topSnackbar(false);
      context.pop();
      context.pop();
    } else if (state.status == ApiStatus.error) {
      context.pop();
      topSnackbar(true);
    }
  },
  listenWhen: (IdentificationState p, IdentificationState c) => p.status != c.status || p.myIDAccessToken != c.myIDAccessToken || p.myIDMeResponse != c.myIDMeResponse || p.userMeResponse != c.userMeResponse,
  child: Scaffold(
    appBar: AppBar(
      backgroundColor: AppColors.baseColor.withOpacity(0.08),
      title: const Text(
        "Прохождение идентификации",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
    ),
    body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 20),
          decoration: BoxDecoration(
              color: AppColors.baseColor.withOpacity(0.08),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              'На единый портал интерактивных государственных услуг!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.baseColor
              ),
            ),
          ),
        ),
        AppUtils.kGap24,
        Flexible(
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      heightAnimated = heightAnimated == 325 ? 75 : 325;
                    });
                  },
                  child: AnimatedContainer(
                    height: heightAnimated,
                    duration: Duration.zero,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 22),
                    decoration: BoxDecoration(
                        color: AppColors.baseColor.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Войти через One ID',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.black
                              ),
                            ),
                            SvgPicture.asset(SvgIcons.icOneId, height: 23)
                          ],
                        ),
                        if (heightAnimated == 325) Column(
                          children: [
                            AppUtils.kGap24,
                            CustomTextField(
                              hintText: "Логин",
                              fillColor: AppColors.baseColor.withOpacity(0.08),
                              cursorColor: AppColors.grey2,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: AppColors.baseColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: AppColors.baseColor),
                              ),
                            ),
                            AppUtils.kGap12,
                            CustomTextField(
                              hintText: "Пароль",
                              fillColor: AppColors.baseColor.withOpacity(0.08),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(SvgIcons.icEye),
                              ),
                              cursorColor: AppColors.grey2,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: AppColors.baseColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(color: AppColors.baseColor),
                              ),
                            ),
                            CustomButton(
                              padding: EdgeInsets.zero,
                              backgroundColor: AppColors.opacity,
                              height: 25,
                              onPressed: () {},
                              label: const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Забыли логин или пароль?',
                                  style: TextStyle(
                                      color: AppColors.black,
                                      fontSize: 11,
                                      fontWeight: FontWeight.w400
                                  ),
                                ),
                              ),
                            ),
                            CustomButton(
                              height: 35,
                              onPressed: () {},
                              borderRadius: AppUtils.kBorderRadius12,
                              label: Text('Войти'),
                              padding: EdgeInsets.zero,
                            ),
                            AppUtils.kGap12,
                            const CustomButton(
                              height: 35,
                              borderButton: true,
                              borderRadius: AppUtils.kBorderRadius12,
                              borderColor: AppColors.baseColor,
                              backgroundColor: AppColors.opacity,
                              padding: EdgeInsets.zero,
                              label: Text(
                                'Регистрация',
                                style: TextStyle(
                                    color: AppColors.baseColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    init();
                    print('asd');
                  },
                  child: AnimatedContainer(
                    height: 70,
                    duration: Duration.zero,
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 22),
                    decoration: BoxDecoration(
                        color: AppColors.baseColor.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Войти через MyID',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black
                          ),
                        ),
                        SvgPicture.asset(SvgIcons.icMyId, height: 23)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    ),
   )
  );
}
