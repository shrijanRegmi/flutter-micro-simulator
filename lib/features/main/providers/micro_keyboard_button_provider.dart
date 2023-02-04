import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/features/main/enums/micro_active_input_type.dart';
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
      case MicroKeyAction.examMem:
        return onExamMemPressed(keyAction);
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
    final currentAddress = _microInputFieldProviderState.address;
    final currentValue = _microInputFieldProviderState.value;
    final currentActiveInput = _microInputFieldProviderState.activeInput;

    if (ksMicroKeyAction.containsKey(keyAction)) {
      if (keyAction == MicroKeyAction.reset) {
        _microInputFieldProvider.reset();
      } else {
        if (currentActiveInput == MicroActiveInput.address) {
          if (currentAddress.contains('....')) {
            _microInputFieldProvider
              ..resetAddress()
              ..setAddress(ksMicroKeyAction[keyAction]!);
          } else if (currentAddress.length < 4) {
            _microInputFieldProvider.setAddress(ksMicroKeyAction[keyAction]!);
          } else {
            _microInputFieldProvider
              ..resetAddress()
              ..setAddress(ksMicroKeyAction[keyAction]!);
          }
        } else if (currentActiveInput == MicroActiveInput.value) {
          if (currentValue.contains('..')) {
            _microInputFieldProvider
              ..resetValue()
              ..setValue(ksMicroKeyAction[keyAction]!);
          } else if (currentValue.length < 2) {
            _microInputFieldProvider.setValue(ksMicroKeyAction[keyAction]!);
          } else {
            _microInputFieldProvider
              ..resetValue()
              ..setValue(ksMicroKeyAction[keyAction]!);
          }
        }
      }
    }
  }

  void onNextBtnPressed(final MicroKeyAction keyAction) {
    final currentAddress = _microInputFieldProviderState.address;
    final currentActiveInput = _microInputFieldProviderState.activeInput;
    final currentAddressValuePair =
        _microInputFieldProviderState.addressValuePair;

    if (currentActiveInput != MicroActiveInput.value) {
      _microInputFieldProvider.makeValueActive();
    } else {
      final nextAddress = CommonHelper.convertToHex(
        currentAddress,
        withIncrement: 1,
      );
      final addressContainsValue = currentAddressValuePair[nextAddress] != null;

      _microInputFieldProvider
        ..saveAddressValue()
        ..resetAddress()
        ..setAddress(nextAddress);
      if (addressContainsValue) {
        _microInputFieldProvider
          ..resetValue()
          ..setValue(currentAddressValuePair[nextAddress]!);
      } else {
        _microInputFieldProvider.makeValueActive();
      }
    }
  }

  void onPrevBtnPressed(final MicroKeyAction keyAction) {
    final currentAddress = _microInputFieldProviderState.address;
    final currentAddressValuePair =
        _microInputFieldProviderState.addressValuePair;
    final prevAddress = CommonHelper.convertToHex(
      currentAddress,
      withIncrement: -1,
    );
    _microInputFieldProvider
      ..resetAddress()
      ..setAddress(prevAddress)
      ..resetValue()
      ..setValue(currentAddressValuePair[prevAddress] ?? '..');
  }

  void onExamMemPressed(final MicroKeyAction keyAction) {
    _microInputFieldProvider
      ..resetValue()
      ..makeAddressActive();
  }
}
