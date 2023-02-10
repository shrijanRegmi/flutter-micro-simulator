import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/features/main/enums/micro_active_input_type.dart';
import 'package:micro_simulator/features/main/enums/micro_key_action_type.dart';
import 'package:micro_simulator/features/main/enums/micro_register_type.dart';
import 'package:micro_simulator/features/main/helpers/common_helper.dart';
import 'package:micro_simulator/features/main/models/micro_opcode_model.dart';
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
      case MicroKeyAction.reset:
        return onResetBtnPressed(keyAction);
      case MicroKeyAction.next:
        return onNextBtnPressed(keyAction);
      case MicroKeyAction.prev:
        return onPrevBtnPressed(keyAction);
      case MicroKeyAction.examMem:
        return onExamMemPressed(keyAction);
      case MicroKeyAction.examReg:
        return onExamRegPressed(keyAction);
      case MicroKeyAction.go:
        return onGoBtnPressed(keyAction);
      case MicroKeyAction.exec:
        return onExecBtnPressed(keyAction);
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

  void onResetBtnPressed(final MicroKeyAction keyAction) {
    _microInputFieldProvider
      ..reset()
      ..resetRegisters();
  }

  void onNextBtnPressed(final MicroKeyAction keyAction) {
    final currentAddress = _microInputFieldProviderState.address;
    final currentActiveInput = _microInputFieldProviderState.activeInput;
    final currentBeforeExecution =
        _microInputFieldProviderState.beforeExecution;
    final lastOperatorKeyAction =
        _microInputFieldProviderState.lastOperatorKeyAction;
    final lastShownRegister = _microInputFieldProviderState.lastShownRegister;
    final currentRegisters = _microInputFieldProviderState.registers;

    if (lastOperatorKeyAction == MicroKeyAction.examMem) {
      if (currentActiveInput != MicroActiveInput.value) {
        final addressContainsValue =
            currentBeforeExecution[currentAddress] != null;
        _microInputFieldProvider.makeValueActive();

        if (addressContainsValue) {
          _microInputFieldProvider
            ..resetValue()
            ..setValue(
              currentBeforeExecution[currentAddress]!,
            );
        }
      } else {
        final nextAddress = CommonHelper.convertToHex(
          currentAddress,
          withIncrement: 1,
        );
        final addressContainsValue =
            currentBeforeExecution[nextAddress] != null;

        _microInputFieldProvider
          ..saveToBeforeExecution()
          ..resetAddress()
          ..setAddress(nextAddress);
        if (addressContainsValue) {
          _microInputFieldProvider
            ..resetValue()
            ..setValue(currentBeforeExecution[nextAddress]!);
        } else {
          _microInputFieldProvider.makeValueActive();
        }
      }
    } else if (lastOperatorKeyAction == MicroKeyAction.examReg) {
      if (lastShownRegister.index < MicroRegister.values.length - 1) {
        final nextRegister = MicroRegister.values[lastShownRegister.index + 1];
        final registerContainsValue = currentRegisters[nextRegister] != null;

        _microInputFieldProvider
          ..saveToBeforeExecution()
          ..resetAddress()
          ..setLastShownRegister(nextRegister)
          ..setAddress(ksMicroRegister[nextRegister] ?? 'NA');
        if (registerContainsValue) {
          _microInputFieldProvider
            ..resetValue()
            ..setValue(currentRegisters[nextRegister]!);
        } else {
          _microInputFieldProvider.makeValueActive();
        }
      }
    }
  }

  void onPrevBtnPressed(final MicroKeyAction keyAction) {
    final currentAddress = _microInputFieldProviderState.address;
    final currentBeforeExecution =
        _microInputFieldProviderState.beforeExecution;
    final lastOperatorKeyAction =
        _microInputFieldProviderState.lastOperatorKeyAction;
    final lastShownRegister = _microInputFieldProviderState.lastShownRegister;
    final currentRegisters = _microInputFieldProviderState.registers;

    if (lastOperatorKeyAction == MicroKeyAction.examMem) {
      final prevAddress = CommonHelper.convertToHex(
        currentAddress,
        withIncrement: -1,
      );
      _microInputFieldProvider
        ..resetAddress()
        ..setAddress(prevAddress)
        ..resetValue()
        ..setValue(currentBeforeExecution[prevAddress] ?? '..');
    } else if (lastOperatorKeyAction == MicroKeyAction.examReg) {
      if (lastShownRegister.index > 1) {
        final prevRegister = MicroRegister.values[lastShownRegister.index - 1];
        final registerContainsValue = currentRegisters[prevRegister] != null;

        _microInputFieldProvider
          ..saveToBeforeExecution()
          ..resetAddress()
          ..setLastShownRegister(prevRegister)
          ..setAddress(ksMicroRegister[prevRegister] ?? 'NA');
        if (registerContainsValue) {
          _microInputFieldProvider
            ..resetValue()
            ..setValue(currentRegisters[prevRegister]!);
        } else {
          _microInputFieldProvider.makeValueActive();
        }
      }
    }
  }

  void onExamMemPressed(final MicroKeyAction keyAction) {
    _microInputFieldProvider
      ..setLastOperatorKeyAction(keyAction)
      ..resetValue()
      ..makeAddressActive();
  }

  void onExamRegPressed(final MicroKeyAction keyAction) {
    final currentRegisters = _microInputFieldProviderState.registers;
    const register = MicroRegister.a;

    _microInputFieldProvider
      ..setLastOperatorKeyAction(keyAction)
      ..setLastShownRegister(register)
      ..resetAddress()
      ..resetValue()
      ..setAddress(ksMicroRegister[register] ?? 'NA')
      ..setValue(currentRegisters[register] ?? '..');
  }

  void onGoBtnPressed(final MicroKeyAction keyAction) {
    _microInputFieldProvider
      ..setLastOperatorKeyAction(keyAction)
      ..resetValue()
      ..makeAddressActive();
  }

  void onExecBtnPressed(final MicroKeyAction keyAction) {
    final lastOperatorKeyAction =
        _microInputFieldProviderState.lastOperatorKeyAction;

    if (lastOperatorKeyAction == MicroKeyAction.go) {
      _microInputFieldProvider
        ..reset()
        ..resetAddress()
        ..resetValue()
        ..setLastOperatorKeyAction(keyAction)
        ..setAddress('.');

      // execute the opcodes here
      execOpcodes();
    }
  }

  void execOpcodes() {
    final currentBeforeExecution =
        _microInputFieldProviderState.beforeExecution;
    currentBeforeExecution.forEach((address, value) {
      final opcode = _microInputFieldProvider.findOpcode(value);

      switch (opcode.name) {
        case 'MVI A':
          return execMVIA(address, opcode);
        case 'RST 5':
          return execRST5(address, opcode);
        default:
      }
    });
  }

  void execMVIA(final String address, final MicroOpcode opcode) {
    final currentBeforeExecution =
        _microInputFieldProviderState.beforeExecution;

    final nextAddress = CommonHelper.convertToHex(
      address,
      withIncrement: 1,
    );

    if (currentBeforeExecution[nextAddress] != null) {
      _microInputFieldProvider.setRegister(
        MicroRegister.a,
        currentBeforeExecution[nextAddress]!,
      );

      print(_microInputFieldProviderState.registers);
    }
  }

  void execRST5(final String address, final MicroOpcode opcode) {
    _microInputFieldProvider.reset();
  }
}
