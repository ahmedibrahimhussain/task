import 'package:flutter/material.dart';

import '../recourses/styles_manger/styles_manager.dart';

class EmptyState extends StatelessWidget {
  const EmptyState(this.text,{super.key});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text,style: getRegularStyle(),),
    );
  }
}
