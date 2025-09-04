import 'package:equatable/equatable.dart';
import 'package:imzo/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:imzo/features/docs/model/create_contracts_response.dart';

final class ContractDetailState extends Equatable {
  const ContractDetailState({required this.status, this.message, this.response});

  final String? message;
  final ApiStatus status;
  final CreateContractsResponse? response;

  ContractDetailState copyWith({
    String? message,
    ApiStatus? status,
    CreateContractsResponse? response
  }) => ContractDetailState(
    status: status ?? this.status,
    message: message ?? this.message,
    response: response ?? this.response,
  );

  @override
  List<Object?> get props => [ status, message, response ];
}


