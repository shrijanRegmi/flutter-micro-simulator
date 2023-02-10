import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/app/extensions/widget_extension.dart';
import 'package:micro_simulator/features/main/enums/micro_key_action_type.dart';
import 'package:micro_simulator/features/main/views/widgets/micro_input_field.dart';
import 'package:micro_simulator/features/main/views/widgets/micro_keyboard.dart';
import 'package:micro_simulator/features/main/views/widgets/micro_search_button.dart';
import 'package:micro_simulator/features/main/views/widgets/micro_volume_button.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  static const route = "/home_screen";

  static const keyActionsCol1 = [
    MicroKeyAction.reset,
    MicroKeyAction.kb,
    MicroKeyAction.f1,
    MicroKeyAction.insert,
    MicroKeyAction.f2,
    MicroKeyAction.delete,
    MicroKeyAction.next,
    MicroKeyAction.prev,
  ];

  static const keyActionsCol2 = [
    MicroKeyAction.c,
    MicroKeyAction.d,
    MicroKeyAction.e,
    MicroKeyAction.f,
    MicroKeyAction.num8,
    MicroKeyAction.num9,
    MicroKeyAction.a,
    MicroKeyAction.b,
    MicroKeyAction.num4,
    MicroKeyAction.num5,
    MicroKeyAction.num6,
    MicroKeyAction.num7,
    MicroKeyAction.num0,
    MicroKeyAction.num1,
    MicroKeyAction.num2,
    MicroKeyAction.num3,
  ];

  static const keyActionsCol3 = [
    MicroKeyAction.outByte,
    MicroKeyAction.inByte,
    MicroKeyAction.singleStep,
    MicroKeyAction.blkMove,
    MicroKeyAction.examReg,
    MicroKeyAction.examMem,
    MicroKeyAction.go,
    MicroKeyAction.exec,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: SizedBox(
            height: ScreenUtil().screenHeight - kToolbarHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const MicroVolumeButton(),
                          _addressAndOpcodeBuilder(),
                          const MicroSearchButton(),
                        ],
                      ).pY(9),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: _keyboardLayoutBuilder(),
                ),
              ],
            ).pX(5),
          ),
        ),
      ),
    );
  }

  Widget _addressAndOpcodeBuilder() {
    return SizedBox(
      width: 160.0.w,
      child: Row(
        children: [
          const Expanded(
            child: MicroInputField.address(),
          ),
          SizedBox(
            width: 10.0.w,
          ),
          SizedBox(
            width: 50.0.w,
            child: const MicroInputField.value(),
          ),
        ],
      ),
    );
  }

  Widget _keyboardLayoutBuilder() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: 80.0.w,
            ),
            child: const MicroKeyboard(
              keyActions: keyActionsCol1,
              crossAxisCount: 2,
              itemCount: 8,
              fontSize: 12.0,
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 160.0.w,
            ),
            child: const MicroKeyboard(
              keyActions: keyActionsCol2,
            ),
          ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 80.0.w,
            ),
            child: const MicroKeyboard(
              keyActions: keyActionsCol3,
              crossAxisCount: 2,
              itemCount: 8,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
