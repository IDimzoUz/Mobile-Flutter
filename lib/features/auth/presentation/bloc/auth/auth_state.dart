part of 'auth_bloc.dart';

enum ApiStatus { initial, loading, success, error }

class AuthState extends Equatable {
  const AuthState({required this.status,this.result, this.message});

  final ApiStatus status;
  final LoginResponse? result;
  final String? message;

  AuthState copyWith({
    ApiStatus? status,
    LoginResponse? result,
    String? message
  }) => AuthState(
    result: result ?? this.result,
    status: status ?? this.status,
    message: message ?? this.message
  );
  @override
  List<Object?> get props => [ status, result, message ];

}


