import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/home/model/category_response.dart";
import "package:imzo/features/home/model/news_response.dart";
import "package:imzo/features/profile/model/user_me_response.dart";

part "home_page_event.dart";
part "home_page_state.dart";

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc({required this.repository}) : super(const HomePageState(status: ApiStatus.initial)) {
    on<GetCategoryEvent>(_getCategory);
    on<GetHomeMeEvent>(_getHomeMeEvent);
    on<GetNotificationUnreadCountEvent>(_getNotificationUnreadCount);
    on<GetNewsEvent>(_getNews);
    on<SendNewsViewEvent>(_sendNewsView);
    on<PostFCMTokenEvent>(_postFCMToken);
  }

  final Repository repository;

  Future<void> _getCategory(GetCategoryEvent event, Emitter<HomePageState> emit) async {
    final result = await repository.getCategories();
    await result.fold(
       (Failure left) { emit(const HomePageState(status: ApiStatus.error)); },
       (List<CategoryResponse> right) async {
        emit(HomePageState(status: ApiStatus.success, categoryResponse: right));
      },
    );
  }

  Future<void> _getHomeMeEvent(GetHomeMeEvent event, Emitter<HomePageState> emit) async {
    emit(const HomePageState(status: ApiStatus.loading));
    final result = await repository.getUserMe();
    await result.fold(
          (Failure left) { emit(const HomePageState(status: ApiStatus.error)); },
          (UserMeResponse right) async {
        emit(HomePageState(status: ApiStatus.success, userMeResponse: right));
      },
    );
  }

  Future<void> _getNotificationUnreadCount(GetNotificationUnreadCountEvent event, Emitter<HomePageState> emit) async {
    final result = await repository.getUnreadCount();
    await result.fold(
          (Failure left) { emit(const HomePageState(status: ApiStatus.error)); },
          (int right) async {
        emit(HomePageState(status: ApiStatus.success, unreadCount: right));
      },
    );
  }

  Future<void> _getNews(GetNewsEvent event, Emitter<HomePageState> emit) async {
    final result = await repository.getNews();
    await result.fold(
          (Failure left) { emit(const HomePageState(status: ApiStatus.error)); },
          (List<NewsResponse> right) async {
        emit(HomePageState(status: ApiStatus.success, newsResponse: right));
      },
    );
  }

  Future<void> _sendNewsView(SendNewsViewEvent event, Emitter<HomePageState> emit) async {
    final result = await repository.sendNewsView(id: event.id);
    await result.fold( (Failure left) { }, (bool right) async { } );
  }

  Future<void> _postFCMToken(PostFCMTokenEvent event, Emitter<HomePageState> emit) async {
    final result = await repository.sendFCMToken();
    await result.fold( (Failure left) { }, (bool right) async { } );
  }

}
