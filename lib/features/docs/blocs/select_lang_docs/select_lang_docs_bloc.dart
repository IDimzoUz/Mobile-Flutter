import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/either/either.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/core/extension/extension.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/auth/presentation/bloc/otp/otp_bloc.dart";
import "package:imzo/features/docs/model/contract_tem_category_response.dart";
import "package:imzo/features/home/model/category_response.dart";

part "select_lang_docs_event.dart";

part "select_lang_docs_state.dart";

class SelectLangDocsBloc extends Bloc<SelectLangDocsEvent, SelectLangDocsState> {
  SelectLangDocsBloc({required this.repository}) : super(const SelectLangDocsState(status: ApiStatus.initial)) {
    on<GetLanguageCategoryDocsEvent>(_getSelectLangCategory);
  }

  final Repository repository;

  Future<void> _getSelectLangCategory(GetLanguageCategoryDocsEvent event, Emitter<SelectLangDocsState> emit) async {
    emit(const SelectLangDocsState(status: ApiStatus.loading));
    final result = await repository.getContractTemplatesCategory(id: event.id);
    await result.fold(
          (Failure left) { emit(const SelectLangDocsState(status: ApiStatus.error)); },
          (List<ContractTemplatesCategoryResponse> right) async {
        emit(SelectLangDocsState(status: ApiStatus.success, langCategoryResponse: right));
      },
    );
  }


}
