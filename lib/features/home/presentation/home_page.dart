
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import 'package:imzo/features/home/blocs/home_page_bloc.dart';
import "package:imzo/features/home/presentation/mixin/home_mixin.dart";
import "package:imzo/features/home/presentation/widgets/category_item_widget.dart";
import "package:imzo/features/home/presentation/widgets/home_header_view_widget.dart";
import "package:imzo/features/home/presentation/widgets/home_item_widget.dart";
import "package:imzo/features/home/presentation/widgets/home_stories_widget.dart";
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
  }

  @override
  Widget build(BuildContext context) => BlocListener<HomePageBloc, HomePageState>(
    listener: (BuildContext context, HomePageState state) async {},
    listenWhen: (HomePageState p, HomePageState c) => p.categoryResponse != c.categoryResponse,
    child: LifecycleAware(
      observer: LifecycleObserver(
        onVisible: (Lifecycle l) { }
      ),
      builder: (BuildContext context, Lifecycle lifecycle) => BlocBuilder<HomePageBloc, HomePageState>(
        buildWhen: (p, n) => p.categoryResponse != n.categoryResponse,
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
                child: const Column(
                  children: [
                    HomeHeaderViewWidget(),
                    AppUtils.kGap24,
                    HomeStoriesWidget()
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
                          itemCount: state.categoryResponse?.length ?? 0,
                          itemBuilder: (_, index) => CategoryItemWidget(
                            data: state.categoryResponse?[index],
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
