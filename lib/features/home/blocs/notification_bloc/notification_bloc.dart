import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_local_notifications/flutter_local_notifications.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/home/model/category_response.dart";
import "package:imzo/features/home/model/news_response.dart";
import "package:imzo/features/home/model/notifications_response.dart";
import "package:imzo/features/profile/model/user_me_response.dart";

part "notification_event.dart";
part "notification_state.dart";

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc({required this.repository}) : super(const NotificationState(status: ApiStatus.initial)) {
    on<GetNotificationEvent>(_getAllNotifications);
    on<PutNotificationIsReadEvent>(_putNotificationIsRead);
  }

  final Repository repository;

  Future<void> _getAllNotifications(GetNotificationEvent event, Emitter<NotificationState> emit) async {
    final result = await repository.getNotifications();
    await result.fold(
       (Failure left) { emit(const NotificationState(status: ApiStatus.error)); },
       (AllNotificationsResponse right) async {
        emit(NotificationState(status: ApiStatus.success, notificationResponse: right));
      },
    );
  }

  Future<void> _putNotificationIsRead(PutNotificationIsReadEvent event, Emitter<NotificationState> emit) async {
      final result = await repository.editNotificationIsRead(id: event.id, allRead: event.allRead);
      await result.fold( (Failure left) { }, (bool right) async { },
    );
  }


}
