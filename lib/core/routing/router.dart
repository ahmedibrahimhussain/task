import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:task/features/details_feature/presentation/controller/details_controller/details_cubit.dart';

import '../../features/details_feature/presentation/pages/details_view.dart';
import '../../features/home_feature/presentation/controller/home_cubit.dart';
import '../../features/home_feature/presentation/pages/home_view.dart';
import '../services/service_locator.dart';
import 'routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  initialLocation: Routes.home,

  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: Routes.home,
      builder:
          (context, state) => BlocProvider(
            create: (context) => sl.get<HomeCubit>(),
            child: HomeView(),
          ),
    ),
    GoRoute(
      path: '${Routes.details}/:id',
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return BlocProvider(
          create:
              (context) => sl.get<DetailsCubit>()..getDetails(int.parse(id!)),
          child: DetailsView(id: int.parse(id!)),
        );
      },
    ),
  ],
);
