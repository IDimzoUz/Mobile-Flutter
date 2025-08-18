part of "create_formalization_bloc.dart";

sealed class CreateFormalizationEvent extends Equatable {
  const CreateFormalizationEvent();
}

final class GetContractsTemplatesEvent extends CreateFormalizationEvent {
  const GetContractsTemplatesEvent({required this.langId});
  final int langId;
  @override
  List<Object?> get props => [ langId ];
}

final class CreateContractsEvent extends CreateFormalizationEvent {
  const CreateContractsEvent({required this.contractIDModel, required this.fieldValues});
  final ContractIDModel contractIDModel;
  final Map<String, String> fieldValues;
  @override
  List<Object?> get props => [ contractIDModel, fieldValues ];
}