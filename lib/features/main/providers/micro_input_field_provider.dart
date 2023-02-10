import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/features/main/enums/micro_active_input_type.dart';
import 'package:micro_simulator/features/main/enums/micro_key_action_type.dart';
import 'package:micro_simulator/features/main/enums/micro_register_type.dart';
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
            lastOperatorKeyAction: MicroKeyAction.unknown,
            lastShownRegister: MicroRegister.unknown,
          ),
        );

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
        registers: <MicroRegister, String>{},
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

  void makeValueActive() => state = state.copyWith(
        activeInput: MicroActiveInput.value,
        value: '..',
      );

  void saveToBeforeExecution() => state = state.copyWith(
        beforeExecution: Map<String, String>.from(state.beforeExecution)
          ..addAll({state.address: state.value}),
      );

  void saveToAfterExecution() => state = state.copyWith(
        afterExecution: Map<String, String>.from(state.beforeExecution)
          ..addAll({state.address: state.value}),
      );

  void setAfterExecution() => state = state.copyWith(
        afterExecution: Map<String, String>.from(state.beforeExecution)
          ..addAll({state.address: state.value}),
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
}
