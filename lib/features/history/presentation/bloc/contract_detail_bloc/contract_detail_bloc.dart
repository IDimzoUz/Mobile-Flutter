import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/either/either.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/docs/model/create_contracts_response.dart";
import "package:imzo/features/history/presentation/bloc/contract_detail_bloc/contract_detail_event.dart";
import "package:imzo/features/history/presentation/bloc/contract_detail_bloc/contract_detail_state.dart";

class ContractDetailBloc extends Bloc<ContractDetailEvent, ContractDetailState> {
  ContractDetailBloc({required this.repository}) : super(const ContractDetailState(status: ApiStatus.initial)) {
    on<GetContractDetailEvent>(_getContractDetail);
  }

  final Repository repository;

  Future<void> _getContractDetail(GetContractDetailEvent event, Emitter<ContractDetailState> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));
      final Either<Failure, CreateContractsResponse> result = await repository.getContractDetail(id: event.id);
      result.fold(
         (Failure failure) => emit(state.copyWith(message: failure.message, status: ApiStatus.error)),
         (CreateContractsResponse right) => emit(state.copyWith(response: right, status: ApiStatus.success))
      );
  }
}
