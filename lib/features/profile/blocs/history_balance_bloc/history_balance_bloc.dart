import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/either/either.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/core/extension/extension.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/auth/presentation/bloc/otp/otp_bloc.dart";
import "package:imzo/features/home/model/category_response.dart";
import "package:imzo/features/profile/model/history_balance_response.dart";
import "package:imzo/features/profile/model/user_me_response.dart";
import "package:imzo/router/app_routes.dart";

part "history_balance_event.dart";

part "history_balance_state.dart";

class HistoryBalanceBloc extends Bloc<HistoryBalanceEvent, HistoryBalanceState> {
  HistoryBalanceBloc({required this.repository}) : super(const HistoryBalanceState(status: ApiStatus.initial)) {
    on<GetHistoryBalanceEvent>(_getHistoryBalanceEvent);
  }

  final Repository repository;

  Future<void> _getHistoryBalanceEvent(GetHistoryBalanceEvent event, Emitter<HistoryBalanceState> emit) async {
    final result = await repository.getHistoryBalance();
    await result.fold(
          (Failure left) { emit(const HistoryBalanceState(status: ApiStatus.error)); },
          (List<HistoryBalanceResponse> right) async {
            emit(HistoryBalanceState(status: ApiStatus.success, response: right));
      },
    );
  }


}
