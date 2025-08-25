import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/history/presentation/bloc/history_event.dart";
import "package:imzo/features/history/presentation/bloc/history_state.dart";
import "package:imzo/features/history/presentation/model/for_me_history_response.dart";
import "../../../../core/either/either.dart";
import "../../../../core/error/failure.dart";

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  HistoryBloc({required this.repository}) : super(const HistoryState(status: ApiStatus.initial)) {
    on<GetForMeHistoryEvent>(_getForMeHistory);
  }

  final Repository repository;

  Future<void> _getForMeHistory(GetForMeHistoryEvent event, Emitter<HistoryState> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));
    if (event.forMe) {
      final Either<Failure, List<ForMeHistoryResponse>> result = await repository.getMyCreatedHistory();
      result.fold(
         (Failure failure) => emit(state.copyWith(message: failure.message, status: ApiStatus.error)),
         (List<ForMeHistoryResponse> right) => emit(state.copyWith(forMeHistoryResponse: right, status: ApiStatus.success))
      );
    } else {
      final Either<Failure, List<ForMeHistoryResponse>> result = await repository.getForMeHistory();
      result.fold(
         (Failure failure) => emit(state.copyWith(message: failure.message, status: ApiStatus.error)),
         (List<ForMeHistoryResponse> right) => emit(state.copyWith(forMeHistoryResponse: right, status: ApiStatus.success))
      );
    }
  }
}
