import 'package:equatable/equatable.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/data/login/login_user_response.dart";
import "package:imzo/features/auth/data/login/otp_auth_response.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/router/app_routes.dart";
part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  OtpBloc({required this.repository}) : super(const OtpState(status: ApiStatus.initial)) {
    on<OtpAuthEvent>(_otpLogin);
    on<SendLoginEvent>(_sendLogin);
  }

  final Repository repository;

 Future<void> _otpLogin(OtpAuthEvent event, Emitter<OtpState> emit) async {
   emit(const OtpState(status: ApiStatus.loading));
    final result = await repository.otpAuth(code: event.code);
    await result.fold(
      (Failure left) {emit(OtpState(status: ApiStatus.error, message: left.message)); },
      (OtpAuthResponse right) async {
        await localSource.setRefreshToken(right.refreshToken ?? "");
        await localSource.setAccessToken(right.accessToken ?? "");
        emit(OtpState(status: ApiStatus.success, result: right));
      },
    );
  }

  Future<void> _sendLogin(SendLoginEvent event, Emitter<OtpState> emit) async {
    emit(const OtpState(status: ApiStatus.loading));
    final result = await repository.login(phone: event.phoneNumber);
    await result.fold(
          (Failure left) {emit(OtpState(status: ApiStatus.error, message: left.message)); },
          (LoginResponse right) async {
        emit(OtpState(status: ApiStatus.success, loginResponse: right));
      },
    );
  }

}
