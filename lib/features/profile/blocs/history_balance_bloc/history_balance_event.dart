part of "history_balance_bloc.dart";

sealed class HistoryBalanceEvent extends Equatable {
  const HistoryBalanceEvent();
}

final class GetHistoryBalanceEvent extends HistoryBalanceEvent {
  const GetHistoryBalanceEvent();
  @override
  List<Object?> get props => [ ];
}
