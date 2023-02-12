import 'dart:collection';

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

  void onPressedBtn(final MicroKeyAction keyAction) {
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

  // <---- main execution code lies here ----> //
  void execOpcodes() {
    final currentBeforeExecution = SplayTreeMap<String, String>.from(
        _microInputFieldProviderState.beforeExecution);

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

        if (opcode.category == MicroOpcodeCategory.unknown) {
          continue;
        }

        if (opcode.category == MicroOpcodeCategory.rst) {
          execRST5(address, opcode);
          break;
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
          case MicroOpcodeCategory.adi:
            execADI(address, opcode);
            break;
          case MicroOpcodeCategory.sub:
            execSUB(address, opcode);
            break;
          case MicroOpcodeCategory.sui:
            execSUI(address, opcode);
            break;
          case MicroOpcodeCategory.lda:
            execLDA(address, opcode);
            break;
          case MicroOpcodeCategory.ldax:
            execLDAX(address, opcode);
            break;
          case MicroOpcodeCategory.sta:
            execSTA(address, opcode);
            break;
          case MicroOpcodeCategory.stax:
            execSTAX(address, opcode);
            break;
          case MicroOpcodeCategory.rst:
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

    final contentOfAddress = currentBeforeExecution[nextAddress] ??
        _microInputFieldProvider.getRandomOpcodeForAddress(
          address: nextAddress,
        );

    _microInputFieldProvider.setRegister(
      register,
      contentOfAddress,
    );
  }

  void execLXI(final String address, final MicroOpcode opcode) {
    final currentBeforeExecution =
        _microInputFieldProviderState.beforeExecution;

    var msbRegister = MicroRegister.unknown;
    var lsbRegister = MicroRegister.unknown;

    switch (opcode.name) {
      case MicroOpcodeName.lxiB:
        msbRegister = MicroRegister.b;
        lsbRegister = MicroRegister.c;
        break;
      case MicroOpcodeName.lxiD:
        msbRegister = MicroRegister.d;
        lsbRegister = MicroRegister.e;
        break;
      case MicroOpcodeName.lxiH:
        msbRegister = MicroRegister.h;
        lsbRegister = MicroRegister.l;
        break;
      default:
        msbRegister = MicroRegister.unknown;
        lsbRegister = MicroRegister.unknown;
    }

    final nextAddress1 = CommonHelper.convertToIncrementedHex(
      address,
      withIncrement: 1,
    );

    final nextAddress2 = CommonHelper.convertToIncrementedHex(
      nextAddress1,
      withIncrement: 1,
    );

    final contentOfNextAddress1 = currentBeforeExecution[nextAddress1] ??
        _microInputFieldProvider.getRandomOpcodeForAddress(
          address: nextAddress1,
        );

    final contentOfNextAddress2 = currentBeforeExecution[nextAddress2] ??
        _microInputFieldProvider.getRandomOpcodeForAddress(
          address: nextAddress2,
        );

    _microInputFieldProvider
      ..setRegister(
        msbRegister,
        contentOfNextAddress2,
      )
      ..setRegister(
        lsbRegister,
        contentOfNextAddress1,
      );
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

    final contentOfRegister = currentRegisters[register] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: register,
        );

    var increasedValue = CommonHelper.convertToIncrementedHex(
      contentOfRegister,
      withIncrement: 1,
      digits: 2,
    );

    _microInputFieldProvider.setRegister(
      register,
      increasedValue,
    );
  }

  void execINX(final String address, final MicroOpcode opcode) {
    final currentRegisters = _microInputFieldProviderState.registers;

    var msbRegister = MicroRegister.unknown;
    var lsbRegister = MicroRegister.unknown;

    switch (opcode.name) {
      case MicroOpcodeName.inxB:
        msbRegister = MicroRegister.b;
        lsbRegister = MicroRegister.c;
        break;
      case MicroOpcodeName.inxD:
        msbRegister = MicroRegister.d;
        lsbRegister = MicroRegister.e;
        break;
      case MicroOpcodeName.inxH:
        msbRegister = MicroRegister.h;
        lsbRegister = MicroRegister.l;
        break;

      default:
        msbRegister = MicroRegister.unknown;
        lsbRegister = MicroRegister.unknown;
    }

    final contentOfMsbRegister = currentRegisters[msbRegister] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: msbRegister,
        );

    final contentOfLsbRegister = currentRegisters[lsbRegister] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: lsbRegister,
        );

    var increasedValue = CommonHelper.convertToIncrementedHex(
      '${currentRegisters[contentOfMsbRegister]}${currentRegisters[contentOfLsbRegister]}',
      withIncrement: 1,
    );
    var increasedValueMsb = increasedValue.substring(0, 2);
    var increasedValueLsb = increasedValue.substring(2, 4);

    _microInputFieldProvider
      ..setRegister(msbRegister, increasedValueMsb)
      ..setRegister(lsbRegister, increasedValueLsb);
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

    final contentOfRegister = currentRegisters[register] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(register: register);

    var decreasedValue = CommonHelper.convertToIncrementedHex(
      contentOfRegister,
      withIncrement: -1,
      digits: 2,
    );

    _microInputFieldProvider.setRegister(
      register,
      decreasedValue,
    );
  }

  void execDCX(final String address, final MicroOpcode opcode) {
    final currentRegisters = _microInputFieldProviderState.registers;

    var msbRegister = MicroRegister.unknown;
    var lsbRegister = MicroRegister.unknown;

    switch (opcode.name) {
      case MicroOpcodeName.inxB:
        msbRegister = MicroRegister.b;
        lsbRegister = MicroRegister.c;
        break;
      case MicroOpcodeName.inxD:
        msbRegister = MicroRegister.d;
        lsbRegister = MicroRegister.e;
        break;
      case MicroOpcodeName.inxH:
        msbRegister = MicroRegister.h;
        lsbRegister = MicroRegister.l;
        break;

      default:
        msbRegister = MicroRegister.unknown;
        lsbRegister = MicroRegister.unknown;
    }

    final contentOfMsbRegister = currentRegisters[msbRegister] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: msbRegister,
        );

    final contentOfLsbRegister = currentRegisters[lsbRegister] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: lsbRegister,
        );

    var decreasedValue = CommonHelper.convertToIncrementedHex(
      '${currentRegisters[contentOfMsbRegister]}${currentRegisters[contentOfLsbRegister]}',
      withIncrement: -1,
    );
    var decreasedValue1 = decreasedValue.substring(0, 2);
    var decreasedValue2 = decreasedValue.substring(2, 4);

    _microInputFieldProvider
      ..setRegister(msbRegister, decreasedValue1)
      ..setRegister(lsbRegister, decreasedValue2);
  }

  void execADD(final String address, final MicroOpcode opcode) {
    final currentRegisters = _microInputFieldProviderState.registers;

    var register = MicroRegister.unknown;

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
        register = MicroRegister.unknown;
    }

    final contentOfRegister = currentRegisters[register] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: register,
        );

    final contentOfRegisterA = currentRegisters[MicroRegister.a] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: MicroRegister.a,
        );

    final registerValToDecimal = CommonHelper.convertHexStringToDecimal(
      contentOfRegister,
    );

    var increasedValue = CommonHelper.convertToIncrementedHex(
      contentOfRegisterA,
      withIncrement: registerValToDecimal,
      digits: 2,
    );

    _microInputFieldProvider.setRegister(
      MicroRegister.a,
      increasedValue,
    );
  }

  void execADI(final String address, final MicroOpcode opcode) {
    final currentRegisters = _microInputFieldProviderState.registers;
    final currentBeforeExecution =
        _microInputFieldProviderState.beforeExecution;

    final nextAddress = CommonHelper.convertToIncrementedHex(
      address,
      withIncrement: 1,
    );

    final contentOfAddress = currentBeforeExecution[nextAddress] ??
        _microInputFieldProvider.getRandomOpcodeForAddress(
          address: nextAddress,
        );

    final contentOfRegisterA = currentRegisters[MicroRegister.a] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: MicroRegister.a,
        );

    final addressValToDecimal = CommonHelper.convertHexStringToDecimal(
      contentOfAddress,
    );

    var increasedValue = CommonHelper.convertToIncrementedHex(
      contentOfRegisterA,
      withIncrement: addressValToDecimal,
      digits: 2,
    );

    _microInputFieldProvider.setRegister(
      MicroRegister.a,
      increasedValue,
    );
  }

  void execSUB(final String address, final MicroOpcode opcode) {
    final currentRegisters = _microInputFieldProviderState.registers;

    var register = MicroRegister.unknown;

    switch (opcode.name) {
      case MicroOpcodeName.subA:
        register = MicroRegister.a;
        break;
      case MicroOpcodeName.subB:
        register = MicroRegister.b;
        break;
      case MicroOpcodeName.subC:
        register = MicroRegister.c;
        break;
      case MicroOpcodeName.subD:
        register = MicroRegister.d;
        break;
      case MicroOpcodeName.subE:
        register = MicroRegister.e;
        break;
      case MicroOpcodeName.subH:
        register = MicroRegister.h;
        break;
      case MicroOpcodeName.subL:
        register = MicroRegister.l;
        break;
      case MicroOpcodeName.subM:
        register = MicroRegister.m;
        break;
      default:
        register = MicroRegister.unknown;
    }

    final contentOfRegister = currentRegisters[register] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: register,
        );

    final contentOfRegisterA = currentRegisters[MicroRegister.a] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: MicroRegister.a,
        );

    final registerValToDecimal = CommonHelper.convertHexStringToDecimal(
      contentOfRegister,
    );

    var decreasedValue = CommonHelper.convertToIncrementedHex(
      contentOfRegisterA,
      withIncrement: -registerValToDecimal,
      digits: 2,
    );

    _microInputFieldProvider.setRegister(
      MicroRegister.a,
      decreasedValue,
    );
  }

  void execSUI(final String address, final MicroOpcode opcode) {
    final currentRegisters = _microInputFieldProviderState.registers;
    final currentBeforeExecution =
        _microInputFieldProviderState.beforeExecution;

    final nextAddress = CommonHelper.convertToIncrementedHex(
      address,
      withIncrement: 1,
    );

    final contentOfAddress = currentBeforeExecution[nextAddress] ??
        _microInputFieldProvider.getRandomOpcodeForAddress(
          address: nextAddress,
        );

    final contentOfRegisterA = currentRegisters[MicroRegister.a] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: MicroRegister.a,
        );

    final addressValToDecimal = CommonHelper.convertHexStringToDecimal(
      contentOfAddress,
    );

    var decreasedValue = CommonHelper.convertToIncrementedHex(
      contentOfRegisterA,
      withIncrement: -addressValToDecimal,
      digits: 2,
    );

    _microInputFieldProvider.setRegister(
      MicroRegister.a,
      decreasedValue,
    );
  }

  void execLDA(final String address, final MicroOpcode opcode) {
    final currentBeforeExecution =
        _microInputFieldProviderState.beforeExecution;

    final lsbAddress = CommonHelper.convertToIncrementedHex(
      address,
      withIncrement: 1,
    );

    final msbAddress = CommonHelper.convertToIncrementedHex(
      lsbAddress,
      withIncrement: 1,
    );

    final contentOfLsbAddress = currentBeforeExecution[lsbAddress] ??
        _microInputFieldProvider.getRandomOpcodeForAddress(
          address: lsbAddress,
        );

    final contentOfMsbAddress = currentBeforeExecution[msbAddress] ??
        _microInputFieldProvider.getRandomOpcodeForAddress(
          address: msbAddress,
        );

    final requiredAddress = '$contentOfMsbAddress$contentOfLsbAddress';

    final contentOfAddress = currentBeforeExecution[requiredAddress] ??
        _microInputFieldProvider.getRandomOpcodeForAddress(
          address: requiredAddress,
        );

    _microInputFieldProvider.setRegister(
      MicroRegister.a,
      contentOfAddress,
    );
  }

  void execLDAX(final String address, final MicroOpcode opcode) {
    final currentBeforeExecution =
        _microInputFieldProviderState.beforeExecution;
    final currentRegisters = _microInputFieldProviderState.registers;

    var msbRegister = MicroRegister.unknown;
    var lsbRegister = MicroRegister.unknown;

    switch (opcode.name) {
      case MicroOpcodeName.ldaxB:
        msbRegister = MicroRegister.b;
        lsbRegister = MicroRegister.c;
        break;
      case MicroOpcodeName.ldaxD:
        msbRegister = MicroRegister.d;
        lsbRegister = MicroRegister.e;
        break;
    }

    final contentOfMsbRegister = currentRegisters[msbRegister] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: msbRegister,
        );

    final contentOfLsbRegister = currentRegisters[lsbRegister] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: lsbRegister,
        );

    final requiredAddress = '$contentOfMsbRegister$contentOfLsbRegister';

    final contentOfAddress = currentBeforeExecution[requiredAddress] ??
        _microInputFieldProvider.getRandomOpcodeForAddress(
          address: requiredAddress,
        );

    _microInputFieldProvider.setRegister(
      MicroRegister.a,
      contentOfAddress,
    );
  }

  void execSTA(final String address, final MicroOpcode opcode) {
    final currentRegisters = _microInputFieldProviderState.registers;
    final currentBeforeExecution =
        _microInputFieldProviderState.beforeExecution;

    final nextAddress1 = CommonHelper.convertToIncrementedHex(
      address,
      withIncrement: 1,
    );

    final nextAddress2 = CommonHelper.convertToIncrementedHex(
      nextAddress1,
      withIncrement: 1,
    );

    final contentOfNextAddress1 = currentBeforeExecution[nextAddress1] ??
        _microInputFieldProvider.getRandomOpcodeForAddress(
          address: nextAddress1,
        );

    final contentOfNextAddress2 = currentBeforeExecution[nextAddress2] ??
        _microInputFieldProvider.getRandomOpcodeForAddress(
          address: nextAddress2,
        );

    final contentOfRegisterA = currentRegisters[MicroRegister.a] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: MicroRegister.a,
        );

    final requiredAddress = '$contentOfNextAddress2$contentOfNextAddress1';

    _microInputFieldProvider.setBeforeExecution(
      requiredAddress,
      contentOfRegisterA,
    );
  }

  void execSTAX(final String address, final MicroOpcode opcode) {
    final currentRegisters = _microInputFieldProviderState.registers;

    var msbRegister = MicroRegister.unknown;
    var lsbRegister = MicroRegister.unknown;

    switch (opcode.name) {
      case MicroOpcodeName.staxB:
        msbRegister = MicroRegister.b;
        lsbRegister = MicroRegister.c;
        break;
      case MicroOpcodeName.staxD:
        msbRegister = MicroRegister.d;
        lsbRegister = MicroRegister.e;
        break;
    }

    final contentOfMsbRegister = currentRegisters[msbRegister] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: msbRegister,
        );

    final contentOfLsbRegister = currentRegisters[lsbRegister] ??
        _microInputFieldProvider.getRandomOpcodeForRegister(
          register: lsbRegister,
        );

    final requiredAddress = '$contentOfMsbRegister$contentOfLsbRegister';

    final contentOfRegisterA = currentRegisters[MicroRegister.a] ??
        _microInputFieldProvider.getRandomOpcodeForAddress(
          address: requiredAddress,
        );

    _microInputFieldProvider.setBeforeExecution(
      requiredAddress,
      contentOfRegisterA,
    );
  }

  void execRST5(final String address, final MicroOpcode opcode) {
    _microInputFieldProvider.reset();
  }
}
