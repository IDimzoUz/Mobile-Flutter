part of "docs_page_bloc.dart";

sealed class DocsPageEvent extends Equatable {
  const DocsPageEvent();
}

final class GetCategoryDocsEvent extends DocsPageEvent {
  const GetCategoryDocsEvent();
  @override
  List<Object?> get props => [ ];
}