import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:go_router/go_router.dart";
import "package:imzo/constants/image_constants.dart";
import "package:imzo/core/utils/app_colors.dart";
import "package:imzo/core/utils/utils.dart";
import "package:imzo/core/widgets/buttons/custom_button.dart";
import "package:imzo/core/widgets/inputs/custom_text_field.dart";
import "package:imzo/features/home/blocs/notification_bloc/notification_bloc.dart";
import "package:imzo/features/home/model/notifications_response.dart";
import "package:imzo/features/home/presentation/notification/widgets/notification_contract_item_widget.dart";
import "package:imzo/features/home/presentation/notification/widgets/notification_item_widget.dart";
import "package:imzo/router/app_routes.dart";

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

  void callIsReadApi(int id, bool isRead) {
    context.read<NotificationBloc>().add(PutNotificationIsReadEvent(id: id, allRead: isRead));
  }

  @override
  Widget build(BuildContext context) => BlocBuilder<NotificationBloc, NotificationState>(
    buildWhen: (p, n) => p.notificationResponse != n.notificationResponse,
    builder: (context, state) {
      bool checkAllRead(List<Content> messages) {
        for (var message in messages) {
          if (!message.isRead!) {
            return false;
          }
        }
        return true;
      }
      return Scaffold(
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
              onPressed: () {
                setState(() {
                  if (state.notificationResponse != null) {
                    for (var a in state.notificationResponse!.content!) {
                      a.isRead = true;
                    }
                  }
                });
                if (checkAllRead(state.notificationResponse?.content ?? [])) callIsReadApi(0, true);
              },
              icon: SvgPicture.asset(SvgIcons.icChecks, color: checkAllRead(state.notificationResponse?.content ?? []) ? AppColors.grey2 : AppColors.baseColor),
            )
          ],
        ),
        body: ListView.separated(
          separatorBuilder: (_, __) => AppUtils.kGap,
          itemCount: state.notificationResponse?.content?.length ?? 0,
          itemBuilder: (_, index) {
            var data = state.notificationResponse;
            if (data?.content?[index].type == "CONTRACT_CREATOR_APPROVED") {
              return NotificationContractItemWidget(
                data: data?.content?[index],
                onTapOpen: () {
                  if (!(data?.content?[index].isRead ?? false)) callIsReadApi(data?.content?[index].id ?? 0, false);
                  setState(() {
                    data?.content?[index].isRead = true;
                  });
                  context.pushNamed(Routes.contractDetailPage, extra: data?.content?[index].contractId);
                }
              );
            } else {
              return GestureDetector(
                onTap: () {
                  if (!(data?.content?[index].isRead ?? false)) callIsReadApi(data?.content?[index].id ?? 0, false);
                  setState(() {
                    data?.content?[index].isRead = true;
                  });
                },
                child: NotificationItemWidget(data: data?.content?[index]),
              );
            }
          },
        ),
      );
    }
  );
}
