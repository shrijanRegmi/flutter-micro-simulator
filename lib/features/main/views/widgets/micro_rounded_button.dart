import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/app/extensions/context_extension.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:micro_simulator/app/extensions/widget_extension.dart';
import 'package:micro_simulator/features/main/providers/micro_keyboard_button_provider.dart';
import 'package:micro_simulator/utils/app_colors.dart';

class MicroRoundedButton extends HookConsumerWidget {
  final Widget icon;
  final double size;
  final Function()? onPressed;
  const MicroRoundedButton({
    super.key,
    required this.icon,
    this.size = 40.0,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPressed = useState(false);

    final bgColor = context.theme.scaffoldBackgroundColor;
    final offset =
        isPressed.value ? const Offset(5, 5) : const Offset(10.0, 10.0);
    final blur = isPressed.value ? 5.0 : 10.0;

    return AnimatedContainer(
      width: size.h,
      height: size.h,
      duration: const Duration(milliseconds: 10),
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            blurRadius: blur,
            offset: -offset,
            color: context.isDarkModeOn
                ? AppColors.colorKeyboardButtonShadow1Dark
                : AppColors.colorKeyboardButtonShadow1.withOpacity(0.5),
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
      child: Center(
        child: icon,
      ),
    ).onPressed(() {
      onPressed?.call();
      ref.read(providerOfMicroKeyboardButton.notifier).playClickSound();

      isPressed.value = true;
      Future.delayed(const Duration(milliseconds: 200), () {
        isPressed.value = false;
      });
    });
  }
}
