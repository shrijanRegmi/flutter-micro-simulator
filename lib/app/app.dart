import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:micro_simulator/features/main/views/screens/home_screen.dart';
import 'package:micro_simulator/app/flavor_types.dart';
import 'package:micro_simulator/utils/app_router.dart';
import 'package:micro_simulator/utils/app_theme.dart';

class MPApp extends StatelessWidget {
  final Flavor flavor;
  const MPApp({
    super.key,
    required this.flavor,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          title: '${ksFlavor[flavor]} Micro Simulator'.trim(),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightPalette,
          darkTheme: AppTheme.darkPalette,
          initialRoute: HomeScreen.route,
          onGenerateRoute: AppRouter.onGenerateRoute,
        );
      },
    );
  }
}
