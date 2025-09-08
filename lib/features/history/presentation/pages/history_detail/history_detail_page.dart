import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/bottom_sheet/custom_bottom_sheet.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/features/history/presentation/model/for_me_history_response.dart";
import "package:imzo/features/history/presentation/pages/history_detail/widgets/history_delete_bottom_sheet.dart";
import "package:imzo/router/app_routes.dart";

class HistoryDetailPage extends StatefulWidget {
  const HistoryDetailPage({super.key, this.dataResponse});
  final ForMeHistoryResponse? dataResponse;
  @override
  State<HistoryDetailPage> createState() => _PageState();
}

class _PageState extends State<HistoryDetailPage> {

  late double heightAnimated = 80;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(
        "Документы",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14
        ),
      ),
      backgroundColor: AppColors.baseColor.withOpacity(0.08),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.info_outlined),
        )
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.only(top: 24),
      child: AnimatedContainer(
        duration: Duration.zero,
        decoration: const BoxDecoration(
          color: AppColors.white,
        ),
        height: heightAnimated,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  // heightAnimated = heightAnimated == 80 ? 240 : 80;
                });
              },
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 11),
                decoration: BoxDecoration(
                    color: AppColors.baseColor.withOpacity(0.08),
                    borderRadius: AppUtils.kBorderRadius16
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.dataResponse?.templateName ?? "",
                        textAlign: TextAlign.start,
                        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ),
                    Row(
                      children: [
                        CustomButton(
                          width: 25,
                          height: 25,
                          backgroundColor: AppColors.opacity,
                          padding: EdgeInsets.zero,
                          label: SvgPicture.asset(SvgIcons.icEye),
                          onPressed: () => context.pushNamed((widget.dataResponse!.forMe!) ? Routes.contractDetailForMePage : Routes.contractDetailMyCreatorPage, extra: widget.dataResponse),
                        ),
                        AppUtils.kGap12,
                        CustomButton(
                          width: 25,
                          height: 25,
                          backgroundColor: AppColors.opacity,
                          padding: EdgeInsets.zero,
                          label: SvgPicture.asset(SvgIcons.icDownload),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Visibility(
              visible: heightAnimated == 240,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 11),
                decoration: BoxDecoration(
                    color: AppColors.baseColor.withOpacity(0.08),
                    borderRadius: AppUtils.kBorderRadius16
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(SvgIcons.icDocsDown),
                    AppUtils.kGap6,
                    const Text(
                      "Документ",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    CustomButton(
                      width: 25,
                      height: 25,
                      backgroundColor: AppColors.opacity,
                      padding: EdgeInsets.zero,
                      label: SvgPicture.asset(SvgIcons.icTrash),
                      onPressed: () async {
                        await customModalBottomSheet<void>(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext ctx, _) => HistoryDeleteBottomSheet(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: heightAnimated == 240,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 20),
                padding: const EdgeInsets.symmetric(vertical: 23, horizontal: 11),
                decoration: BoxDecoration(
                    color: AppColors.baseColor.withOpacity(0.08),
                    borderRadius: AppUtils.kBorderRadius16
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(SvgIcons.icVideDown),
                    AppUtils.kGap6,
                    const Text(
                      "Видео",
                      textAlign: TextAlign.start,
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                    const Spacer(),
                    CustomButton(
                      width: 25,
                      height: 25,
                      backgroundColor: AppColors.opacity,
                      padding: EdgeInsets.zero,
                      label: SvgPicture.asset(SvgIcons.icTrash),
                      onPressed: () async {
                        await customModalBottomSheet<void>(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (BuildContext ctx, _) => HistoryDeleteBottomSheet(),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
