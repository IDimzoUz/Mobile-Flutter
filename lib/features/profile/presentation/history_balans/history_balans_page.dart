import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/extension/build_context_extension.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/inputs/custom_text_field.dart";
import "package:imzo/features/docs/presentation/widgets/docs_item_widget.dart";
import "package:imzo/features/others/presentation/pages/language/language_page.dart";
import "package:imzo/features/others/presentation/pages/language/widgets/lan_checkbox_widget.dart";
import "package:imzo/features/profile/presentation/history_balans/widgets/history_balans_item_widget.dart";
import "package:imzo/router/app_routes.dart";

class HistoryBalansPage extends StatefulWidget {
  const HistoryBalansPage({super.key});

  @override
  State<HistoryBalansPage> createState() => _PageState();
}

class _PageState extends State<HistoryBalansPage> {

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text(
        "История баланса",
        style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14
        ),
      ),
      backgroundColor: AppColors.baseColor.withOpacity(0.08),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.info_outlined),
        )
      ],
    ),
    body: Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 15, left: 20, right: 20),
          decoration: BoxDecoration(
              color: AppColors.baseColor.withOpacity(0.08),
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Недавно транзакция',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500
                ),
              ),
              Text(
                'Смотреть все',
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 100),
            itemBuilder: (_, int index) => HistoryBalansItemWidget(
              onTap: () {},
              title: 'Payme',
              date: '03 Jan 2025',
              sum: '+200 000.68 so\'m',
              icon: SvgIcons.icClick,
            ),
            separatorBuilder: (_, __) => AppUtils.kGap,
            itemCount: 12,
          ),
        ),
      ],
    ),
  );
}
