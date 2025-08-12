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