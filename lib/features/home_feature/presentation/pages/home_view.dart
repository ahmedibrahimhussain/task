import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:task/core/recourses/styles_manger/styles_manager.dart';
import 'package:task/core/widgets/loading_state.dart';
import '../../../../core/services/service_locator.dart';
import '../../../../core/widgets/snack_bar_widget.dart';
import '../../data/model/products_model.dart';
import '../controller/home_cubit.dart';
import '../widgets/product_card_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).getProducts();
  }

  Future<void> _onRefresh() async {
    await BlocProvider.of<HomeCubit>(context).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
        current is HomeLoadingState ||
            current is HomeSuccessState ||
            current is HomeFailureState,
        listener: (context, state) {
          if (state is HomeFailureState) {
            showSnackBar(
              text: state.errorMessage,
              snackBarState: SnackBarState.error,
              context: context,
            );
          }
        },
        builder: (context, state) {
          HomeCubit cubit = sl.get<HomeCubit>();
          if (state is HomeLoadingState) {
            return const LoadingState();
          } else if (state is HomeSuccessState) {
            final List<ProductModel> products = state.model.products;
            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: MasonryGridView.builder(
                controller: cubit.scrollController,
                crossAxisSpacing: 9.5.w,
                mainAxisSpacing: 10.h,
                gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            );
          }
          return Center(
            child: Text(
              'لا يوجد منتجات',
              style: getSemiBoldStyle(fontSize: 35),
            ),
          );
        },
      ),
    );
  }
}
