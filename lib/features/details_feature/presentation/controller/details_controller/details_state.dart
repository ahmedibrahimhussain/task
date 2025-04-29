import 'package:task/features/home_feature/data/model/products_model.dart';

abstract class DetailsState {}

class DetailsInitialState extends DetailsState {}

class DetailsLoadingState extends DetailsState {}

class DetailsSuccessState extends DetailsState {
  final ProductModel model;

  DetailsSuccessState(this.model);
}

class DetailsEmptyState extends DetailsState {}

class DetailsFailureState extends DetailsState {
  final String errorMessage;

  DetailsFailureState(this.errorMessage);
}
