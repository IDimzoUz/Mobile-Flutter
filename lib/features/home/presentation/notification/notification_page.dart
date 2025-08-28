import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/inputs/custom_text_field.dart";
import "package:imzo/features/home/blocs/notification_bloc/notification_bloc.dart";
import "package:imzo/features/home/presentation/notification/widgets/notification_contract_item_widget.dart";
import "package:imzo/features/home/presentation/notification/widgets/notification_item_widget.dart";

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _PageState();
}

class _PageState extends State<NotificationPage> {

  @override
  void initState() {
    super.initState();
    context.read<NotificationBloc>().add(const GetNotificationEvent());
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<NotificationBloc, NotificationState>(
    buildWhen: (p, n) => p.notificationResponse != n.notificationResponse,
    builder: (context, state) => Scaffold(
      appBar: AppBar(
        title: const Text(
          "Уведомление",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14
          ),
        ),
        backgroundColor: AppColors.baseColor.withOpacity(0.08),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(SvgIcons.icChecks, color: AppColors.baseColor),
          )
        ],
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => AppUtils.kGap,
        itemCount: state.notificationResponse?.content?.length ?? 0,
        itemBuilder: (_, index) {
          var data = state.notificationResponse;
          if (data?.content?[index].type == "CONTRACT_CREATOR_APPROVED") {
            return NotificationContractItemWidget();
          } else {
            return NotificationItemWidget();
          }
        },
      ),
    )
  );
}
