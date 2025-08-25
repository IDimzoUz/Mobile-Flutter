import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/either/either.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/core/extension/extension.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/docs/model/contract_templates_response.dart";
import "package:imzo/features/docs/model/create_contracts_response.dart";
import "package:imzo/features/docs/presentation/select_lang_docs/select_lang_docs_page.dart";

part "create_formalization_detail_event.dart";
part "create_formalization_detail_state.dart";

class CreateFormalizationDetailBloc extends Bloc<CreateFormalizationDetailEvent, CreateFormalizationDetailState> {
  CreateFormalizationDetailBloc({required this.repository}) : super(const CreateFormalizationDetailState(status: ApiStatus.initial)) {
    // on<CreateContractsEvent>(_createContracts);
  }

  final Repository repository;

  // Future<void> _getContractsTemplates(GetContractsTemplatesEvent event, Emitter<CreateFormalizationState> emit) async {
  //   emit(const CreateFormalizationState(status: ApiStatus.loading));
  //   final result = await repository.getContractsTemplates(langId: event.langId);
  //   await result.fold(
  //         (Failure left) { emit(const CreateFormalizationState(status: ApiStatus.error)); },
  //         (ContractsTemplatesResponse right) async {
  //       emit(CreateFormalizationState(status: ApiStatus.success, contractsTemplatesResponse: right));
  //     },
  //   );
  // }


}
