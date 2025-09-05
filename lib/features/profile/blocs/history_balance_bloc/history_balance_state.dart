part of 'history_balance_bloc.dart';


class HistoryBalanceState extends Equatable {
  const HistoryBalanceState({this.status = ApiStatus.initial, this.response});

  final ApiStatus status;
  final List<HistoryBalanceResponse>? response;

  HistoryBalanceState copyWith({
    ApiStatus? status,
    List<HistoryBalanceResponse>? response
  }) => HistoryBalanceState(
    status: status ?? this.status,
    response: response ?? this.response,
  );

  @override
  List<Object?> get props => [ status, response ];
}
