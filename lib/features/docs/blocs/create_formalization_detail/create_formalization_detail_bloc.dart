import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/either/either.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/docs/model/create_contracts_response.dart";

part "create_formalization_detail_event.dart";
part "create_formalization_detail_state.dart";

class CreateFormalizationDetailBloc extends Bloc<CreateFormalizationDetailEvent, CreateFormalizationDetailState> {
  CreateFormalizationDetailBloc({required this.repository}) : super(const CreateFormalizationDetailState(status: ApiStatus.initial)) {
    on<GetContractDetailIdEvent>(_getContractDetail);
  }

  final Repository repository;

  Future<void> _getContractDetail(GetContractDetailIdEvent event, Emitter<CreateFormalizationDetailState> emit) async {
    emit(state.copyWith(status: ApiStatus.loading));
    final Either<Failure, CreateContractsResponse> result = await repository.getContractDetail(id: event.id);
    result.fold(
       (Failure failure) => emit(state.copyWith(status: ApiStatus.error)),
       (CreateContractsResponse right) => emit(state.copyWith(createContractsResponse: right, status: ApiStatus.success))
    );
  }
}
