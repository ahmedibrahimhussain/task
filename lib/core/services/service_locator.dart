import 'package:get_it/get_it.dart';

import '../../features/details_feature/data/repo/details_repo.dart';
import '../../features/details_feature/presentation/controller/details_controller/details_cubit.dart';
import '../../features/home_feature/data/repo/details_repo.dart';
import '../../features/home_feature/presentation/controller/home_cubit.dart';
import '../api/api_service.dart';

final GetIt sl = GetIt.instance;

class ServiceLocator {
  void setup() {
    /// API service
    sl.registerLazySingleton<ApiService>(() => ApiService());

    /// repos
    sl.registerLazySingleton<HomeRepo>(() => HomeRepo(sl()));
    sl.registerLazySingleton<DetailsRepo>(() => DetailsRepo(sl()));

    ////Cubits
    sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));
    sl.registerFactory<DetailsCubit>(() => DetailsCubit(sl()));
  }
}
