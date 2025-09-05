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

// Creator Verify
final class SendCreatorApprovalCodeEvent extends OtpEvent {
  const SendCreatorApprovalCodeEvent({required this.id});
  final int id;
  @override
  List<Object?> get props => <Object?>[ id ];
}

final class SendVerifyAndApproveAsCreatorEvent extends OtpEvent {
  const SendVerifyAndApproveAsCreatorEvent({required this.id, required this.code});
  final int id;
  final String code;
  @override
  List<Object?> get props => <Object?>[ id, code ];
}


// Recipient Verify
final class SendRecipientApprovalCodeEvent extends OtpEvent {
  const SendRecipientApprovalCodeEvent({required this.id});
  final int id;
  @override
  List<Object?> get props => <Object?>[ id ];
}

final class SendVerifyAndApproveAsRecipientEvent extends OtpEvent {
  const SendVerifyAndApproveAsRecipientEvent({required this.id, required this.code});
  final int id;
  final String code;
  @override
  List<Object?> get props => <Object?>[ id, code ];
}
