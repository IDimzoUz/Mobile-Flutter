import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";


enum CustomLabelButton { label, icon }

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.label,
    super.key,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    this.height = 54,
    this.shadowEnabled = false,
    this.backgroundColor,
    this.isActivated = true,
    this.width = double.infinity,
    this.borderRadius = AppUtils.kBorderRadius16,
    this.padding = const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    this.borderColor,
    this.borderButton = false
  });

  final Widget label;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final VoidCallback? onPressed;
  final double height;
  final double width;
  final bool shadowEnabled;
  final bool isActivated;
  final Color? backgroundColor;
  final Color? borderColor;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;
  final bool borderButton;

  @override
  Widget build(BuildContext context) {

    /// Label
    final Widget labelA = DefaultTextStyle(
      style: const TextStyle(
        height: 20 / 15,
        fontSize: 15,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      child: label,
    );

    /// Icon
    final Widget childA;
    if (leftIcon != null || rightIcon != null) {
      childA = Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (leftIcon != null)
            IconTheme(
              data: const IconThemeData(color: Colors.white, size: 20),
              child: leftIcon!,
            ),
          if (leftIcon != null) const SizedBox(width: 8),
          labelA,
          if (rightIcon != null) const SizedBox(width: 8),
          if (rightIcon != null)
            IconTheme(
              data: const IconThemeData(color: Colors.white, size: 20),
              child: rightIcon!,
            ),
        ],
      );
    } else {
      childA = labelA;
    }
    return InkWell(
      onTap: isActivated ? onPressed : null,
      borderRadius: borderRadius,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: DecoratedBox(
        decoration: const BoxDecoration(
            color: Colors.transparent,
        ),
        child: Container(
          margin: const EdgeInsets.all(1),
          height: height,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: isActivated ? backgroundColor ?? AppColors.baseColor : const Color(0xff0B0C0E).withOpacity(0.1),
            border: borderButton ? Border.all(color: borderColor ?? const Color(0xffE2E8F0)) : null,
            boxShadow: [
              if (shadowEnabled) BoxShadow(
                color: Colors.grey.withOpacity(0.3), // Shadow color
                spreadRadius: 5, // Spread radius
                blurRadius: 10, // Blur radius
                offset: const Offset(0, 3), // Offset
              ),
            ],
          ),

          padding: padding,
          child: childA,
        ),
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(ObjectFlagProperty<VoidCallback?>.has("onPressed", onPressed))
      ..add(DoubleProperty("height", height));
  }
}
