import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/recourses/theme_manger/theme_manager.dart';
import 'core/routing/router.dart';
import 'core/services/service_locator.dart';
bool isLogin = false;
String? token;
String? toGoRoute;


void main() async {
  ServiceLocator().setup();
  runApp(const Task());

}

class Task extends StatelessWidget {
  const Task({super.key});

  @override
  Widget build(BuildContext context) {

    return  ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: getAppTheme(),
          routerConfig: router,
        );
      },
    );
  }
}
