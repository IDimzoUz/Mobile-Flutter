part of 'create_formalization_detail_bloc.dart';


class CreateFormalizationDetailState extends Equatable {
  const CreateFormalizationDetailState({this.status = ApiStatus.initial, this.createContractsResponse});

  final ApiStatus status;
  final CreateContractsResponse? createContractsResponse;

  CreateFormalizationDetailState copyWith({
    ApiStatus? status,
    CreateContractsResponse? createContractsResponse
  }) => CreateFormalizationDetailState(
    status: status ?? this.status,
    createContractsResponse: createContractsResponse ?? this.createContractsResponse
  );

  @override
  List<Object?> get props => [ status, createContractsResponse ];
}
