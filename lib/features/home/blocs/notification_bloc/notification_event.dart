part of "notification_bloc.dart";

sealed class NotificationEvent extends Equatable {
  const NotificationEvent();
}

final class GetNotificationEvent extends NotificationEvent{
  const GetNotificationEvent();
  @override
  List<Object?> get props => [ ];
}

final class PutNotificationIsReadEvent extends NotificationEvent {
  const PutNotificationIsReadEvent({required this.allRead, required this.id});
  final int id;
  final bool allRead;
  @override
  List<Object?> get props => [ id, allRead ];
}

final class DeleteContractNotificationEvent extends NotificationEvent {
  const DeleteContractNotificationEvent({required this.id});
  final int id;
  @override
  List<Object?> get props => [ id ];
}