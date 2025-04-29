import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/api/failure.dart';
import '../../../../../core/database_helper/details_local_data_source.dart';
import '../../../../home_feature/data/model/products_model.dart';
import '../../../data/repo/details_repo.dart';
import 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  final DetailsRepo _detailsRepo;
  final DetailsLocalDataSource _localDataSource = DetailsLocalDataSource();

  DetailsCubit(this._detailsRepo) : super(DetailsInitialState());

  Future<void> getDetails(int id) async {
    emit(DetailsLoadingState());

    final Either<Failure, ProductModel> data = await _detailsRepo
        .getProductDetails(id: id);

    data.fold(
      (l) async {
        final cached = await _localDataSource.getCachedProduct(id);
        if (cached != null) {
          emit(DetailsSuccessState(cached));
        } else {
          emit(DetailsFailureState("لا توجد بيانات محلية"));
        }
      },
      (r) async {
        await _localDataSource.cacheProduct(r);
        emit(DetailsSuccessState(r));
      },
    );
  }
}
