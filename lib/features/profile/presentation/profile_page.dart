import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/profile/blocs/profile_page_bloc.dart";
import "package:imzo/features/profile/presentation/mixin/profile_mixin.dart";
import "package:imzo/features/profile/presentation/widgets/profile_item_widget.dart";
import "package:imzo/router/app_routes.dart";
import "package:widget_lifecycle/widget_lifecycle.dart";

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _PageState();
}

class _PageState extends State<ProfilePage> with ProfileMixin {

  late List<ProfileItemModel> dataModel = [
    const ProfileItemModel(icon: SvgIcons.icPerson, title: 'Аккаунт', desc: 'Ваши данные'),
    const ProfileItemModel(icon: SvgIcons.icWallet, title: 'История баланса', desc: ''),
    const ProfileItemModel(icon: SvgIcons.icBell, title: 'Уведомление', desc: ''),
    const ProfileItemModel(icon: SvgIcons.icFaq, title: 'FAQ', desc: 'часто задаваемые вопросы'),
    const ProfileItemModel(icon: SvgIcons.icInformation, title: 'O нас', desc: 'часто задаваемые вопросы'),
    const ProfileItemModel(icon: SvgIcons.icGlobe, title: 'Выбор языка', desc: 'O\'zbekcha, Узбекский'),
  ];

  @override
  Widget build(BuildContext context) => BlocListener<ProfilePageBloc, ProfilePageState>(
    listener: (BuildContext context, ProfilePageState state) async {},
    listenWhen: (ProfilePageState p, ProfilePageState c) => p.status != c.status,
    child: LifecycleAware(
      observer: LifecycleObserver(
        onVisible: (Lifecycle l)  {
          // context.read<HomePageBloc>().add(HomePageLessonsEvent());
        }
      ),
      builder: (BuildContext context, Lifecycle lifecycle) => BlocBuilder<ProfilePageBloc, ProfilePageState>(
        buildWhen: (p, n) => p.status != n.status,
        builder: (context, state) => Scaffold(
          body: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(top: 66, bottom: 32),
                decoration: BoxDecoration(
                  color: AppColors.baseColor.withOpacity(0.08),
                  borderRadius: const BorderRadius.horizontal(left: Radius.circular(16), right: Radius.circular(16))
                ),
                child: Row(
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
                        child: SvgPicture.asset(SvgIcons.icHistory),
                      ),
                    ),
                    AppUtils.kGap8,
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sitirzaev To’lqin",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "ID: 712831623",
                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    CustomButton(
                      shadowEnabled: false,
                      backgroundColor: AppColors.baseColor.withOpacity(0.08),
                      width: 35,
                      borderRadius: AppUtils.kBorderRadius48,
                      height: 35,
                      padding: EdgeInsets.zero,
                      label: const Icon(Icons.edit, color: Color(0xff677294), size: 20,),
                      onPressed: () {
                        localSource.box.clear();
                        context.pushNamed(Routes.editProfilePage);
                      },
                    ),
                    AppUtils.kGap16,
                  ],
                ),
              ),
              Flexible(
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  shrinkWrap: true,
                  separatorBuilder: (_, __) => AppUtils.kGap,
                  itemCount: dataModel.length,
                  itemBuilder: (_, index) => ProfileItemWidget(
                    icon: dataModel[index].icon,
                    title: dataModel[index].title,
                    desc: dataModel[index].desc,
                    onTap: () {
                      switch (index) {
                        case 0: context.pushNamed(Routes.editProfilePage);
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
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.only(bottom: 100, left: 18, right: 18),
            child: CustomButton(
              width: double.infinity,
              backgroundColor: AppColors.baseColor.withOpacity(0.08),
              onPressed: () {
                localSource.box.clear();
                context.goNamed(Routes.languagePage);
              },
              label: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(),
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
  const ProfileItemModel({required this.icon, required this.desc, required this.title});
  final String icon;
  final String title;
  final String desc;
}
