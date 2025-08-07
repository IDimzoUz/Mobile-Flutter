part of 'profile_page_bloc.dart';


class ProfilePageState extends Equatable {
  const ProfilePageState({this.status = ApiStatus.initial, this.userMeResponse});

  final ApiStatus status;
  final UserMeResponse? userMeResponse;

  ProfilePageState copyWith({
    ApiStatus? status,
    UserMeResponse? userMeResponse,
  }) => ProfilePageState(
    status: status ?? this.status,
    userMeResponse: userMeResponse ?? this.userMeResponse,
  );

  @override
  List<Object?> get props => [ status, userMeResponse ];
}
