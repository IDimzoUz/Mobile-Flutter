part of "formalization_bloc.dart";

sealed class FormalizationEvent extends Equatable {
  const FormalizationEvent();
}

final class GetUsersSearchEvent extends FormalizationEvent {
  const GetUsersSearchEvent({required this.search});
  final String search;
  @override
  List<Object?> get props => [ search ];
}