import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/extension/custom_snackbar/custom_snack_bar.dart";
import "package:imzo/core/extension/custom_snackbar/top_snack_bar.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/auth/presentation/bloc/otp/otp_bloc.dart";
import "package:imzo/features/auth/presentation/pages/auth_page.dart";
import "package:imzo/router/app_routes.dart";

mixin AuthMixin on State<AuthPage> {

  late TextEditingController loginController;

  @override
  void initState() {
    super.initState();
    initControllers();
  }

  void initControllers() {
    loginController = TextEditingController();
  }

  Future<void> pageMovement(AuthState state) async {
    if (state.status == ApiStatus.success) {
      context.pushNamed(Routes.otpPage, extra: state.result);
    } else if (state.status == ApiStatus.error) {
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.error(
          icon: const Icon(Icons.close, color: AppColors.red,),
          message: state.message ?? "",
        ),
      );
    }
  }

  void disposeControllers() {
    loginController.dispose();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }
}
