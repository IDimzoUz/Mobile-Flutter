part of 'formalization_bloc.dart';


class FormalizationState extends Equatable {
  FormalizationState({this.status = ApiStatus.initial, this.usersSearchResponse});

  final ApiStatus status;
  late final UsersSearchResponse? usersSearchResponse;

  FormalizationState copyWith({
    ApiStatus? status,
    UsersSearchResponse? usersSearchResponse,
  }) => FormalizationState(
    status: status ?? this.status,
    usersSearchResponse: usersSearchResponse ?? this.usersSearchResponse,
  );

  @override
  List<Object?> get props => [ status, usersSearchResponse ];
}
