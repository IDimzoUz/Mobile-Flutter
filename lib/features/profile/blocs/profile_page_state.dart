part of 'profile_page_bloc.dart';


class ProfilePageState extends Equatable {
  const ProfilePageState({this.status = ApiStatus.initial});

  final ApiStatus status;


  ProfilePageState copyWith({
    ApiStatus? status,
  }) => ProfilePageState(
    status: status ?? this.status,
  );

  @override
  List<Object?> get props => [ status ];
}
