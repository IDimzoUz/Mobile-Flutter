part of "create_formalization_detail_bloc.dart";

sealed class CreateFormalizationDetailEvent extends Equatable {
  const CreateFormalizationDetailEvent();
}


final class GetContractDetailIdEvent extends CreateFormalizationDetailEvent {
  const GetContractDetailIdEvent({required this.id});
  final int id;
  @override
  List<Object?> get props => [ id ];
}
