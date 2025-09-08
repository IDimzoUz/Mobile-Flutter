import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/either/either.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/core/extension/extension.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/auth/presentation/bloc/otp/otp_bloc.dart";
import "package:imzo/features/docs/model/contract_tem_category_response.dart";
import "package:imzo/features/docs/model/create_contracts_response.dart";
import "package:imzo/features/home/model/category_response.dart";
import "package:imzo/features/profile/model/edit_me_response.dart";
import "package:imzo/features/profile/model/my_id_access_token_response.dart";
import "package:imzo/features/profile/model/my_id_me_response.dart";
import "package:imzo/features/profile/model/user_me_response.dart";

part "select_payment_verify_event.dart";

part "select_payment_verify_state.dart";

class SelectPaymentVerifyBloc extends Bloc<SelectPaymentVerifyEvent, SelectPaymentVerifyState> {
  SelectPaymentVerifyBloc({required this.repository}) : super(const SelectPaymentVerifyState(status: ApiStatus.initial)) {
    on<GetMyIDTokenVerifyEvent>(_getMyIDToken);
    on<EditMyIDStatusEvent>(_getEditMyIDStatus);
    on<GetMyIDMeEvent>(_getMyIDMe);
  }

  final Repository repository;

  Future<void> _getMyIDToken(GetMyIDTokenVerifyEvent event, Emitter<SelectPaymentVerifyState> emit) async {
    emit(const SelectPaymentVerifyState(status: ApiStatus.loading));
    final result = await repository.getMyIDToken(code: event.code);
    await result.fold(
       (Failure left) { emit(const SelectPaymentVerifyState(status: ApiStatus.error)); },
       (MyIDAccessTokenResponse right) async {
         emit(SelectPaymentVerifyState(status: ApiStatus.success, myIDAccessToken: right));
      },
    );
  }

  Future<void> _getMyIDMe(GetMyIDMeEvent event, Emitter<SelectPaymentVerifyState> emit) async {
    emit(const SelectPaymentVerifyState(status: ApiStatus.loading));
    final result = await repository.getMyIDMe(token: event.token);
    await result.fold(
       (Failure left) { emit(const SelectPaymentVerifyState(status: ApiStatus.error)); },
       (MyIDMeResponse right) async {
        emit(SelectPaymentVerifyState(status: ApiStatus.success, myIDMeResponse: right));
      },
    );
  }

  Future<void> _getEditMyIDStatus(EditMyIDStatusEvent event, Emitter<SelectPaymentVerifyState> emit) async {
    emit(const SelectPaymentVerifyState(status: ApiStatus.loading));
    final result = await repository.sendMyIDApprove(contractID: event.contractID, creator: event.creator);
    await result.fold(
       (Failure left) { emit(const SelectPaymentVerifyState(status: ApiStatus.error)); },
       (CreateContractsResponse right) async {
        emit(SelectPaymentVerifyState(status: ApiStatus.success, contractsResponse: right));
      },
    );
  }

}
