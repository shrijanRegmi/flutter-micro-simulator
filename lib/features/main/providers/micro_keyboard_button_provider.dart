import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/features/main/enums/micro_active_input_type.dart';
import 'package:micro_simulator/features/main/enums/micro_key_action_type.dart';
import 'package:micro_simulator/features/main/enums/micro_opcode_category_type.dart';
import 'package:micro_simulator/features/main/enums/micro_register_type.dart';
import 'package:micro_simulator/features/main/helpers/common_helper.dart';
import 'package:micro_simulator/features/main/models/micro_opcode_model.dart';
import 'package:micro_simulator/features/main/providers/micro_input_field_provider.dart';
import 'package:micro_simulator/features/main/providers/micro_volume_button_provider.dart';
import 'package:micro_simulator/features/main/providers/states/micro_input_field_provider_state.dart';
import 'package:micro_simulator/features/main/providers/states/micro_volume_button_state.dart';
import 'package:micro_simulator/features/main/repositories/audio_repo.dart';
import 'package:micro_simulator/utils/micro_opcode_name.dart';

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
  MicroVolumeButtonState get _microVolumeButtonState =>
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
      if (currentActiveInput == MicroActiveInput.address) {
        final addressContainsValue =
            currentBeforeExecution[currentAddress] != null;
        _microInputFieldProvider.makeAddressValueActive();

        if (addressContainsValue) {
          _microInputFieldProvider
            ..resetValue()
            ..setValue(
              currentBeforeExecution[currentAddress]!,
            );
        }
      } else {
        final nextAddress = CommonHelper.convertToIncrementedHex(
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
          _microInputFieldProvider.makeAddressValueActive();
        }
      }
    } else if (lastOperatorKeyAction == MicroKeyAction.examReg) {
      if (lastShownRegister.index < MicroRegister.values.length - 1) {
        final nextRegister = MicroRegister.values[lastShownRegister.index + 1];
        final registerContainsValue = currentRegisters[nextRegister] != null;

        _microInputFieldProvider
          ..resetAddress()
          ..setLastShownRegister(nextRegister)
          ..setAddress(ksMicroRegister[nextRegister] ?? 'NA');
        if (registerContainsValue) {
          _microInputFieldProvider
            ..resetValue()
            ..setValue(currentRegisters[nextRegister]!);
        } else {
          _microInputFieldProvider.makeRegisterValueActive();
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
      final prevAddress = CommonHelper.convertToIncrementedHex(
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
          ..resetAddress()
          ..setLastShownRegister(prevRegister)
          ..setAddress(ksMicroRegister[prevRegister] ?? 'NA');
        if (registerContainsValue) {
          _microInputFieldProvider
            ..resetValue()
            ..setValue(currentRegisters[prevRegister]!);
        } else {
          _microInputFieldProvider.makeAddressValueActive();
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

    final registerValue = currentRegisters[register] ??
        _microInputFieldProvider.getRandomOpcodeForRegister();

    _microInputFieldProvider
      ..setLastOperatorKeyAction(keyAction)
      ..setLastShownRegister(register)
      ..resetAddress()
      ..resetValue()
      ..setAddress(ksMicroRegister[register] ?? 'NA')
      ..setRegister(register, registerValue)
      ..setValue(registerValue);
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

  // <---- main execution code lies here ---->
  void execOpcodes() {
    final currentBeforeExecution =
        _microInputFieldProviderState.beforeExecution;

    var bytes = 0;
    MicroOpcode? mainOpcode;
    for (var i = 0; i < currentBeforeExecution.keys.toList().length; i++) {
      final address = currentBeforeExecution.keys.toList()[i];
      final value = currentBeforeExecution[address];

      if (value != null) {
        final opcode = _microInputFieldProvider.findOpcode(value);
        bytes++;
        if (bytes < (mainOpcode?.bytes ?? 0)) {
          if ((mainOpcode?.bytes ?? 0) > 1) {
            continue;
          }
        }
        bytes = 0;
        mainOpcode = opcode;
        switch (opcode.category) {
          case MicroOpcodeCategory.mvi:
            execMVI(address, opcode);
            break;
          case MicroOpcodeCategory.lxi:
            execLXI(address, opcode);
            break;
          case MicroOpcodeCategory.inr:
            execINR(address, opcode);
            break;
          case MicroOpcodeCategory.inx:
            execINX(address, opcode);
            break;
          case MicroOpcodeCategory.dcr:
            execDCR(address, opcode);
            break;
          case MicroOpcodeCategory.dcx:
            execDCX(address, opcode);
            break;
          case MicroOpcodeCategory.add:
            execADD(address, opcode);
            break;
          case MicroOpcodeCategory.rst5:
            execRST5(address, opcode);
            break;
          default:
            mainOpcode = null;
        }
      }
    }
  }

  void execMVI(final String address, final MicroOpcode opcode) {
    final currentBeforeExecution =
        _microInputFieldProviderState.beforeExecution;

    var register = MicroRegister.unknown;

    switch (opcode.name) {
      case MicroOpcodeName.mviA:
        register = MicroRegister.a;
        break;
      case MicroOpcodeName.mviB:
        register = MicroRegister.b;
        break;
      case MicroOpcodeName.mviC:
        register = MicroRegister.c;
        break;
      case MicroOpcodeName.mviD:
        register = MicroRegister.d;
        break;
      case MicroOpcodeName.mviE:
        register = MicroRegister.e;
        break;
      case MicroOpcodeName.mviH:
        register = MicroRegister.h;
        break;
      case MicroOpcodeName.mviL:
        register = MicroRegister.l;
        break;
      case MicroOpcodeName.mviM:
        register = MicroRegister.m;
        break;
      default:
        register = MicroRegister.unknown;
    }

    final nextAddress = CommonHelper.convertToIncrementedHex(
      address,
      withIncrement: 1,
    );

    if (currentBeforeExecution[nextAddress] != null) {
      _microInputFieldProvider.setRegister(
        register,
        currentBeforeExecution[nextAddress]!,
      );
    }
  }

  void execLXI(final String address, final MicroOpcode opcode) {
    final currentBeforeExecution =
        _microInputFieldProviderState.beforeExecution;

    var register1 = MicroRegister.unknown;
    var register2 = MicroRegister.unknown;

    switch (opcode.name) {
      case MicroOpcodeName.lxiB:
        register1 = MicroRegister.b;
        register2 = MicroRegister.c;
        break;
      case MicroOpcodeName.lxiD:
        register1 = MicroRegister.d;
        register2 = MicroRegister.e;
        break;
      case MicroOpcodeName.lxiH:
        register1 = MicroRegister.h;
        register2 = MicroRegister.l;
        break;
      default:
        register1 = MicroRegister.unknown;
        register2 = MicroRegister.unknown;
    }

    final nextAddress1 = CommonHelper.convertToIncrementedHex(
      address,
      withIncrement: 1,
    );

    final nextAddress2 = CommonHelper.convertToIncrementedHex(
      nextAddress1,
      withIncrement: 1,
    );

    if (currentBeforeExecution[nextAddress1] != null &&
        currentBeforeExecution[nextAddress2] != null) {
      _microInputFieldProvider
        ..setRegister(
          register1,
          currentBeforeExecution[nextAddress2]!,
        )
        ..setRegister(
          register2,
          currentBeforeExecution[nextAddress1]!,
        );
    }
  }

  void execINR(final String address, final MicroOpcode opcode) {
    final currentRegisters = _microInputFieldProviderState.registers;

    var register = MicroRegister.unknown;

    switch (opcode.name) {
      case MicroOpcodeName.inrA:
        register = MicroRegister.a;
        break;
      case MicroOpcodeName.inrB:
        register = MicroRegister.b;
        break;
      case MicroOpcodeName.inrC:
        register = MicroRegister.c;
        break;
      case MicroOpcodeName.inrD:
        register = MicroRegister.d;
        break;
      case MicroOpcodeName.inrE:
        register = MicroRegister.e;
        break;
      case MicroOpcodeName.inrH:
        register = MicroRegister.h;
        break;
      case MicroOpcodeName.inrL:
        register = MicroRegister.l;
        break;
      case MicroOpcodeName.inrM:
        register = MicroRegister.m;
        break;
      default:
        register = MicroRegister.unknown;
    }

    if (currentRegisters[register] != null) {
      var increasedValue = CommonHelper.convertToIncrementedHex(
        currentRegisters[register]!,
        withIncrement: 1,
        digits: 2,
      );

      _microInputFieldProvider.setRegister(
        register,
        increasedValue,
      );
    }
  }

  void execINX(final String address, final MicroOpcode opcode) {
    final currentRegisters = _microInputFieldProviderState.registers;

    var register1 = MicroRegister.unknown;
    var register2 = MicroRegister.unknown;

    switch (opcode.name) {
      case MicroOpcodeName.inxB:
        register1 = MicroRegister.b;
        register2 = MicroRegister.c;
        break;
      case MicroOpcodeName.inxD:
        register1 = MicroRegister.d;
        register2 = MicroRegister.e;
        break;
      case MicroOpcodeName.inxH:
        register1 = MicroRegister.h;
        register2 = MicroRegister.l;
        break;

      default:
        register1 = MicroRegister.unknown;
        register2 = MicroRegister.unknown;
    }

    if (currentRegisters[register1] != null &&
        currentRegisters[register2] != null) {
      var increasedValue = CommonHelper.convertToIncrementedHex(
        '${currentRegisters[register1]}${currentRegisters[register2]}',
        withIncrement: 1,
      );
      var increasedValue1 = increasedValue.substring(0, 2);
      var increasedValue2 = increasedValue.substring(2, 4);

      _microInputFieldProvider
        ..setRegister(register1, increasedValue1)
        ..setRegister(register2, increasedValue2);
    }
  }

  void execDCR(final String address, final MicroOpcode opcode) {
    final currentRegisters = _microInputFieldProviderState.registers;

    var register = MicroRegister.unknown;

    switch (opcode.name) {
      case MicroOpcodeName.inrA:
        register = MicroRegister.a;
        break;
      case MicroOpcodeName.inrB:
        register = MicroRegister.b;
        break;
      case MicroOpcodeName.inrC:
        register = MicroRegister.c;
        break;
      case MicroOpcodeName.inrD:
        register = MicroRegister.d;
        break;
      case MicroOpcodeName.inrE:
        register = MicroRegister.e;
        break;
      case MicroOpcodeName.inrH:
        register = MicroRegister.h;
        break;
      case MicroOpcodeName.inrL:
        register = MicroRegister.l;
        break;
      case MicroOpcodeName.inrM:
        register = MicroRegister.m;
        break;
      default:
        register = MicroRegister.unknown;
    }

    if (currentRegisters[register] != null) {
      var increasedValue = CommonHelper.convertToIncrementedHex(
        currentRegisters[register]!,
        withIncrement: -1,
        digits: 2,
      );

      _microInputFieldProvider.setRegister(
        register,
        increasedValue,
      );
    }
  }

  void execDCX(final String address, final MicroOpcode opcode) {
    final currentRegisters = _microInputFieldProviderState.registers;

    var register1 = MicroRegister.unknown;
    var register2 = MicroRegister.unknown;

    switch (opcode.name) {
      case MicroOpcodeName.inxB:
        register1 = MicroRegister.b;
        register2 = MicroRegister.c;
        break;
      case MicroOpcodeName.inxD:
        register1 = MicroRegister.d;
        register2 = MicroRegister.e;
        break;
      case MicroOpcodeName.inxH:
        register1 = MicroRegister.h;
        register2 = MicroRegister.l;
        break;

      default:
        register1 = MicroRegister.unknown;
        register2 = MicroRegister.unknown;
    }

    if (currentRegisters[register1] != null &&
        currentRegisters[register2] != null) {
      var decreasedValue = CommonHelper.convertToIncrementedHex(
        '${currentRegisters[register1]}${currentRegisters[register2]}',
        withIncrement: -1,
      );
      var decreasedValue1 = decreasedValue.substring(0, 2);
      var decreasedValue2 = decreasedValue.substring(2, 4);

      _microInputFieldProvider
        ..setRegister(register1, decreasedValue1)
        ..setRegister(register2, decreasedValue2);
    }
  }

  void execADD(final String address, final MicroOpcode opcode) {
    final currentRegisters = _microInputFieldProviderState.registers;

    var register = MicroRegister.a;

    switch (opcode.name) {
      case MicroOpcodeName.addA:
        register = MicroRegister.a;
        break;
      case MicroOpcodeName.addB:
        register = MicroRegister.b;
        break;
      case MicroOpcodeName.addC:
        register = MicroRegister.c;
        break;
      case MicroOpcodeName.addD:
        register = MicroRegister.d;
        break;
      case MicroOpcodeName.addE:
        register = MicroRegister.e;
        break;
      case MicroOpcodeName.addH:
        register = MicroRegister.h;
        break;
      case MicroOpcodeName.addL:
        register = MicroRegister.l;
        break;
      case MicroOpcodeName.addM:
        register = MicroRegister.m;
        break;
      default:
        register = MicroRegister.a;
    }

    if (currentRegisters[register] != null &&
        currentRegisters[MicroRegister.a] != null) {
      final registerValToDecimal = CommonHelper.convertHexStringToDecimal(
        currentRegisters[register]!,
      );
      var increasedValue = CommonHelper.convertToIncrementedHex(
        currentRegisters[MicroRegister.a]!,
        withIncrement: registerValToDecimal,
        digits: 2,
      );

      _microInputFieldProvider.setRegister(
        MicroRegister.a,
        increasedValue,
      );
    }
  }

  void execRST5(final String address, final MicroOpcode opcode) {
    _microInputFieldProvider.reset();
  }
}
