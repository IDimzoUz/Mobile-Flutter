part of 'home_page_bloc.dart';


class HomePageState extends Equatable {
  const HomePageState({this.status = ApiStatus.initial, this.categoryResponse});

  final ApiStatus status;
  final List<CategoryResponse>? categoryResponse;


  HomePageState copyWith({
    ApiStatus? status,
    List<CategoryResponse>? categoryResponse,
  }) => HomePageState(
    status: status ?? this.status,
    categoryResponse: categoryResponse ?? this.categoryResponse,
  );

  @override
  List<Object?> get props => [ status, categoryResponse ];
}
