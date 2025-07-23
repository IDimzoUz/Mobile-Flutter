part of "../splash_page.dart";

mixin SplashMixin on State<SplashPage> {
  @override
  void initState() {
    super.initState();
    if (!mounted) {
      return;
    }
    Future.delayed(const Duration(seconds: 2), () {
      // ignore: discarded_futures
      RemoteConfigService.isCallCheckAppVersion(context).then(
            ((AppUpdate, String, String) value) async {
          if (value.$1 != AppUpdate.none) {
            await appUpdateBottomSheet(
              isForceUpdate: value.$1 == AppUpdate.forceUpdate,
            ).then((_) => nextToNavigation());
          } else {
            await nextToNavigation();
          }
        },
      );
    });
  }

  Future<void> nextToNavigation() async {
    print("TOKEN: ${localSource.accessToken}");
    if (localSource.accessToken.isEmpty)  {
      context.goNamed(Routes.languagePage);
    } else {
      context.goNamed(Routes.explore);
    }
    return;
  }

  Future<void> appUpdateBottomSheet({
    required bool isForceUpdate,
  }) async {
    await customModalBottomSheet<bool>(
      context: context,
      enableDrag: false,
      builder: (_, ScrollController? controller) => AppUpdateBottomSheetWidget(
        isForceUpdate: isForceUpdate,
        onTap: () async {
          await launchUrl(
            Uri.parse(Constants.appLink),
            mode: LaunchMode.externalApplication,
          ).then(
            (bool value) async {
              if (!mounted) {
                return;
              }
              await nextToNavigation();
            },
          );
        },
      ),
    );
  }
}
