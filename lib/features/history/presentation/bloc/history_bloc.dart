import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/auth/presentation/bloc/otp/otp_bloc.dart";
import "package:imzo/features/history/presentation/bloc/history_event.dart";
import "package:imzo/features/history/presentation/bloc/history_state.dart";
import "package:imzo/features/history/presentation/model/scanned_history_response.dart";
import "../../../../core/either/either.dart";
import "../../../../core/error/failure.dart";

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({required this.repository}) : super(HistoryState(status: ApiStatus.initial)) {
    // on<GetHistoryEvent>(_getHistory);
  }

  final Repository repository;

  // Future<void> _getHistory(GetHistoryEvent event, Emitter<HistoryState> emit) async {
  //   final Either<Failure, ScannedHistoryResponse> result = await repository.getScannedHistory();
  //   result.fold(
  //       (Failure failure) => emit(state.copyWith(message: failure.message)),
  //       (ScannedHistoryResponse right) => emit(state.copyWith(historyResponse: right))
  //   );
  // }

}
