import 'package:freezed_annotation/freezed_annotation.dart';

part 'micro_volume_button_state.freezed.dart';

@freezed
class MicroVolumnButtonState with _$MicroVolumnButtonState {
  const factory MicroVolumnButtonState.onValue({
    required final bool isMuted,
  }) = _OnValue;

  const factory MicroVolumnButtonState.loading() = _Loading;
}
