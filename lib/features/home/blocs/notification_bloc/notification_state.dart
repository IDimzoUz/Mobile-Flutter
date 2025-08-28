part of 'notification_bloc.dart';


class NotificationState extends Equatable {
  const NotificationState({this.status = ApiStatus.initial, this.notificationResponse});

  final ApiStatus status;
  final AllNotificationsResponse? notificationResponse;


  NotificationState copyWith({
    ApiStatus? status,
    AllNotificationsResponse? notificationResponse
  }) => NotificationState(
    status: status ?? this.status,
    notificationResponse: notificationResponse ?? this.notificationResponse,
  );

  @override
  List<Object?> get props => [ status, ];
}
