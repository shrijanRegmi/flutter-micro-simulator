import 'package:freezed_annotation/freezed_annotation.dart';

part 'micro_volume_button_state.freezed.dart';

@freezed
class MicroVolumeButtonState with _$MicroVolumeButtonState {
  const factory MicroVolumeButtonState.onValue({
    required final bool isMuted,
  }) = _OnValue;

  const factory MicroVolumeButtonState.loading() = _Loading;
}
