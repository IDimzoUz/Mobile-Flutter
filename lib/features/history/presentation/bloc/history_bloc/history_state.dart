import 'package:equatable/equatable.dart';
import 'package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:imzo/features/history/presentation/model/for_me_history_response.dart';

final class HistoryState extends Equatable {
  const HistoryState({required this.status, this.message, this.forMeHistoryResponse});

  final String? message;
  final ApiStatus status;
  final List<ForMeHistoryResponse>? forMeHistoryResponse;

  HistoryState copyWith({
    String? message,
    ApiStatus? status,
    List<ForMeHistoryResponse>? forMeHistoryResponse
  }) => HistoryState(
    status: status ?? this.status,
    message: message ?? this.message,
    forMeHistoryResponse: forMeHistoryResponse ?? this.forMeHistoryResponse,
  );

  @override
  List<Object?> get props => [ status, message, forMeHistoryResponse ];
}


