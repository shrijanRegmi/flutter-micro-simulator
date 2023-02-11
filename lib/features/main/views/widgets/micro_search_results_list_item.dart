import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/app/extensions/context_extension.dart';
import 'package:micro_simulator/app/extensions/widget_extension.dart';
import 'package:micro_simulator/features/main/models/micro_opcode_model.dart';
import 'package:micro_simulator/features/main/providers/micro_input_field_provider.dart';
import 'package:micro_simulator/features/main/providers/micro_keyboard_button_provider.dart';
import 'package:micro_simulator/utils/app_colors.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class MicroSearchResultsListItem extends HookConsumerWidget {
  final MicroOpcode searchResult;
  final Function(MicroOpcode)? onPressed;
  const MicroSearchResultsListItem({
    super.key,
    required this.searchResult,
    this.onPressed,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPressed = useState(false);

    final bgColor = context.theme.scaffoldBackgroundColor;
    final offset =
        isPressed.value ? const Offset(1, 1) : const Offset(3.0, 3.0);
    final blur = isPressed.value ? 1.0 : 5.0;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            blurRadius: blur,
            offset: -offset,
            color: context.isDarkModeOn
                ? AppColors.colorKeyboardButtonShadow2Dark
                : AppColors.colorKeyboardButtonShadow2.withOpacity(0.5),
            inset: isPressed.value,
          ),
          BoxShadow(
            blurRadius: blur,
            offset: offset,
            color: context.isDarkModeOn
                ? AppColors.colorKeyboardButtonShadow2Dark
                : AppColors.colorKeyboardButtonShadow2.withOpacity(0.5),
            inset: isPressed.value,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: Center(
        child: Text(
          '${searchResult.name} (${searchResult.machineCode})',
          style: TextStyle(
            fontSize: 10.sp,
            color: AppColors.colorGrey,
          ),
        ),
      ),
    ).pad(3).onPressed(() {
      onPressed?.call(searchResult);
      ref.read(providerOfMicroKeyboardButton.notifier).playClickSound();
      ref.read(providerOfMicroInputField.notifier)
        ..makeAddressValueActive()
        ..resetValue()
        ..setValue(searchResult.machineCode);

      context.pop();

      isPressed.value = true;
      Future.delayed(const Duration(milliseconds: 200), () {
        isPressed.value = false;
      });
    });
  }
}
