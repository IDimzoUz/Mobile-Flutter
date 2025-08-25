part of 'otp_bloc.dart';

class OtpState extends Equatable {
  const OtpState({required this.status,this.result, this.message, this.loginResponse, this.creatorApprovalCodeResponse, this.verifyApproveCodeResponse});

  final ApiStatus status;
  final OtpAuthResponse? result;
  final LoginResponse? loginResponse;
  final String? message;
  final String? creatorApprovalCodeResponse;
  final CreateContractsResponse? verifyApproveCodeResponse;

  OtpState copyWith({
    ApiStatus? status,
    OtpAuthResponse? result,
    LoginResponse? loginResponse,
    String? creatorApprovalCodeResponse,
    CreateContractsResponse? verifyApproveCodeResponse,
    String? message
  }) => OtpState(
    result: result ?? this.result,
    status: status ?? this.status,
    loginResponse: loginResponse ?? this.loginResponse,
    message: message ?? this.message,
    creatorApprovalCodeResponse: creatorApprovalCodeResponse ?? this.creatorApprovalCodeResponse,
    verifyApproveCodeResponse: verifyApproveCodeResponse ?? this.verifyApproveCodeResponse,
  );
  @override
  List<Object?> get props => [ status, result, message, loginResponse, verifyApproveCodeResponse ];

}


