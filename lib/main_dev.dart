import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/app/app.dart';
import 'package:micro_simulator/app/bootstrap.dart';
import 'package:micro_simulator/app/flavor_types.dart';
import 'package:micro_simulator/app/providers/flavor_provider.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  Bootstrap(
    builder: () {
      runApp(
        ProviderScope(
          overrides: [
            providerOfFlavor.overrideWith(
              (ref) => FlavorProvider(Flavor.dev),
            )
          ],
          child: DevicePreview(
            enabled: false,
            builder: (context) {
              return const MPApp(flavor: Flavor.dev);
            },
          ),
        ),
      );
    },
  );
}
