import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/app/views/screens/splash_screen.dart';
import 'package:micro_simulator/app/views/screens/unsupported_screen.dart';
import 'package:micro_simulator/features/main/views/screens/home_screen.dart';

class Wrapper extends StatefulHookConsumerWidget {
  const Wrapper({super.key});

  static const route = "/";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WrapperState();
}

class _WrapperState extends ConsumerState<Wrapper> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 4500), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const SplashScreen()
        : LayoutBuilder(
            builder: (context, constraints) {
              var unsupported = false;
              final width = constraints.maxWidth;
              final height = constraints.maxHeight;

              if (width < 950.0 || height < 580.0) {
                unsupported = true;
              } else if (width > 1400.0 && height < 800.0) {
                unsupported = true;
              }

              if (unsupported) {
                return UnsupportedScreen(
                  width: double.parse(
                    constraints.maxWidth.toStringAsFixed(1),
                  ),
                  height: double.parse(
                    constraints.maxHeight.toStringAsFixed(1),
                  ),
                );
              }

              return const HomeScreen();
            },
          );
  }
}
