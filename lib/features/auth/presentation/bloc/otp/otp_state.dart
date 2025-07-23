part of 'otp_bloc.dart';

class OtpState extends Equatable {
  const OtpState({required this.status,this.result, this.message, this.loginResponse});

  final ApiStatus status;
  final OtpAuthResponse? result;
  final LoginResponse? loginResponse;
  final String? message;

  OtpState copyWith({
    ApiStatus? status,
    OtpAuthResponse? result,
    LoginResponse? loginResponse,
    String? message
  }) => OtpState(
    result: result ?? this.result,
    status: status ?? this.status,
    loginResponse: loginResponse ?? this.loginResponse,
    message: message ?? this.message
  );
  @override
  List<Object?> get props => [ status, result, message, loginResponse ];

}


