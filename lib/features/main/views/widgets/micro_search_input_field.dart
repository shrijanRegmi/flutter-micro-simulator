import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/app/extensions/context_extension.dart';
import 'package:micro_simulator/app/extensions/widget_extension.dart';
import 'package:micro_simulator/features/main/providers/micro_search_input_field_provider.dart';
import 'package:micro_simulator/features/main/views/widgets/micro_rounded_button.dart';
import 'package:micro_simulator/utils/app_colors.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class MicroSearchInputField extends HookConsumerWidget {
  const MicroSearchInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchController = useTextEditingController();
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
                ? AppColors.colorKeyboardButtonShadow2Dark
                : AppColors.colorKeyboardButtonShadow2.withOpacity(0.5),
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
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 0),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                autofocus: true,
                cursorColor: AppColors.colorGrey,
                controller: searchController,
                textCapitalization: TextCapitalization.characters,
                style: const TextStyle(
                  height: 1.4,
                  fontWeight: FontWeight.bold,
                  color: AppColors.colorGrey,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search Opcode...',
                  hintStyle: TextStyle(
                    height: 1.4,
                    fontWeight: FontWeight.bold,
                    color: AppColors.colorGrey,
                  ),
                ),
                onChanged: ref
                    .read(providerOfMicroSearchInputField.notifier)
                    .onChanged,
              ).pB(5),
            ),
            SizedBox(
              width: 10.w,
            ),
            if (ref.watch(providerOfMicroSearchInputField).isNotEmpty)
              MicroRoundedButton(
                icon: const Icon(
                  Icons.clear_rounded,
                  color: AppColors.colorGrey,
                  size: 20,
                ),
                size: 30,
                onPressed: () {
                  searchController.text = '';
                  ref.read(providerOfMicroSearchInputField.notifier).reset();
                },
              ),
          ],
        ),
      ),
    );
  }
}
