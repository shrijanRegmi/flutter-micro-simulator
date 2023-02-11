import 'package:hooks_riverpod/hooks_riverpod.dart';

final providerOfMicroSearchInputField =
    StateNotifierProvider.autoDispose<MicroSearchInputFieldProvider, String>(
        (ref) {
  return MicroSearchInputFieldProvider();
});

class MicroSearchInputFieldProvider extends StateNotifier<String> {
  MicroSearchInputFieldProvider() : super('');

  void onChanged(final String val) => state = val;

  void reset() => state = '';
}
