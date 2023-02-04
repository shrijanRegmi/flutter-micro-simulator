import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/app/extensions/context_extension.dart';
import 'package:micro_simulator/app/extensions/widget_extension.dart';
import 'package:micro_simulator/features/main/providers/micro_input_field_provider.dart';
import 'package:micro_simulator/utils/app_colors.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

enum _Type {
  address,
  value,
}

class MicroInputField extends HookConsumerWidget {
  final _Type _type;

  const MicroInputField.address({super.key}) : _type = _Type.address;
  const MicroInputField.value({super.key}) : _type = _Type.value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final microInputFieldProvider = ref.watch(providerOfMicroInputField);
    final text = _type == _Type.address
        ? microInputFieldProvider.address
        : microInputFieldProvider.value;

    final bgColor = context.theme.scaffoldBackgroundColor;
    const offset = Offset(10.0, 10.0);
    const blur = 10.0;
    return Container(
      height: 56.0.h,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(18.0),
        boxShadow: [
          BoxShadow(
            blurRadius: blur,
            offset: -offset,
            color: context.isDarkModeOn
                ? AppColors.colorKeyboardButtonShadow1Dark
                : AppColors.colorKeyboardButtonShadow1.withOpacity(0.5),
            inset: false,
          ),
          BoxShadow(
            blurRadius: blur,
            offset: offset,
            color: context.isDarkModeOn
                ? AppColors.colorKeyboardButtonShadow2Dark
                : AppColors.colorKeyboardButtonShadow2.withOpacity(0.5),
            inset: false,
          ),
        ],
      ),
      child: Center(
        child: Text(
          text.toUpperCase(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 32.0.sp,
            height: 1.4,
            letterSpacing: 8.0,
            fontWeight: FontWeight.bold,
            color: AppColors.colorGrey,
          ),
        ).pL(5.0),
      ),
    );
  }
}
