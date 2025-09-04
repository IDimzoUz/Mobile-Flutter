
import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/home/blocs/home_bloc/home_page_bloc.dart";
import "package:imzo/features/home/presentation/mixin/home_mixin.dart";
import "package:imzo/features/home/presentation/widgets/category_item_widget.dart";
import "package:imzo/features/home/presentation/widgets/home_header_view_widget.dart";
import "package:imzo/features/home/presentation/widgets/home_item_widget.dart";
import "package:imzo/features/home/presentation/widgets/home_stories_widget.dart";
import "package:imzo/firebase_options.dart";
import "package:imzo/router/app_routes.dart";
import "package:widget_lifecycle/widget_lifecycle.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.onChangeTab});
  final Function(int)? onChangeTab;
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomeMixin {

  @override
  void initState() {
    super.initState();
    context.read<HomePageBloc>().add(const GetCategoryEvent());
    context.read<HomePageBloc>().add(const GetHomeMeEvent());
    context.read<HomePageBloc>().add(const GetNewsEvent());
    if (localSource.fcmToken?.isNotEmpty ?? false) context.read<HomePageBloc>().add(const PostFCMTokenEvent());
  }

  @override
  Widget build(BuildContext context) => BlocListener<HomePageBloc, HomePageState>(
    listener: (BuildContext context, HomePageState state) async {
      if (state.status == ApiStatus.success) {
        if (state.categoryResponse != null) {
          categoryResponse = state.categoryResponse!;
        }
        if (state.userMeResponse != null) {
          localSource.setVerification(value: state.userMeResponse?.firstName != null);
          userMeResponse = state.userMeResponse!;
        }
        if (state.newsResponse != null) {
          newsResponse = state.newsResponse!;
        }
        setState(() {});
      }
    },
    listenWhen: (HomePageState p, HomePageState c) => p.categoryResponse != c.categoryResponse || p.userMeResponse != c.userMeResponse || p.newsResponse != c.newsResponse,
    child: LifecycleAware(
      observer: LifecycleObserver(
        onVisible: (Lifecycle l) {
          context.read<HomePageBloc>().add(const GetNotificationUnreadCountEvent());
        }
      ),
      builder: (BuildContext context, Lifecycle lifecycle) => BlocBuilder<HomePageBloc, HomePageState>(
        buildWhen: (p, n) => p.categoryResponse != n.categoryResponse || p.userMeResponse != n.userMeResponse || p.unreadCount != n.unreadCount,
        builder: (context, state) => Scaffold(
          body: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 64, bottom: 24),
                decoration: BoxDecoration(
                    color: AppColors.baseColor.withOpacity(0.08),
                  borderRadius: const BorderRadius.horizontal(left: Radius.circular(20), right: Radius.circular(20))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeHeaderViewWidget(data: userMeResponse, unreadCount: state.unreadCount ?? 0),
                    AppUtils.kGap24,
                    HomeStoriesWidget(newsData: newsResponse)
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const HomeItemWidget(),
                      AppUtils.kGap16,
                      SizedBox(
                        height: 50,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          separatorBuilder: (_, __) => AppUtils.kGap,
                          itemCount: categoryResponse?.length ?? 0,
                          itemBuilder: (_, index) => CategoryItemWidget(
                            data: categoryResponse?[index],
                            onTap: () => widget.onChangeTab?.call(1),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    )
  );
}
