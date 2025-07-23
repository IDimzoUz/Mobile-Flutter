import 'package:equatable/equatable.dart';
import 'package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:imzo/features/history/presentation/model/scanned_history_response.dart';

final class HistoryState extends Equatable {
  const HistoryState({required this.status, this.message, this.historyResponse});

  final String? message;
  final ApiStatus status;
  final ScannedHistoryResponse? historyResponse;

  HistoryState copyWith({
    String? message,
    ApiStatus? status,
    ScannedHistoryResponse? historyResponse
  }) => HistoryState(
    status: status ?? this.status,
    message: message ?? this.message,
    historyResponse: historyResponse ?? this.historyResponse,
  );

  @override
  List<Object?> get props => [ status, message, historyResponse ];
}


