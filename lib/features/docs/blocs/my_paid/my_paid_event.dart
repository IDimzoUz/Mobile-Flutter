part of "my_paid_bloc.dart";

sealed class MyPaidEvent extends Equatable {
  const MyPaidEvent();
}

final class GetPaymentStatusEvent extends MyPaidEvent {
  const GetPaymentStatusEvent({required this.id});
  final int id;
  @override
  List<Object?> get props => [ id ];
}

