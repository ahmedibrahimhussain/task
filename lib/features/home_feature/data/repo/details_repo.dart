import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/api/dio_exception_handler.dart';
import '../../../../core/api/failure.dart';
import '../model/products_model.dart';

class HomeRepo {
  final ApiService _apiService;
  HomeRepo(this._apiService);

  Future<Either<Failure, ProductsListModel>> getProducts() async {
    try {
      Response response = await _apiService.dio.get(ApiConstants.getProducts);

      ProductsListModel model = ProductsListModel.fromJson(response.data);

      return Right(model);
    } on DioException catch (ex) {
      return Left(Failure(dioExceptionHandler(ex)));
    } catch (ex) {
      return Left(Failure(ex.toString()));
    }
  }
}
