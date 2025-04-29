import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/failure.dart';
import '../../../../core/database_helper/product_local_data_source.dart';
import '../../data/model/products_model.dart';
import '../../data/repo/details_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  final ProductLocalDataSource _localDataSource = ProductLocalDataSource();

  late ScrollController scrollController;

  HomeCubit(this._homeRepo) : super(HomeInitialState()) {
    scrollController = ScrollController();
    scrollController.addListener(() {});
  }

  Future<void> getProducts() async {
    emit(HomeLoadingState());
    final Either<Failure, ProductsListModel> data =
        await _homeRepo.getProducts();

    data.fold(
      (l) async {
        final cached = await _localDataSource.getCachedProducts(limit: 10);
        if (cached.isNotEmpty) {
          emit(HomeSuccessState(ProductsListModel(products: cached)));
        } else {
          emit(HomeFailureState(l.errorMessage));
        }
      },
      (r) async {
        await _localDataSource.cacheProducts(r.products);
        emit(HomeSuccessState(r));
      },
    );
  }
}
