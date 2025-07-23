part of 'otp_bloc.dart';

sealed class OtpEvent extends Equatable {
  const OtpEvent();
}

final class OtpAuthEvent extends OtpEvent {
  const OtpAuthEvent({required this.code});
  final String code;
  @override
  List<Object?> get props => <Object?>[ code ];
}

final class SendLoginEvent extends OtpEvent {
  const SendLoginEvent({required this.phoneNumber});
  final String phoneNumber;
  @override
  List<Object?> get props => <Object?>[ phoneNumber ];
}
