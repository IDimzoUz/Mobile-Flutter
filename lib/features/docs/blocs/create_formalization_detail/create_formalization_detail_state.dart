part of 'create_formalization_detail_bloc.dart';


class CreateFormalizationDetailState extends Equatable {
  const CreateFormalizationDetailState({this.status = ApiStatus.initial});

  final ApiStatus status;

  CreateFormalizationDetailState copyWith({
    ApiStatus? status,
  }) => CreateFormalizationDetailState(
    status: status ?? this.status,
  );

  @override
  List<Object?> get props => [ status ];
}
