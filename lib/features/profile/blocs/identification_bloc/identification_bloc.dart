import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/profile/model/edit_me_response.dart";
import "package:imzo/features/profile/model/my_id_access_token_response.dart";
import "package:imzo/features/profile/model/my_id_me_response.dart";
import "package:imzo/features/profile/model/user_me_response.dart";

part "identification_event.dart";
part "identification_state.dart";

class IdentificationBloc extends Bloc<IdentificationEvent, IdentificationState> {
  IdentificationBloc({required this.repository}) : super(const IdentificationState(status: ApiStatus.initial)) {
    on<GetMyIDTokenEvent>(_getMyIDToken);
    on<GetMyIDMeEvent>(_getMyIDMe);
    on<EditProfileEvent>(_getUserMe);

  }

  final Repository repository;

  Future<void> _getMyIDToken(GetMyIDTokenEvent event, Emitter<IdentificationState> emit) async {
    emit(const IdentificationState(status: ApiStatus.loading));
    final result = await repository.getMyIDToken(code: event.code);
    await result.fold(
          (Failure left) { emit(const IdentificationState(status: ApiStatus.error)); },
          (MyIDAccessTokenResponse right) async {
        emit(IdentificationState(status: ApiStatus.success, myIDAccessToken: right));
      },
    );
  }


  Future<void> _getMyIDMe(GetMyIDMeEvent event, Emitter<IdentificationState> emit) async {
    emit(const IdentificationState(status: ApiStatus.loading));
    final result = await repository.getMyIDMe(token: event.token);
    await result.fold(
          (Failure left) { emit(const IdentificationState(status: ApiStatus.error)); },
          (MyIDMeResponse right) async {
        emit(IdentificationState(status: ApiStatus.success, myIDMeResponse: right));
      },
    );
  }


  Future<void> _getUserMe(EditProfileEvent event, Emitter<IdentificationState> emit) async {
    emit(const IdentificationState(status: ApiStatus.loading));
    final result = await repository.getUserMe(edit: event.editData);
    await result.fold(
          (Failure left) { emit(const IdentificationState(status: ApiStatus.error)); },
          (UserMeResponse right) async {
        emit(IdentificationState(status: ApiStatus.success, userMeResponse: right));
      },
    );
  }


}
