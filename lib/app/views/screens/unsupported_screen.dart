import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/utils/app_colors.dart';

class UnsupportedScreen extends HookConsumerWidget {
  final double width;
  final double height;

  const UnsupportedScreen({
    super.key,
    required this.width,
    required this.height,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Unsupported Screen Size!',
                  style: TextStyle(
                    color: AppColors.colorGrey,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  '$width x $height',
                  style: const TextStyle(
                    color: AppColors.colorGrey,
                  ),
                ),
              ],
            ),
          ),
          const Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Center(
              child: Text(
                'Hint: Try zooming out your browser',
                style: TextStyle(
                  color: AppColors.colorGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
