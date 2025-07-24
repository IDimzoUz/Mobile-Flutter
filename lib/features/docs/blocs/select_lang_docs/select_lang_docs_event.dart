part of "select_lang_docs_bloc.dart";

sealed class SelectLangDocsEvent extends Equatable {
  const SelectLangDocsEvent();
}

final class GetLanguageCategoryDocsEvent extends SelectLangDocsEvent {
  const GetLanguageCategoryDocsEvent({required this.id});
  final int id;
  @override
  List<Object?> get props => [ id ];
}