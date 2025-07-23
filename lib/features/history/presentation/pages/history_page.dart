import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/history/presentation/bloc/history_bloc.dart";
import "package:imzo/features/history/presentation/bloc/history_state.dart";
import "package:imzo/features/history/presentation/pages/widgets/date_item_widget.dart";
import "package:imzo/features/history/presentation/pages/widgets/history_item_widget.dart";
import "package:imzo/router/app_routes.dart";
import "package:widget_lifecycle/widget_lifecycle.dart";

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _PageState();
}

class _PageState extends State<HistoryPage> {


  @override
  Widget build(BuildContext context) => BlocListener<HistoryBloc, HistoryState>(
    listener: (BuildContext context, HistoryState state) async {},
    listenWhen: (HistoryState p, HistoryState c) => p.status != c.status,
    child: LifecycleAware(
      observer: LifecycleObserver(
          onVisible: (a) { }
      ),
      builder: (BuildContext context, Lifecycle lifecycle) => BlocBuilder<HistoryBloc, HistoryState>(
        buildWhen: (p, n) => p.historyResponse != n.historyResponse,
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: const Text(
              "History",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14
              ),
            ),
            backgroundColor: AppColors.baseColor.withOpacity(0.08),
            actions: [
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(SvgIcons.icInfoCircle),
              ),
            ],
          ),
          body: SafeArea(
            child: Column(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(top: 12, bottom: 10, left: 32, right: 32),
                  decoration: BoxDecoration(
                      color: AppColors.baseColor.withOpacity(0.08),
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
                  ),
                  child: const Row(
                    children: [
                      Flexible(
                        child: CustomButton(
                          label: Text(
                            "Войдите",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16
                            ),
                          ),
                        ),
                      ),
                      AppUtils.kGap12,
                      Flexible(
                        child: CustomButton(
                          backgroundColor: AppColors.white,
                          borderButton: true,
                          borderColor: AppColors.baseColor,
                          label: Text(
                            "Выходы",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: AppColors.black
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                SizedBox(
                      height: 50,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        shrinkWrap: true,
                        separatorBuilder: (_, __) => AppUtils.kGap,
                        itemCount: 10,
                        itemBuilder: (_, index) => DateItemWidget(),
                      ),
                    ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    itemBuilder: (_, int index) => HistoryItemWidget(onTap: () => context.pushNamed(Routes.historyDetailPage)),
                    separatorBuilder: (_, __) => AppUtils.kGap,
                    itemCount: state.historyResponse?.results?.length ?? 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
