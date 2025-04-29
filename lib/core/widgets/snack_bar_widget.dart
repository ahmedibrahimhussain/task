import 'package:flutter/material.dart';

import '../recourses/color_manager/color_manager.dart';



class AppSnackBar extends StatelessWidget {
  const AppSnackBar({
    super.key,
    required this.text,
    required this.snackBarState,
  });

  final String text;
  final SnackBarState snackBarState;

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: ListTile(
        title: Text(text,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: snackBarState == SnackBarState.noInternet ||
                          snackBarState == SnackBarState.idle
                      ? Colors.black
                      : Colors.white,
                )),
        leading: snackBarState.icon,
        horizontalTitleGap: 0,
      ),
      backgroundColor: snackBarState.color,
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.zero,
    );
  }
}

void showSnackBar({
  required String text,
  required SnackBarState snackBarState,
  required BuildContext context,
}) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: ListTile(
      title: Text(text,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: snackBarState == SnackBarState.noInternet ||
                        snackBarState == SnackBarState.idle
                    ? Colors.black
                    : Colors.white,
              )),
      leading: snackBarState.icon,
      horizontalTitleGap: 10,
    ),
    backgroundColor: snackBarState.color,
    behavior: SnackBarBehavior.floating,
    padding: EdgeInsets.zero,
  ));
}

enum SnackBarState {
  idle(color: ColorManager.secondaryColor, icon: Icon(Icons.abc)),
  error(
      color: ColorManager.red, icon: Icon(Icons.cancel, color: Colors.white)),
  noInternet(
    color: ColorManager.secondaryColor,
    icon: Icon(Icons.wifi_off_rounded, color: Colors.black),
  ),
  success(
    color: ColorManager.amber,
    icon: Icon(Icons.check_circle_rounded, color: Colors.white),
  );

  final Color color;
  final Icon icon;

  const SnackBarState({required this.color, required this.icon});
}
