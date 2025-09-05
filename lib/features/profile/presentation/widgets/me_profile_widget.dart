import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/profile/model/user_me_response.dart";
import "package:imzo/router/app_routes.dart";

class MeProfileWidget extends StatelessWidget {
  const MeProfileWidget({super.key, this.data, this.icon, this.onTap, this.editButton = false});
  final UserMeResponse? data;
  final String? icon;
  final bool editButton;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.only(left: 16),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: AppUtils.kBorderRadius48,
          border: Border.all(color: AppColors.baseColor),
        ),
        child: Center(
          child: SvgPicture.asset(SvgIcons.icPerson),
        ),
      ),
      AppUtils.kGap8,
      if (localSource.verification)
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "${data?.firstName ?? ""} ${data?.lastName ?? ""}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "ID: ${data?.id ?? ""}",
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        )
      else
        Expanded(
          child: GestureDetector(
            onTap: () => context.pushNamed(Routes.identificationPage),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Пользователь",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Прохождение идентификации",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.orange,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      if (localSource.verification) const Spacer(),
      if (localSource.verification && editButton) Padding(
        padding: const EdgeInsets.only(right: 10),
        child: CustomButton(
          shadowEnabled: false,
          backgroundColor: AppColors.baseColor.withOpacity(0.08),
          width: 35,
          borderRadius: AppUtils.kBorderRadius48,
          height: 35,
          padding: EdgeInsets.zero,
          label: const Icon(Icons.edit, color: Color(0xff677294), size: 20,),
          onPressed: onTap,
        ),
      ),
    ],
  );
}
