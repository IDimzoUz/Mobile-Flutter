import "package:flutter/material.dart";
import 'package:imzo/core/utils/app_colors.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch({super.key, required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 30));
  }

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: animationController!,
        builder: (context, child) => GestureDetector(
          onTap: () {
            if (animationController!.isCompleted) {
              animationController!.reverse();
            } else {
              animationController!.forward();
            }
            !widget.value ? widget.onChanged(true) : widget.onChanged(false);
          },
          child: Container(
            width: 46,
            height: 28,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 2, bottom: 2, right: 2, left: 2),
              child: Container(
                decoration: BoxDecoration(
                  color: widget.value
                      ? AppColors.baseColor
                      : const Color(0xff787880).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment:
                    widget.value ? Alignment.centerRight : Alignment.centerLeft,
                child: Container(
                  margin: const EdgeInsets.only(
                      top: 2, bottom: 2, right: 2, left: 2),
                  width: 20,
                  height: 20,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  // child: SvgPicture.asset(
                  //     widget.value ? SvgIcons.icCheck : SvgIcons.icMinus),
                ),
              ),
            ),
          ),
        ),
      );
}
