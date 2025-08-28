part of "notification_bloc.dart";

sealed class NotificationEvent extends Equatable {
  const NotificationEvent();
}

final class GetNotificationEvent extends NotificationEvent{
  const GetNotificationEvent();
  @override
  List<Object?> get props => [ ];
}
//
// final class GetHomeMeEvent extends HomePageEvent {
//   const GetHomeMeEvent();
//   @override
//   List<Object?> get props => [ ];
// }