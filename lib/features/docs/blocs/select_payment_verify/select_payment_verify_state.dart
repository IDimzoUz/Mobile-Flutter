part of 'select_payment_verify_bloc.dart';


class SelectPaymentVerifyState extends Equatable {
  const SelectPaymentVerifyState({this.status = ApiStatus.initial, this.myIDAccessToken, this.myIDMeResponse, this.contractsResponse});

  final ApiStatus status;
  final MyIDAccessTokenResponse? myIDAccessToken;
  final MyIDMeResponse? myIDMeResponse;
  final CreateContractsResponse? contractsResponse;

  SelectPaymentVerifyState copyWith({
    ApiStatus? status,
    MyIDAccessTokenResponse? myIDAccessToken,
    MyIDMeResponse? myIDMeResponse,
    CreateContractsResponse? contractsResponse,
  }) => SelectPaymentVerifyState(
    status: status ?? this.status,
    myIDAccessToken: myIDAccessToken ?? this.myIDAccessToken,
    myIDMeResponse: myIDMeResponse ?? this.myIDMeResponse,
    contractsResponse: contractsResponse ?? this.contractsResponse,
  );

  @override
  List<Object?> get props => [ status, myIDAccessToken, myIDMeResponse, contractsResponse ];
}
