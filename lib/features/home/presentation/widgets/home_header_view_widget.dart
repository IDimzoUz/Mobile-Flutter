import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/profile/model/user_me_response.dart";
import "package:imzo/features/profile/presentation/widgets/me_profile_widget.dart";
import "package:imzo/router/app_routes.dart";

class HomeHeaderViewWidget extends StatelessWidget {
  const HomeHeaderViewWidget({super.key, this.data, this.unreadCount = 0});
  final UserMeResponse? data;
  final int unreadCount;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: () => localSource.verification ? context.pushNamed(Routes.editProfilePage, extra: data) : context.pushNamed(Routes.identificationPage),
    child: Row(
      children: [
        AppUtils.kGap8,
        Flexible(child: MeProfileWidget(data: data)),
        CustomButton(
          backgroundColor: AppColors.opacity,
          width: 50,
          onPressed: () => context.pushNamed(Routes.notificationPage),
          label: Stack(
            alignment: Alignment.bottomRight,
            children: [
              SvgPicture.asset(SvgIcons.icNotification),
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: CircleAvatar(
                  radius: 5, // radius = diameter / 5
                  backgroundColor: unreadCount != 0 ? AppColors.red : AppColors.opacity
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}
