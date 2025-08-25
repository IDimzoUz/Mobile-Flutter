part of "identification_bloc.dart";

sealed class IdentificationEvent extends Equatable {
  const IdentificationEvent();
}

final class GetMyIDTokenEvent extends IdentificationEvent {
  const GetMyIDTokenEvent({required this.code});
  final String code;
  @override
  List<Object?> get props => [ code ];
}

final class GetMyIDMeEvent extends IdentificationEvent {
  const GetMyIDMeEvent({required this.token});
  final String token;
  @override
  List<Object?> get props => [ token ];
}

final class EditProfileEvent extends IdentificationEvent {
  const EditProfileEvent({this.editData});
  final EditMeResponse? editData;

  @override
  List<Object?> get props => [ editData ];
}
