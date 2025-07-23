import 'package:equatable/equatable.dart';

sealed class HistoryEvent extends Equatable {
  const HistoryEvent();
}

final class GetHistoryEvent extends HistoryEvent {
  @override
  List<Object?> get props => [];
}
