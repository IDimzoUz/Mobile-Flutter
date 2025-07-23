import 'package:equatable/equatable.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/error/failure.dart";
import 'package:imzo/core/mixins/cache_mixin.dart';
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/data/login/login_user_request.dart";
import "package:imzo/features/auth/data/login/login_user_response.dart";
import "package:imzo/router/app_routes.dart";

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(const AuthState(status: ApiStatus.initial)) {
    on<AuthLoginEvent>(_login);
  }

  final Repository authRepository;

 Future<void> _login(AuthLoginEvent event, Emitter<AuthState> emit) async {
   emit(const AuthState(status: ApiStatus.loading));
    final result = await authRepository.login(phone: event.phoneNumber);
    await result.fold(
      (Failure left) {emit(AuthState(status: ApiStatus.error, message: left.message)); },
      (LoginResponse right) async {
        emit(AuthState(status: ApiStatus.success, result: right));
      },
    );
  }

}
