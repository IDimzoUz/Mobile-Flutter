import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/either/either.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/core/extension/extension.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/auth/presentation/bloc/otp/otp_bloc.dart";
import "package:imzo/features/home/model/category_response.dart";

part "profile_page_event.dart";

part "profile_page_state.dart";

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfilePageState> {
  ProfilePageBloc({required this.repository}) : super(const ProfilePageState(status: ApiStatus.initial)) {
    // on<GetActivateQrEvent>(_getActivateQr);
  }

  final Repository repository;

  // Future<void> _getActivateQr(GetActivateQrEvent event, Emitter<HomePageState> emit) async {
  //   final result = await repository.getActivateQr(id: event.id);
  //   await result.fold(
  //         (Failure left) {emit(const HomePageState(status: ApiStatus.error)); },
  //         (ActivateQrResponse right) async {
  //
  //       emit(HomePageState(status: ApiStatus.success, response: right));
  //     },
  //   );
  // }


}
