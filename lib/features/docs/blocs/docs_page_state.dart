part of 'docs_page_bloc.dart';


class DocsPageState extends Equatable {
  const DocsPageState({this.status = ApiStatus.initial, this.categoryResponse});

  final ApiStatus status;
  final List<CategoryResponse>? categoryResponse;

  DocsPageState copyWith({
    ApiStatus? status,
    List<CategoryResponse>? categoryResponse,
  }) => DocsPageState(
    status: status ?? this.status,
    categoryResponse: categoryResponse ?? this.categoryResponse,
  );

  @override
  List<Object?> get props => [ status, categoryResponse ];
}
