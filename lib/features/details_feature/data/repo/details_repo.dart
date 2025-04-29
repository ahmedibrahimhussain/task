import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task/features/home_feature/data/model/products_model.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/api/dio_exception_handler.dart';
import '../../../../core/api/failure.dart';

class DetailsRepo {
  final ApiService _apiService;
  DetailsRepo(this._apiService);

  Future<Either<Failure, ProductModel>> getProductDetails({
    required int id,
  }) async {
    try {
      Response response = await _apiService.dio.get(
        ApiConstants.getProductDetails(id),
      );

      ProductModel model = ProductModel.fromJson(response.data);

      return Right(model);
    } on DioException catch (ex) {
      return Left(Failure(dioExceptionHandler(ex)));
    } catch (ex) {
      return Left(Failure(ex.toString()));
    }
  }
}
