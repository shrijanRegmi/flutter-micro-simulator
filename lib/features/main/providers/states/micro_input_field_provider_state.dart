import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:micro_simulator/features/main/enums/micro_active_input_type.dart';

part 'micro_input_field_provider_state.freezed.dart';

@freezed
class MicroInputFieldProviderState with _$MicroInputFieldProviderState {
  const factory MicroInputFieldProviderState({
    required final String address,
    required final String value,
    required final MicroActiveInput activeInput,
    required final Map<String, String> addressValuePair,
  }) = _MicroInputFieldProviderState;
}
