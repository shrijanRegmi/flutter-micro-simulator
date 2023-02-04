import 'package:freezed_annotation/freezed_annotation.dart';

part 'micro_input_field_provider_state.freezed.dart';

@freezed
class MicroInputFieldProviderState with _$MicroInputFieldProviderState {
  const factory MicroInputFieldProviderState({
    required final String address,
    required final String value,
  }) = _MicroInputFieldProviderState;
}
