import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/features/main/enums/micro_key_action_type.dart';
import 'package:micro_simulator/features/main/helpers/common_helper.dart';
import 'package:micro_simulator/features/main/providers/micro_input_field_provider.dart';
import 'package:micro_simulator/features/main/providers/micro_volumn_button_provider.dart';
import 'package:micro_simulator/features/main/providers/states/micro_input_field_provider_state.dart';
import 'package:micro_simulator/features/main/providers/states/micro_volume_button_state.dart';
import 'package:micro_simulator/features/main/repositories/audio_repo.dart';

final providerOfMicroKeyboardButton =
    StateNotifierProvider<MicroKeyboardButtonProvider, bool>((ref) {
  return MicroKeyboardButtonProvider(ref: ref);
});

class MicroKeyboardButtonProvider extends StateNotifier<bool> {
  MicroKeyboardButtonProvider({
    required final Ref ref,
  })  : _ref = ref,
        super(false);

  final Ref _ref;
  AudioRepo get _audioRepo => _ref.watch(providerOfAudioRepository);
  MicroInputFieldProvider get _microInputFieldProvider =>
      _ref.read(providerOfMicroInputField.notifier);
  MicroInputFieldProviderState get _microInputFieldProviderState =>
      _ref.read(providerOfMicroInputField);
  MicroVolumnButtonState get _microVolumeButtonState =>
      _ref.read(providerOfMicroVolumeButton);

  Future<void> playClickSound() async {
    final val = _microVolumeButtonState.maybeWhen(
      onValue: (val) => val,
      orElse: () => false,
    );
    if (val) return;
    return _audioRepo.playClickSound();
  }

  void setAddress(final MicroKeyAction keyAction) {
    switch (keyAction) {
      case MicroKeyAction.next:
        return onNextBtnPressed(keyAction);
      case MicroKeyAction.prev:
        return onPrevBtnPressed(keyAction);
      default:
        return onInputKeysPressed(keyAction);
    }
  }

  void setValue(final MicroKeyAction keyAction) {
    if (ksMicroKeyAction.containsKey(keyAction)) {
      if (keyAction == MicroKeyAction.reset) {
        _microInputFieldProvider.reset();
      } else {
        if (_microInputFieldProviderState.value.length >= 2) return;
        _microInputFieldProvider.setValue(ksMicroKeyAction[keyAction]!);
      }
    }
  }

  void onInputKeysPressed(final MicroKeyAction keyAction) {
    if (ksMicroKeyAction.containsKey(keyAction)) {
      if (keyAction == MicroKeyAction.reset) {
        _microInputFieldProvider.reset();
      } else {
        if (_microInputFieldProviderState.address.length >= 4) return;
        _microInputFieldProvider.setAddress(ksMicroKeyAction[keyAction]!);
      }
    }
  }

  void onNextBtnPressed(final MicroKeyAction keyAction) {
    final currentAddress = _microInputFieldProviderState.address;
    final nextAddress = CommonHelper.convertToHex(
      currentAddress,
      withIncrement: 1,
    );
    _microInputFieldProvider
      ..resetAddress()
      ..setAddress(nextAddress);
  }

  void onPrevBtnPressed(final MicroKeyAction keyAction) {
    final currentAddress = _microInputFieldProviderState.address;
    final prevAddress = CommonHelper.convertToHex(
      currentAddress,
      withIncrement: -1,
    );
    _microInputFieldProvider
      ..resetAddress()
      ..setAddress(prevAddress);
  }
}
