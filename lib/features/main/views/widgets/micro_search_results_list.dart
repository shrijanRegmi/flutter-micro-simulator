import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:micro_simulator/app/extensions/string_extension.dart';
import 'package:micro_simulator/app/extensions/widget_extension.dart';
import 'package:micro_simulator/features/main/models/micro_opcode_model.dart';
import 'package:micro_simulator/features/main/providers/micro_search_input_field_provider.dart';
import 'package:micro_simulator/features/main/views/widgets/micro_search_results_list_item.dart';

class MicroSearchResultsList extends HookConsumerWidget {
  const MicroSearchResultsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchText = ref.watch(providerOfMicroSearchInputField);

    final searchResults = kMicroOpcodes
        .where((element) => element.name.matchForSearch(searchText))
        .toList();

    return SizedBox(
      height: 40.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          final searchResult = searchResults[index];

          return MicroSearchResultsListItem(
            searchResult: searchResult,
          )
              .pL(index == 0 ? 20 : 0)
              .pR(index == searchResults.length - 1 ? 20 : 0);
        },
      ),
    );
  }
}
