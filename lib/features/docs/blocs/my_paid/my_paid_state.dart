part of 'my_paid_bloc.dart';


class MyPaidState extends Equatable {
  const MyPaidState({this.status = ApiStatus.initial, this.responsePaymentStatus});

  final ApiStatus status;
  final PaymentResponse? responsePaymentStatus;

  MyPaidState copyWith({
    ApiStatus? status,
    PaymentResponse? responsePaymentStatus,
  }) => MyPaidState(
    status: status ?? this.status,
    responsePaymentStatus: responsePaymentStatus ?? this.responsePaymentStatus
  );

  @override
  List<Object?> get props => [ status, responsePaymentStatus ];
}
