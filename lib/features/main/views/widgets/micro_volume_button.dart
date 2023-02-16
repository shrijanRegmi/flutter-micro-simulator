import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/features/main/providers/micro_volume_button_provider.dart';
import 'package:micro_simulator/features/main/views/widgets/micro_rounded_button.dart';
import 'package:micro_simulator/utils/app_colors.dart';

class MicroVolumeButton extends HookConsumerWidget {
  const MicroVolumeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isMuted = ref.watch(providerOfMicroVolumeButton);

    if (kIsWeb || Platform.isWindows) return const SizedBox();

    return isMuted.maybeWhen(
      onValue: (val) => MicroRoundedButton(
        icon: Icon(
          val ? Icons.volume_off_rounded : Icons.volume_up_rounded,
          color: AppColors.colorGrey,
          size: 20.0.h,
        ),
        onPressed: () => ref
            .read(providerOfMicroVolumeButton.notifier)
            .setMute(isMuted: !val),
      ),
      orElse: () => const SizedBox(),
    );
  }
}
