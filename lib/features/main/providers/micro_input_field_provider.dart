import 'package:hooks_riverpod/hooks_riverpod.dart';
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
            address: '',
            value: '',
          ),
        );

  void reset() => state = state.copyWith(
        address: '',
        value: '',
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
}
