part of "home_page_bloc.dart";

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();
}

final class GetCategoryEvent extends HomePageEvent{
  const GetCategoryEvent();
  @override
  List<Object?> get props => [ ];
}

final class GetHomeMeEvent extends HomePageEvent {
  const GetHomeMeEvent();
  @override
  List<Object?> get props => [ ];
}

final class GetNotificationUnreadCountEvent extends HomePageEvent {
  const GetNotificationUnreadCountEvent();
  @override
  List<Object?> get props => [ ];
}

final class GetNewsEvent extends HomePageEvent {
  const GetNewsEvent();
  @override
  List<Object?> get props => [ ];
}

final class SendNewsViewEvent extends HomePageEvent {
  const SendNewsViewEvent({required this.id});
  final int id;
  @override
  List<Object?> get props => [ id ];
}
