part of 'create_formalization_bloc.dart';


class CreateFormalizationState extends Equatable {
  const CreateFormalizationState({this.status = ApiStatus.initial, this.contractsTemplatesResponse});

  final ApiStatus status;
  final ContractsTemplatesResponse? contractsTemplatesResponse;

  CreateFormalizationState copyWith({
    ApiStatus? status,
    ContractsTemplatesResponse? contractsTemplatesResponse,
  }) => CreateFormalizationState(
    status: status ?? this.status,
    contractsTemplatesResponse: contractsTemplatesResponse ?? this.contractsTemplatesResponse
  );

  @override
  List<Object?> get props => [ status, contractsTemplatesResponse ];
}
