import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/app/flavor_types.dart';

final providerOfFlavor = StateNotifierProvider<FlavorProvider, Flavor>((ref) {
  return FlavorProvider(Flavor.prod);
});

class FlavorProvider extends StateNotifier<Flavor> {
  FlavorProvider(super.state);

  void updateFlavor({
    required final Flavor flavor,
  }) {
    state = flavor;
  }
}
