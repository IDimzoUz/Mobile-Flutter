part of "home_page_bloc.dart";

sealed class HomePageEvent extends Equatable {
  const HomePageEvent();
}

final class GetCategoryEvent extends HomePageEvent{
  const GetCategoryEvent();
  @override
  List<Object?> get props => [ ];
}
