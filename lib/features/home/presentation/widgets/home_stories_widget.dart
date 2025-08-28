import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/home/blocs/home_bloc/home_page_bloc.dart";
import "package:imzo/features/home/model/news_response.dart";
import "package:imzo/features/home/presentation/widgets/stories_item_widget.dart";
import "package:imzo/router/app_routes.dart";


class HomeStoriesWidget extends StatefulWidget {
  const HomeStoriesWidget({super.key, this.newsData});
  final List<NewsResponse>? newsData;
  @override
  State<HomeStoriesWidget> createState() => _PageState();
}

class _PageState extends State<HomeStoriesWidget> {

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 100,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, right: 16),
      shrinkWrap: true,
      separatorBuilder: (_, __) => AppUtils.kGap,
      itemCount: widget.newsData?.length ?? 0,
      itemBuilder: (_, index) => StoriesItemWidget(
        data: widget.newsData?[index],
        onTap: () {
          widget.newsData?[index].viewed = true;
          context.read<HomePageBloc>().add(SendNewsViewEvent(id: widget.newsData?[index].id ?? 0));
          context.pushNamed(Routes.newsDetailPage, extra: widget.newsData?[index]);
          setState(() { });
        },
      ),
    ),
  );

}
