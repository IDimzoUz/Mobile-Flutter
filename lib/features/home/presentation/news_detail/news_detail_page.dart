import "dart:io";

import "package:flutter/material.dart";
import "package:go_router/go_router.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/custom_cached_network_image.dart";
import "package:imzo/features/home/model/news_response.dart";
import "package:url_launcher/url_launcher.dart";

class NewsDetailPage extends StatefulWidget {
  const NewsDetailPage({super.key, this.newsDetail});
  final NewsResponse? newsDetail;
  @override
  State<NewsDetailPage> createState() => _JobsDetailPageState();
}

class _JobsDetailPageState extends State<NewsDetailPage> with SingleTickerProviderStateMixin  {

  AnimationController? _controller;
  bool _showProgress = true;

  @override
  void initState() {
    super.initState();
    // AnimationController ni sozlash (10 soniya davom etadi)
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: Platform.isIOS ? 5 : 50),
    )..addListener(() {
      setState(() {});
    });

    // 10 soniyadan so'ng progressni yo'qotish
    _controller?.forward().whenComplete(() {
      setState(() {
        _showProgress = false;
        context.pop();
      });
    });
  }

  @override
  void dispose() {
    _controller!.dispose(); // Controller ni tozalash
    super.dispose();
  }


  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: AppColors.red,
    body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            color: AppColors.white,
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(topLeft: AppUtils.kRadius12, topRight: AppUtils.kRadius12),
            child: CustomCachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: widget.newsDetail?.mediaUrl ?? ""
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              LinearProgressIndicator(
                minHeight: 4,
                value: _controller?.value,
                color: AppColors.white,
                backgroundColor: AppColors.white.withOpacity(0.45),
              ),
              AppUtils.kGap8,
              CustomButton(
                width: 50,
                height: 50,
                backgroundColor: AppColors.opacity,
                padding: EdgeInsets.zero,
                label: const Icon(Icons.clear, color: AppColors.white),
                onPressed: () { context.pop(); },
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 40),
            child: CustomButton(
              shadowEnabled: false,
              label: const Text(
                "Подробнее",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15, color: AppColors.white),
              ),
              onPressed: () {
                launchUrl(Uri.parse(widget.newsDetail?.externalLink ?? ""));
              },
            ),
          ),
        )
      ],
    ),
  );
}
