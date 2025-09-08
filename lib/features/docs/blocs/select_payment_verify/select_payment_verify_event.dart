part of "select_payment_verify_bloc.dart";

sealed class SelectPaymentVerifyEvent extends Equatable {
  const SelectPaymentVerifyEvent();
}

final class GetMyIDTokenVerifyEvent extends SelectPaymentVerifyEvent {
  const GetMyIDTokenVerifyEvent({required this.code});
  final String code;
  @override
  List<Object?> get props => [ code ];
}

final class GetMyIDMeEvent extends SelectPaymentVerifyEvent {
  const GetMyIDMeEvent({required this.token});
  final String token;
  @override
  List<Object?> get props => [ token ];
}

final class EditMyIDStatusEvent extends SelectPaymentVerifyEvent {
  const EditMyIDStatusEvent({required this.contractID, required this.creator});
  final int contractID;
  final bool creator;

  @override
  List<Object?> get props => [ contractID, creator ];
}