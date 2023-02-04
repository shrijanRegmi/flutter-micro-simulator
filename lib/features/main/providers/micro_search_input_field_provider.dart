import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/features/main/providers/micro_input_field_provider.dart';

final providerOfMicroSearchInputField = StateNotifierProvider.autoDispose<
    MicroSearchInputFieldProvider, TextEditingController>((ref) {
  return MicroSearchInputFieldProvider(ref: ref);
});

class MicroSearchInputFieldProvider
    extends StateNotifier<TextEditingController> {
  MicroSearchInputFieldProvider({
    required final Ref ref,
  })  : _ref = ref,
        super(TextEditingController());

  final Ref _ref;
  MicroInputFieldProvider get _microInputFieldProvider =>
      _ref.read(providerOfMicroInputField.notifier);

  void onSubmitSearch() {
    _microInputFieldProvider
      ..resetValue()
      ..setValue(state.text.trim());
  }
}
