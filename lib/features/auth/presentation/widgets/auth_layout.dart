import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:imzo/core/utils/utils.dart";

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    required this.title,
    required this.child,
    super.key,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppUtils.kPaddingHor16,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AppUtils.kGap12,
            Text(title),
            Expanded(child: child),
          ],
        ),
      );

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      StringProperty("title", title),
    );
  }
}
