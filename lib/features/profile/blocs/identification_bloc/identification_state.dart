part of 'identification_bloc.dart';


class IdentificationState extends Equatable {
  IdentificationState({this.status = ApiStatus.initial, this.myIDAccessToken, this.myIDMeResponse, this.userMeResponse, this.oneIDUrl});

  final ApiStatus status;
  final MyIDAccessTokenResponse? myIDAccessToken;
  final MyIDMeResponse? myIDMeResponse;
  final UserMeResponse? userMeResponse;
  String? oneIDUrl;

  IdentificationState copyWith({
    ApiStatus? status,
    MyIDAccessTokenResponse? myIDAccessToken,
    MyIDMeResponse? myIDMeResponse,
    UserMeResponse? userMeResponse,
    String? oneIDUrl
  }) => IdentificationState(
    status: status ?? this.status,
    myIDAccessToken: myIDAccessToken ?? this.myIDAccessToken,
    myIDMeResponse: myIDMeResponse ?? this.myIDMeResponse,
    userMeResponse: userMeResponse ?? this.userMeResponse,
    oneIDUrl: oneIDUrl ?? this.oneIDUrl
  );
  @override
  List<Object?> get props => [ status, myIDAccessToken, myIDMeResponse, userMeResponse, oneIDUrl ];
}
