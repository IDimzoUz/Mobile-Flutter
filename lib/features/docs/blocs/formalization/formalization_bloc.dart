import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/either/either.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/core/extension/extension.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/auth/presentation/bloc/otp/otp_bloc.dart";
import "package:imzo/features/docs/model/users_search_response.dart";
import "package:imzo/features/home/model/category_response.dart";

part "formalization_event.dart";

part "formalization_state.dart";

class FormalizationBloc extends Bloc<FormalizationEvent, FormalizationState> {
  FormalizationBloc({required this.repository}) : super(FormalizationState(status: ApiStatus.initial)) {
    on<GetUsersSearchEvent>(_getUsersSearch);
  }

  final Repository repository;

  Future<void> _getUsersSearch(GetUsersSearchEvent event, Emitter<FormalizationState> emit) async {
    final result = await repository.getUsersSearch(search: event.search);
    await result.fold(
          (Failure left) {emit(FormalizationState(status: ApiStatus.error)); },
          (UsersSearchResponse right) async {
        emit(FormalizationState(status: ApiStatus.success, usersSearchResponse: right));
      },
    );
  }


}
