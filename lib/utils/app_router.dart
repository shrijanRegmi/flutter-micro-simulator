import 'package:flutter/material.dart';
import 'package:micro_simulator/app/wrapper.dart';
import 'package:micro_simulator/features/main/views/screens/home_screen.dart';

class AppRouter {
  static Route onGenerateRoute(final RouteSettings settings) {
    switch (settings.name) {
      case Wrapper.route:
        return _buildRoute(
          settings: settings,
          widget: const Wrapper(),
        );
      case HomeScreen.route:
        return _buildRoute(
          settings: settings,
          widget: const HomeScreen(),
        );
      default:
        return _buildRoute(
          settings: settings,
          widget: const HomeScreen(),
        );
    }
  }

  static Route _buildRoute({
    required final RouteSettings settings,
    required final Widget widget,
  }) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => widget,
    );
  }
}
