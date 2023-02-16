import 'package:flutter/foundation.dart';
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
              if (kIsWeb &&
                  (constraints.maxWidth < 950.0 ||
                      constraints.maxHeight < 580.0)) {
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
