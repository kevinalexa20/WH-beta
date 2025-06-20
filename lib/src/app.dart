import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wh_mobile/src/common/constants/constants.dart';
import 'package:wh_mobile/src/routes/app_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(
      context,
      "Plus Jakarta Sans",
      "Lexend",
    );
    MaterialTheme theme = MaterialTheme(textTheme);

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          title: 'Warung Hemat',
          theme: brightness == Brightness.light ? theme.light() : theme.dark(),
          routerConfig: router,
        );
      },
    );
  }
}
