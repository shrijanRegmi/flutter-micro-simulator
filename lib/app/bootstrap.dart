import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:micro_simulator/utils/app_colors.dart';

class Bootstrap {
  Bootstrap({required void Function() builder}) {
    _create();
    builder();
  }

  void _create() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.colorBlack,
      ),
    );
  }
}
