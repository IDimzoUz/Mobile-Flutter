import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({super.key});

  @override
  Widget build(BuildContext context) => Column(
    children: [
      AppUtils.kGap16,
      Row(
        children: [
          AppUtils.kGap16,
          Flexible(
            child: Container(
              height: 200,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: const BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: AppUtils.kBorderRadius16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(SvgIcons.icVerticalList, width: 60, height: 60, color: AppColors.white),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Количество контрактов",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.white
                    ),
                  ),
                  Text(
                    "4",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white
                    ),
                  ),
                  Text(
                    "обновлено 5 мин назад",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppUtils.kGap16,
          Flexible(
            child: Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: const BoxDecoration(
                color: AppColors.baseColor,
                borderRadius: AppUtils.kBorderRadius16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(SvgIcons.icCalendarBig, width: 60, height: 60, color: AppColors.white),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Дата окончания срока",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white
                    ),
                  ),
                  const Text(
                    "4",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white
                    ),
                  ),
                  Text(
                    "Окончание через 10 дней!",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppUtils.kGap16,
        ],
      ),
      AppUtils.kGap16,
      Row(
        children: [
          AppUtils.kGap16,
          Flexible(
            child: Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: const BoxDecoration(
                color: AppColors.lightBlue,
                borderRadius: AppUtils.kBorderRadius16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(SvgIcons.icCheckWhite, width: 60, height: 60),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Расторгнутый контракт",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white
                    ),
                  ),
                  Text(
                    "1",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white
                    ),
                  ),
                  Text(
                    "Обновлено 5 дней назад",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppUtils.kGap16,
          Flexible(
            child: Container(
              height: 200,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              decoration: const BoxDecoration(
                color: AppColors.orange,
                borderRadius: AppUtils.kBorderRadius16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 5, right: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SvgPicture.asset(SvgIcons.icClock, width: 60, height: 60),
                    ),
                  ),
                  Spacer(),
                  Text(
                    "В процессе В процессе В процессе",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white
                    ),
                  ),
                  Text(
                    "4",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white
                    ),
                  ),
                  Text(
                    "обновлено 15 мин назад обновлено 15 мин назад",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
          AppUtils.kGap16,
        ],
      ),
    ],
  );

}
