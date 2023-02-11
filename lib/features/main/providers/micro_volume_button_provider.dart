import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/features/main/providers/states/micro_volume_button_state.dart';
import 'package:micro_simulator/features/main/repositories/audio_repo.dart';

final providerOfMicroVolumeButton =
    StateNotifierProvider<MicroVolumeButtonProvider, MicroVolumeButtonState>(
        (ref) {
  return MicroVolumeButtonProvider(ref: ref);
});

class MicroVolumeButtonProvider extends StateNotifier<MicroVolumeButtonState> {
  MicroVolumeButtonProvider({required final Ref ref})
      : _ref = ref,
        super(const MicroVolumeButtonState.onValue(isMuted: false)) {
    getMute();
  }

  final Ref _ref;
  AudioRepo get _audioRepo => _ref.watch(providerOfAudioRepository);

  Future<void> setMute({
    required final bool isMuted,
  }) {
    state = MicroVolumeButtonState.onValue(isMuted: isMuted);
    return _audioRepo.setMute(
      muted: isMuted,
    );
  }

  Future<void> getMute() async {
    state = const MicroVolumeButtonState.loading();
    final val = await _audioRepo.getMute();
    state = MicroVolumeButtonState.onValue(
      isMuted: val,
    );
  }
}
