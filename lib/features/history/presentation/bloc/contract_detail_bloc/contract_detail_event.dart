import 'package:equatable/equatable.dart';

sealed class ContractDetailEvent extends Equatable {
  const ContractDetailEvent();
}

final class GetContractDetailEvent extends ContractDetailEvent {
  const GetContractDetailEvent({required this.id});
  final int id;
  @override
  List<Object?> get props => [ id ];
}
