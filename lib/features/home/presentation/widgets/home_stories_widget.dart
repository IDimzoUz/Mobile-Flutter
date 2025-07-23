import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/home/presentation/widgets/stories_item_widget.dart";

class HomeStoriesWidget extends StatelessWidget {
  const HomeStoriesWidget({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 100,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, right: 16),
      shrinkWrap: true,
      separatorBuilder: (_, __) => AppUtils.kGap,
      itemCount: 10,
      itemBuilder: (_, index) => StoriesItemWidget(),
    ),
  );

}
