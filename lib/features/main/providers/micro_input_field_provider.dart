import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/features/main/enums/micro_active_input_type.dart';
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
            addressValuePair: <String, String>{},
          ),
        );

  void reset() => state = state.copyWith(
        address: '--8085',
        value: 'SR',
        activeInput: MicroActiveInput.unknown,
      );

  void resetAddress() => state = state.copyWith(
        address: '',
      );

  void resetValue() => state = state.copyWith(
        value: '',
      );

  void setAddress(final String address) => state = state.copyWith(
        address: '${state.address}$address',
      );

  void setValue(final String value) => state = state.copyWith(
        value: '${state.value}$value',
      );

  void makeAddressActive() => state = state.copyWith(
        activeInput: MicroActiveInput.address,
        address: '....',
      );

  void makeValueActive() => state = state.copyWith(
        activeInput: MicroActiveInput.value,
        value: '..',
      );

  void saveAddressValue() => state = state.copyWith(
        addressValuePair: Map<String, String>.from(state.addressValuePair)
          ..addAll({state.address: state.value}),
      );
}
