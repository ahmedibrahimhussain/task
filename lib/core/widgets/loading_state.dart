import 'package:flutter/material.dart';
import '../recourses/color_manager/color_manager.dart';

class LoadingState extends StatelessWidget {
  const LoadingState({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Center(
      child: CircularProgressIndicator(
        color: ColorManager.primary,
        backgroundColor: ColorManager.secondaryColor,
      ),
    );
  }
}
