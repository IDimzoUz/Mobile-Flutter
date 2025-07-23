import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:imzo/core/utils/app_colors.dart';
import 'package:imzo/core/utils/utils.dart';
import 'package:imzo/core/widgets/buttons/custom_button.dart';
import 'package:imzo/router/app_routes.dart';

class EditProfileItemWidget extends StatelessWidget {
  const EditProfileItemWidget({
    required this.title,
    required this.desc,
    this.editPhone = false,
    super.key,
  });

  final String title;
  final String desc;
  final bool editPhone;

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      color: AppColors.baseColor.withOpacity(0.08),
      borderRadius: AppUtils.kBorderRadius12,
    ),
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600
                ),
              ),
              AppUtils.kGap4,
              Text(
                desc,
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500
                ),
              ),
            ],
          ),
        ),
        if (editPhone) CustomButton(
          label: const Icon(Icons.edit),
          width: 25,
          height: 25,
          padding: EdgeInsets.zero,
          backgroundColor: AppColors.opacity,
          onPressed: () => context.pushNamed(Routes.auth),
        )
      ],
    ),
  );
}