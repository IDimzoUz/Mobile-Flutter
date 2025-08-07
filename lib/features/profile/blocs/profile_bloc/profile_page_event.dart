part of "profile_page_bloc.dart";

sealed class ProfilePageEvent extends Equatable {
  const ProfilePageEvent();
}

final class GetMeEvent extends ProfilePageEvent {
  const GetMeEvent();
  @override
  List<Object?> get props => [ ];
}
