import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/recourses/styles_manger/styles_manager.dart';
import '../../../../core/widgets/failure_state.dart';
import '../../../../core/widgets/loading_state.dart';
import '../controller/details_controller/details_cubit.dart';
import '../controller/details_controller/details_state.dart';
import '../widgets/details_image_part.dart';
import '../widgets/details_summary_part.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DetailsCubit>(context).getDetails(id);

    return Scaffold(
      body: BlocBuilder<DetailsCubit, DetailsState>(
        builder: (context, state) {
          if (state is DetailsSuccessState) {
            return SingleChildScrollView(physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  DetailsImagePart(
                    model: state.model,
                  ),
                  DetailsSummaryPart(
                    model: state.model,
                  ),
                ],
              ),
            );
          } else if (state is DetailsFailureState) {
            return Center(
              child: Text(
                "لا يوجد بيانات محمله هنا ",
                style: getSemiBoldStyle(fontSize: 20),
              ),
            );            } else {
            return const LoadingState();
          }
        },
      ),
    );
  }
}
