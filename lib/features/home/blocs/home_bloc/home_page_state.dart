part of 'home_page_bloc.dart';


class HomePageState extends Equatable {
  const HomePageState({this.status = ApiStatus.initial, this.categoryResponse, this.userMeResponse, this.unreadCount, this.newsResponse});

  final ApiStatus status;
  final List<CategoryResponse>? categoryResponse;
  final UserMeResponse? userMeResponse;
  final List<NewsResponse>? newsResponse;
  final int? unreadCount;


  HomePageState copyWith({
    ApiStatus? status,
    List<CategoryResponse>? categoryResponse,
    UserMeResponse? userMeResponse,
    int? unreadCount,
    List<NewsResponse>? newsResponse,
  }) => HomePageState(
    status: status ?? this.status,
    categoryResponse: categoryResponse ?? this.categoryResponse,
    userMeResponse: userMeResponse ?? this.userMeResponse,
    unreadCount: unreadCount ?? this.unreadCount,
    newsResponse: newsResponse ?? this.newsResponse,
  );

  @override
  List<Object?> get props => [ status, categoryResponse, userMeResponse, unreadCount, newsResponse ];
}
