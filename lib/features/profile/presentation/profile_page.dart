import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/profile/blocs/profile_bloc/profile_page_bloc.dart";
import "package:imzo/features/profile/presentation/mixin/profile_mixin.dart";
import "package:imzo/features/profile/presentation/widgets/me_profile_widget.dart";
import "package:imzo/features/profile/presentation/widgets/profile_item_widget.dart";
import "package:imzo/router/app_routes.dart";
import "package:widget_lifecycle/widget_lifecycle.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _PageState();
}

class _PageState extends State<ProfilePage> with ProfileMixin {


  @override
  Widget build(BuildContext context) => BlocListener<ProfilePageBloc, ProfilePageState>(
    listener: (BuildContext context, ProfilePageState state) async {},
    listenWhen: (ProfilePageState p, ProfilePageState c) => p.status != c.status,
    child: LifecycleAware(
      observer: LifecycleObserver(
        onVisible: (Lifecycle l) {
          dataModel = localSource.verification ? verifyDataModel : noVerifyDataModel;
          setState(() {});
        }
      ),
      builder: (BuildContext context, Lifecycle lifecycle) => BlocBuilder<ProfilePageBloc, ProfilePageState>(
        buildWhen: (p, n) => p.status != n.status,
        builder: (context, state) => Scaffold(
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<ProfilePageBloc>().add(const GetMeEvent());
            },
            color: AppColors.baseColor,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 66, bottom: 32),
                  decoration: BoxDecoration(
                    color: AppColors.baseColor.withOpacity(0.08),
                    borderRadius: const BorderRadius.horizontal(left: Radius.circular(16), right: Radius.circular(16))
                  ),
                  child: MeProfileWidget(data: state.userMeResponse, editButton: true),
                ),
                Flexible(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    separatorBuilder: (_, __) => AppUtils.kGap,
                    itemCount: dataModel.length,
                    itemBuilder: (_, index) => ProfileItemWidget(
                      icon: dataModel[index].icon,
                      title: dataModel[index].title,
                      desc: dataModel[index].desc,
                      onTap: () {
                        switch (dataModel[index].index) {
                          case 0: context.pushNamed(Routes.editProfilePage, extra: state.userMeResponse);
                            break;
                          case 1: context.pushNamed(Routes.historyBalansPage);
                            break;
                          case 2: break;
                          case 3: break;
                          default: break;
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 100, left: 18, right: 18),
            child: CustomButton(
              width: double.infinity,
              backgroundColor: AppColors.baseColor.withOpacity(0.08),
              onPressed: () {
                localSource.box.clear();
                localSource.setVerification(value: false);
                context.goNamed(Routes.languagePage);
              },
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  const Text(
                    'Выход',
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SvgPicture.asset(SvgIcons.icExit)
                ],
              ),
            ),
          ),
        ),
      )
    )
  );
}



class ProfileItemModel {
  const ProfileItemModel({required this.icon, required this.desc, required this.title, required this.index});
  final String icon;
  final String title;
  final String desc;
  final int index;
}
