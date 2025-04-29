part of 'home_cubit.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final ProductsListModel model;
  HomeSuccessState(this.model);
}

class HomeColorChangedState extends HomeState {}

class HomeFailureState extends HomeState {
  final String errorMessage;

  HomeFailureState(this.errorMessage);
}
