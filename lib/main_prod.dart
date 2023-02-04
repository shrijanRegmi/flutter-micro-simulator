import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/app/app.dart';
import 'package:micro_simulator/app/bootstrap.dart';

import 'app/flavor_types.dart';

void main() {
  Bootstrap(
    builder: () {
      runApp(
        const ProviderScope(
          child: MPApp(flavor: Flavor.prod),
        ),
      );
    },
  );
}
