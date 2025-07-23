import "package:flutter/material.dart";
import "package:imzo/core/utils/app_colors.dart";

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({
    this.width = 25,
    this.height = 25,
    this.color = AppColors.white,
    this.backgroundColor = AppColors.opacity,
    super.key,
  });

  final double width;
  final double height;
  final Color backgroundColor;
  final Color color;

  @override
  Widget build(BuildContext context) => SizedBox(
    height: height,
    width: width,
    child: CircularProgressIndicator(
      backgroundColor: backgroundColor,
      color: color,
    ),
  );

}
