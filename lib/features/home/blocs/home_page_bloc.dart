import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/either/either.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/core/extension/extension.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/auth/presentation/bloc/otp/otp_bloc.dart";
import "package:imzo/features/home/model/category_response.dart";

part "home_page_event.dart";

part "home_page_state.dart";

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc({required this.repository}) : super(const HomePageState(status: ApiStatus.initial)) {
    on<GetCategoryEvent>(_getCategory);
  }

  final Repository repository;

  Future<void> _getCategory(GetCategoryEvent event, Emitter<HomePageState> emit) async {
    final result = await repository.getCategories();
    await result.fold(
       (Failure left) {emit(const HomePageState(status: ApiStatus.error)); },
       (List<CategoryResponse> right) async {
        emit(HomePageState(status: ApiStatus.success, categoryResponse: right));
      },
    );
  }


}
