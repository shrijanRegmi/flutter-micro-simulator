import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/app/screens/unsupported_screen.dart';
import 'package:micro_simulator/features/main/views/screens/home_screen.dart';

class Wrapper extends HookConsumerWidget {
  const Wrapper({super.key});

  static const route = "/";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 950.0 || constraints.maxHeight < 480.0) {
          return UnsupportedScreen(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
          );
        }

        return const HomeScreen();
      },
    );
  }
}
