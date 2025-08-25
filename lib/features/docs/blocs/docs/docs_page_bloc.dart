import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/either/either.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/core/extension/extension.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/auth/presentation/bloc/otp/otp_bloc.dart";
import "package:imzo/features/home/model/category_response.dart";

part "docs_page_event.dart";

part "docs_page_state.dart";

class DocsPageBloc extends Bloc<DocsPageEvent, DocsPageState> {
  DocsPageBloc({required this.repository}) : super(const DocsPageState(status: ApiStatus.initial)) {
    on<GetCategoryDocsEvent>(_getCategory);
  }

  final Repository repository;

  Future<void> _getCategory(GetCategoryDocsEvent event, Emitter<DocsPageState> emit) async {
    final result = await repository.getCategories();
    await result.fold(
          (Failure left) {emit(const DocsPageState(status: ApiStatus.error)); },
          (List<CategoryResponse> right) async {
        emit(DocsPageState(status: ApiStatus.success, categoryResponse: right));
      },
    );
  }


}
