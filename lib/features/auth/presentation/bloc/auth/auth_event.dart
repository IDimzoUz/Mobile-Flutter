part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();
}

final class AuthLoginEvent extends AuthEvent {
  const AuthLoginEvent({required this.phoneNumber});
  final String phoneNumber;
  @override
  List<Object?> get props => <Object?>[ phoneNumber ];
}
