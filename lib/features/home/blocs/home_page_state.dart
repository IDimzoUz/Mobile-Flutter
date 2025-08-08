part of 'home_page_bloc.dart';


class HomePageState extends Equatable {
  const HomePageState({this.status = ApiStatus.initial, this.categoryResponse, this.userMeResponse});

  final ApiStatus status;
  final List<CategoryResponse>? categoryResponse;
  final UserMeResponse? userMeResponse;


  HomePageState copyWith({
    ApiStatus? status,
    List<CategoryResponse>? categoryResponse,
    UserMeResponse? userMeResponse,
  }) => HomePageState(
    status: status ?? this.status,
    categoryResponse: categoryResponse ?? this.categoryResponse,
    userMeResponse: userMeResponse ?? this.userMeResponse,
  );

  @override
  List<Object?> get props => [ status, categoryResponse, userMeResponse ];
}
