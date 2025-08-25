import "package:equatable/equatable.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:imzo/core/either/either.dart";
import "package:imzo/core/error/failure.dart";
import "package:imzo/core/extension/extension.dart";
import "package:imzo/features/api/repository.dart";
import "package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart";
import "package:imzo/features/docs/model/contract_templates_response.dart";
import "package:imzo/features/docs/model/create_contracts_response.dart";
import "package:imzo/features/docs/model/payment_response.dart";
import "package:imzo/features/docs/presentation/select_lang_docs/select_lang_docs_page.dart";

part "my_paid_event.dart";
part "my_paid_state.dart";

class MyPaidBloc extends Bloc<MyPaidEvent, MyPaidState> {
  MyPaidBloc({required this.repository}) : super(const MyPaidState(status: ApiStatus.initial)) {
    on<GetPaymentStatusEvent>(_getPaymentStatus);
  }

  final Repository repository;

  Future<void> _getPaymentStatus(GetPaymentStatusEvent event, Emitter<MyPaidState> emit) async {
    emit(const MyPaidState(status: ApiStatus.loading));
    final result = await repository.getPaymentStatus(id: event.id);
    await result.fold(
          (Failure left) { emit(const MyPaidState(status: ApiStatus.error)); },
          (PaymentResponse right) async {
        emit(MyPaidState(status: ApiStatus.success, responsePaymentStatus: right));
      },
    );
  }


}
