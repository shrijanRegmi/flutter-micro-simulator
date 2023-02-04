import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/features/main/views/widgets/micro_rounded_button.dart';
import 'package:micro_simulator/features/main/views/widgets/micro_search_input_field.dart';
import 'package:micro_simulator/utils/app_colors.dart';

class MicroSearchButton extends HookConsumerWidget {
  const MicroSearchButton({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MicroRoundedButton(
      icon: Icon(
        Icons.search_rounded,
        color: AppColors.colorGrey,
        size: 20.0.h,
      ),
      onPressed: () {
        showCupertinoModalPopup(
          context: context,
          barrierDismissible: true,
          builder: (context) {
            return SafeArea(
              child: Column(
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: ScreenUtil().screenWidth / 1.7,
                      ),
                      child: const MicroSearchInputField(),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
