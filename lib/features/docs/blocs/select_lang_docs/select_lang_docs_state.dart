part of 'select_lang_docs_bloc.dart';


class SelectLangDocsState extends Equatable {
  const SelectLangDocsState({this.status = ApiStatus.initial, this.langCategoryResponse});

  final ApiStatus status;
  final List<ContractTemplatesCategoryResponse>? langCategoryResponse;

  SelectLangDocsState copyWith({
    ApiStatus? status,
    List<ContractTemplatesCategoryResponse>? langCategoryResponse,
  }) => SelectLangDocsState(
    status: status ?? this.status,
    langCategoryResponse: langCategoryResponse ?? this.langCategoryResponse,
  );

  @override
  List<Object?> get props => [ status, langCategoryResponse ];
}
