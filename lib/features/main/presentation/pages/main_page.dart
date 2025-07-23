import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/features/docs/presentation/docs_page.dart";
import "package:imzo/features/history/presentation/pages/history_page.dart";
import "package:imzo/features/home/presentation/home_page.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/features/home/presentation/home_page.dart";
import "package:imzo/features/main/presentation/pages/widgets/navigation_service.dart";
import "package:imzo/features/profile/presentation/profile_page.dart";
import "package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart";

class MainPage extends StatelessWidget {
  const MainPage({
    required this.navigationShell,
    super.key,
  });

  final StatefulNavigationShell navigationShell;

  // Make this method public
  changeTap(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  List<PersistentTabConfig> _tabs(BuildContext context) => [
    PersistentTabConfig(
      screen: HomePage(
        onChangeTab: (index) => changeTap(index, context),
      ),
      item: ItemConfig(
        icon: SvgPicture.asset(SvgIcons.icHome, color: AppColors.baseColor,),
        inactiveIcon: SvgPicture.asset(SvgIcons.icHome, color: AppColors.grey2,),
        title: "Главный",
        activeForegroundColor: AppColors.baseColor,
      ),
    ),
    PersistentTabConfig(
      screen: const DocsPage(),
      item: ItemConfig(
        icon: SvgPicture.asset(SvgIcons.icDocs, color: AppColors.baseColor),
        inactiveIcon: SvgPicture.asset(SvgIcons.icDocs, color: AppColors.grey2),
        title: "Документы",
        activeForegroundColor: AppColors.baseColor,
      ),
    ),
    PersistentTabConfig(
      screen: const HistoryPage(),
      item: ItemConfig(
        icon: SvgPicture.asset(SvgIcons.icRiwayat, color: AppColors.baseColor),
        inactiveIcon: SvgPicture.asset(SvgIcons.icRiwayat, color: AppColors.grey2),
        title: "История",
        activeForegroundColor: AppColors.baseColor,
      ),
    ),
    PersistentTabConfig(
      screen: const ProfilePage(),
      item: ItemConfig(
        icon: SvgPicture.asset(SvgIcons.icProfile, color: AppColors.baseColor),
        inactiveIcon: SvgPicture.asset(SvgIcons.icProfile, color: AppColors.grey2),
        title: "Профиль",
        activeForegroundColor: AppColors.baseColor,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: navigationShell.currentIndex != 0,
    onPopInvoked: (bool v) => navigationShell.goBranch(0),

    child: PersistentTabView(
      tabs: _tabs(context),
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
              borderRadius: AppUtils.kBorderRadius16,
              boxShadow: [
                BoxShadow(
                  color: AppColors.grey.withOpacity(0.3),
                  offset: const Offset(0, 0),
                  blurRadius: 10
                )
              ]
            ),
      ),
    ),
  );


}
