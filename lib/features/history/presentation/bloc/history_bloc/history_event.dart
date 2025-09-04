import 'package:equatable/equatable.dart';

sealed class HistoryEvent extends Equatable {
  const HistoryEvent();
}

final class GetForMeHistoryEvent extends HistoryEvent {
  const GetForMeHistoryEvent({this.forMe = false});
  final bool forMe;
  @override
  List<Object?> get props => [ forMe ];
}
