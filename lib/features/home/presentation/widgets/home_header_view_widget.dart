import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/router/app_routes.dart";

class HomeHeaderViewWidget extends StatelessWidget {
  const HomeHeaderViewWidget({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => context.pushNamed(Routes.identificationPage),
    child: Row(
      children: [
        Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.only(left: 16),
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: AppUtils.kBorderRadius48,
              border: Border.all(color: AppColors.baseColor)
          ),
          child: Center(
            child: SvgPicture.asset(SvgIcons.icHistory),
          ),
        ),
        AppUtils.kGap8,
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Пользователь",
              style: TextStyle(
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "Прохождение идентификации",
              style: TextStyle(
                color: AppColors.orange,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        const Spacer(),
        CustomButton(
          backgroundColor: AppColors.opacity,
          width: 50,
          onPressed: () => context.pushNamed(Routes.notificationPage),
          label: SvgPicture.asset(SvgIcons.icNotification),
        )
      ],
    ),
  );
}
