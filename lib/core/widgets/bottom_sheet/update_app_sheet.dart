import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:imzo/core/utils/utils.dart";

class AppUpdateBottomSheetWidget extends StatelessWidget {
  const AppUpdateBottomSheetWidget({
    required this.isForceUpdate,
    super.key,
    this.onTap,
  });

  final void Function()? onTap;
  final bool isForceUpdate;

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        child: SafeArea(
          minimum: AppUtils.kPaddingAll16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "New version",
                textAlign: TextAlign.center,
              ),
              AppUtils.kGap8,
              const Text(
                "App Name has become even more convenient",
                textAlign: TextAlign.center,
              ),
              AppUtils.kGap16,
              ElevatedButton(
                onPressed: onTap,
                child: const Text("Update"),
              ),
              if (!isForceUpdate) AppUtils.kGap8,
              if (!isForceUpdate)
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Later"),
                ),
            ],
          ),
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<void Function()?>.has("onTap", onTap))
      ..add(DiagnosticsProperty<bool>("isForceUpdate", isForceUpdate));
  }
}
