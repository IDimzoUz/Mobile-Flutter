import "package:flutter/material.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/features/history/presentation/model/for_me_history_response.dart";


class ContractDetailPage extends StatefulWidget {
  const ContractDetailPage({super.key, this.content});
  final ForMeHistoryResponse? content;
  @override
  State<ContractDetailPage> createState() => _PageState();
}

class _PageState extends State<ContractDetailPage> {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text(
        widget.content?.templateName ?? "",
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
      ),
      backgroundColor: AppColors.baseColor.withOpacity(0.08),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.info_outlined),
        )
      ],
    ),
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppUtils.kGap24,
          Text(
            widget.content?.content ?? "",
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
          ),
        ],
      ),
    ),
  );
}
