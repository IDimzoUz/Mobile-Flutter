import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/history/presentation/bloc/history_bloc.dart";
import "package:imzo/features/history/presentation/bloc/history_event.dart";
import "package:imzo/features/history/presentation/bloc/history_state.dart";
import "package:imzo/features/history/presentation/pages/widgets/date_item_widget.dart";
import "package:imzo/features/history/presentation/pages/widgets/history_item_widget.dart";
import "package:imzo/router/app_routes.dart";
import "package:intl/intl.dart";
import "package:widget_lifecycle/widget_lifecycle.dart";

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _PageState();
}

class _PageState extends State<HistoryPage> {

  late bool forMe = false;
  late List<String> monthYearList = generateMonthYearList();
  late String currentMonthYear = getCurrentMonthYear();
  late ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Hozirgi oyni markazga o'tkazish
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentMonth();
    });

  }

  void _scrollToCurrentMonth() {
    final int currentIndex = monthYearList.indexOf(currentMonthYear);
    if (currentIndex != -1) {
      const double itemWidth = 111.0; // Har bir element kengligi
      final double screenWidth = MediaQuery.of(context).size.width;
      final double offset = (currentIndex * itemWidth) - (screenWidth / 2) + (itemWidth / 2);

      _scrollController.animateTo(
        offset.clamp(0.0, _scrollController.position.maxScrollExtent),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }


  void getApi() {
    if (forMe) {
      context.read<HistoryBloc>().add(const GetForMeHistoryEvent(forMe: true));
    } else {
      context.read<HistoryBloc>().add(const GetForMeHistoryEvent(forMe: false));
    }
  }

  String getCurrentMonthYear() {
    final DateTime now = DateTime.now();
    final String formatted = DateFormat('MMMM yyyy', 'ru_RU').format(now);
    return formatted;
  }


  List<String> generateMonthYearList() {
    final List<String> result = [];
    final DateTime now = DateTime.now();

    // Hozirdan bir yil oldin
    final DateTime oneYearAgo = DateTime(now.year - 1, now.month, 1);

    // Hozirdan bir yil keyin
    final DateTime oneYearLater = DateTime(now.year + 1, now.month, 1);

    DateTime current = oneYearAgo;

    while (current.isBefore(oneYearLater) || current.isAtSameMomentAs(oneYearLater)) {
      // Format: Февраль 2025
      final String formatted = DateFormat('MMMM yyyy', 'ru_RU').format(current);
      result.add(formatted);

      // Keyingi oyga o'tamiz
      current = DateTime(current.year, current.month + 1, 1);
    }

    return result;
  }




  @override
  Widget build(BuildContext context) => BlocListener<HistoryBloc, HistoryState>(
    listener: (BuildContext context, HistoryState state) async {},
    listenWhen: (HistoryState p, HistoryState c) => p.status != c.status,
    child: LifecycleAware(
      observer: LifecycleObserver(
          onVisible: (a) {
            getApi();
          }
      ),
      builder: (BuildContext context, Lifecycle lifecycle) => BlocBuilder<HistoryBloc, HistoryState>(
        buildWhen: (p, n) => p.forMeHistoryResponse != n.forMeHistoryResponse,
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
                  child: Row(
                    children: [
                      Flexible(
                        child: CustomButton(
                          borderButton: true,
                          backgroundColor: !forMe ? AppColors.white : AppColors.baseColor,
                          borderColor: AppColors.baseColor,
                          onPressed: () {
                            setState(() {
                              forMe = true;
                              getApi();
                            });
                          },
                          label: Text(
                            "Войдите",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: !forMe ? AppColors.black : AppColors.white
                            ),
                          ),
                        ),
                      ),
                      AppUtils.kGap12,
                      Flexible(
                        child: CustomButton(
                          backgroundColor: forMe ? AppColors.white : AppColors.baseColor,
                          borderButton: true,
                          onPressed: () {
                            setState(() {
                              forMe = false;
                              getApi();
                            });
                          },
                          borderColor: AppColors.baseColor,
                          label: Text(
                            "Выходы",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: forMe ? AppColors.black : AppColors.white
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
                    controller: _scrollController,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    shrinkWrap: true,
                    separatorBuilder: (_, __) => AppUtils.kGap,
                    itemCount: monthYearList.length,
                    itemBuilder: (_, index) => DateItemWidget(
                      title: monthYearList[index],
                      colorSelect: currentMonthYear == monthYearList[index],
                      onTap: () {
                        setState(() {
                          currentMonthYear = monthYearList[index];
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    itemBuilder: (_, int index) => HistoryItemWidget(
                      onTap: () => context.pushNamed(Routes.historyDetailPage, extra: state.forMeHistoryResponse?[index]),
                      responseData: state.forMeHistoryResponse?[index],
                    ),
                    separatorBuilder: (_, __) => AppUtils.kGap,
                    itemCount: state.forMeHistoryResponse?.length ?? 0,
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
