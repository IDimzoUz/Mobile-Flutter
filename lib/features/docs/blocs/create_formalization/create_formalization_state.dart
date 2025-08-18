part of 'create_formalization_bloc.dart';


class CreateFormalizationState extends Equatable {
  const CreateFormalizationState({this.status = ApiStatus.initial, this.contractsTemplatesResponse, this.createContractsResponse});

  final ApiStatus status;
  final ContractsTemplatesResponse? contractsTemplatesResponse;
  final CreateContractsResponse? createContractsResponse;

  CreateFormalizationState copyWith({
    ApiStatus? status,
    ContractsTemplatesResponse? contractsTemplatesResponse,
    CreateContractsResponse? createContractsResponse
  }) => CreateFormalizationState(
    status: status ?? this.status,
    contractsTemplatesResponse: contractsTemplatesResponse ?? this.contractsTemplatesResponse,
    createContractsResponse: createContractsResponse ?? this.createContractsResponse
  );

  @override
  List<Object?> get props => [ status, contractsTemplatesResponse, createContractsResponse ];
}
