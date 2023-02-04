import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/features/main/enums/micro_key_action_type.dart';
import 'package:micro_simulator/features/main/views/widgets/micro_keyboard_button.dart';

class MicroKeyboard extends HookConsumerWidget {
  final List<MicroKeyAction> keyActions;
  final int itemCount;
  final int crossAxisCount;
  final double fontSize;
  const MicroKeyboard({
    super.key,
    required this.keyActions,
    this.itemCount = 16,
    this.crossAxisCount = 4,
    this.fontSize = 18.0,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 5.w,
        mainAxisSpacing: 5.w,
        childAspectRatio: 4 / 2.6,
      ),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        final keyAction = keyActions[index];
        return MicroKeyboardButton(
          keyAction: keyAction,
          fontSize: fontSize,
        );
      },
    );
  }
}
