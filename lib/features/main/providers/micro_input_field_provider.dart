import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/features/main/enums/micro_active_input_type.dart';
import 'package:micro_simulator/features/main/enums/micro_key_action_type.dart';
import 'package:micro_simulator/features/main/enums/micro_register_type.dart';
import 'package:micro_simulator/features/main/helpers/common_helper.dart';
import 'package:micro_simulator/features/main/models/micro_opcode_model.dart';
import 'package:micro_simulator/features/main/providers/states/micro_input_field_provider_state.dart';

final providerOfMicroInputField = StateNotifierProvider<MicroInputFieldProvider,
    MicroInputFieldProviderState>((ref) {
  return MicroInputFieldProvider();
});

class MicroInputFieldProvider
    extends StateNotifier<MicroInputFieldProviderState> {
  MicroInputFieldProvider()
      : super(
          const MicroInputFieldProviderState(
            address: '--8085',
            value: 'SR',
            activeInput: MicroActiveInput.unknown,
            beforeExecution: <String, String>{},
            afterExecution: <String, String>{},
            registers: <MicroRegister, String>{},
            initialRegisters: <MicroRegister, String>{},
            lastOperatorKeyAction: MicroKeyAction.unknown,
            lastShownRegister: MicroRegister.unknown,
          ),
        ) {
    _initializeRegisters();
  }

  void reset() => state = state.copyWith(
        address: '--8085',
        value: 'SR',
        activeInput: MicroActiveInput.unknown,
        lastOperatorKeyAction: MicroKeyAction.unknown,
      );

  void resetAddress() => state = state.copyWith(
        address: '',
      );

  void resetValue() => state = state.copyWith(
        value: '',
      );

  void resetRegisters() => state = state.copyWith(
        registers: state.initialRegisters,
      );

  void setAddress(final String address) => state = state.copyWith(
        address: '${state.address}$address',
      );

  void setValue(final String value) => state = state.copyWith(
        value: '${state.value}$value',
      );

  void setLastOperatorKeyAction(final MicroKeyAction keyAction) =>
      state = state.copyWith(
        lastOperatorKeyAction: keyAction,
      );

  void setLastShownRegister(final MicroRegister register) =>
      state = state.copyWith(
        lastShownRegister: register,
      );

  void makeAddressActive() => state = state.copyWith(
        activeInput: MicroActiveInput.address,
        address: '....',
      );

  void makeAddressValueActive() => state = state.copyWith(
        activeInput: MicroActiveInput.value,
      );

  void makeRegisterValueActive() => state = state.copyWith(
        activeInput: MicroActiveInput.value,
        value: getRandomOpcodeForRegister(),
      );

  void saveToBeforeExecution() => state = state.copyWith(
        beforeExecution: Map<String, String>.from(state.beforeExecution)
          ..addAll({state.address: state.value}),
      );

  void saveToAfterExecution() => state = state.copyWith(
        afterExecution: Map<String, String>.from(state.beforeExecution)
          ..addAll({state.address: state.value}),
      );

  void setBeforeExecution(final String address, final String value) =>
      state = state.copyWith(
        beforeExecution: Map<String, String>.from(state.beforeExecution)
          ..addAll({address: value}),
      );

  void setAfterExecution(final String address, final String value) =>
      state = state.copyWith(
        afterExecution: Map<String, String>.from(state.afterExecution)
          ..addAll({address: value}),
      );

  void setRegister(final MicroRegister register, final String value) =>
      state = state.copyWith(
        registers: Map<MicroRegister, String>.from(state.registers)
          ..addAll({register: value}),
      );

  MicroOpcode findOpcode(final String value) {
    final opcode = kMicroOpcodes.firstWhere(
      (element) => element.machineCode == value,
      orElse: MicroOpcode.unknown,
    );
    return opcode;
  }

  String getRandomOpcodeForAddress({final String? address}) {
    final currentBeforeExecution = state.beforeExecution;

    final rand = Random().nextInt(100);
    String value = CommonHelper.convertToIncrementedHex(
      rand.toRadixString(16),
      withIncrement: 0,
      digits: 2,
    );
    var alreadyPresent = currentBeforeExecution.entries
        .where((element) => element.value == value)
        .toList()
        .isNotEmpty;

    while (alreadyPresent) {
      final rand = Random().nextInt(100);
      value = CommonHelper.convertToIncrementedHex(
        rand.toRadixString(16),
        withIncrement: 0,
        digits: 2,
      );
      alreadyPresent = currentBeforeExecution.entries
          .where((element) => element.value == value)
          .toList()
          .isNotEmpty;
    }
    if (address != null) {
      setBeforeExecution(address, value);
    }
    return value;
  }

  String getRandomOpcodeForRegister({final MicroRegister? register}) {
    final currentRegisters = state.registers;

    final rand = Random().nextInt(100);
    String value = CommonHelper.convertToIncrementedHex(
      rand.toRadixString(16),
      withIncrement: 0,
      digits: 2,
    );
    var alreadyPresent = currentRegisters.entries
        .where((element) => element.value == value)
        .toList()
        .isNotEmpty;

    while (alreadyPresent) {
      final rand = Random().nextInt(100);
      value = CommonHelper.convertToIncrementedHex(
        rand.toRadixString(16),
        withIncrement: 0,
        digits: 2,
      );
      alreadyPresent = currentRegisters.entries
          .where((element) => element.value == value)
          .toList()
          .isNotEmpty;
    }
    if (register != null) {
      setRegister(register, value);
    }
    return value;
  }

  void _initializeRegisters() {
    for (final register in MicroRegister.values) {
      final rand = getRandomOpcodeForRegister();
      state = state.copyWith(
        initialRegisters:
            Map<MicroRegister, String>.from(state.initialRegisters)
              ..addAll({register: rand}),
        registers: Map<MicroRegister, String>.from(state.registers)
          ..addAll({register: rand}),
      );
    }
  }
}
