import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/either/either.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/core/extension/extension.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/auth/presentation/bloc/otp/otp_bloc.dart";
import "package:imzo/features/home/model/category_response.dart";
import "package:imzo/features/profile/model/user_me_response.dart";
import "package:imzo/router/app_routes.dart";

part "profile_page_event.dart";

part "profile_page_state.dart";

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc({required this.repository}) : super(const ProfilePageState(status: ApiStatus.initial)) {
    on<GetMeEvent>(_getMeEvent);
  }

  final Repository repository;

  Future<void> _getMeEvent(GetMeEvent event, Emitter<ProfilePageState> emit) async {
    emit(const ProfilePageState(status: ApiStatus.loading));
    final result = await repository.getUserMe();
    await result.fold(
          (Failure left) { emit(const ProfilePageState(status: ApiStatus.error)); },
          (UserMeResponse right) async {
            localSource.setVerification(value: right.firstName != null);
            emit(ProfilePageState(status: ApiStatus.success, userMeResponse: right));
      },
    );
  }


}
