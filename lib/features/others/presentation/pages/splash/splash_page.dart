import "dart:async";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/constants.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/extension/build_context_extension.dart";
import "package:imzo/core/theme/themes.dart";
import "package:imzo/core/widgets/bottom_sheet/custom_bottom_sheet.dart";
import "package:imzo/core/widgets/bottom_sheet/update_app_sheet.dart";
import "package:imzo/router/app_routes.dart";
import "package:imzo/services/remote_config_service.dart";
import "package:url_launcher/url_launcher.dart";

part "mixins/splash_mixin.dart";

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SplashMixin {
  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: systemUiOverlayStyle,
    child: Scaffold(
      backgroundColor: context.colorScheme.surface,
      body: Center(
        child: Image.asset(
          ImagesUrl.icImzoLogo,
          width: 200,
          height: 50,
        ),
      ),
    ),
  );
}
