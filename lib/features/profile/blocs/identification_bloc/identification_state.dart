part of 'identification_bloc.dart';


class IdentificationState extends Equatable {
  const IdentificationState({this.status = ApiStatus.initial, this.myIDAccessToken, this.myIDMeResponse, this.userMeResponse});

  final ApiStatus status;
  final MyIDAccessTokenResponse? myIDAccessToken;
  final MyIDMeResponse? myIDMeResponse;
  final UserMeResponse? userMeResponse;

  IdentificationState copyWith({
    ApiStatus? status,
    MyIDAccessTokenResponse? myIDAccessToken,
    MyIDMeResponse? myIDMeResponse,
    UserMeResponse? userMeResponse,
  }) => IdentificationState(
    status: status ?? this.status,
    myIDAccessToken: myIDAccessToken ?? this.myIDAccessToken,
    myIDMeResponse: myIDMeResponse ?? this.myIDMeResponse,
    userMeResponse: userMeResponse ?? this.userMeResponse,
  );
  @override
  List<Object?> get props => [ status, myIDAccessToken, myIDMeResponse, userMeResponse ];
}
