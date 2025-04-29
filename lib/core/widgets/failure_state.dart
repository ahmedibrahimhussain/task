import 'package:flutter/material.dart';

import '../recourses/styles_manger/styles_manager.dart';

class FailureState extends StatelessWidget {
  const FailureState(this.errorMessage, {super.key});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(errorMessage,style: getRegularStyle(),),
    );
  }
}
