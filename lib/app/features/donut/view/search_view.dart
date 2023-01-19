import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/core/common/reusable_search_view.dart';
import 'package:knotted_donut_tdd/app/core/util/async_value_widget.dart';
import 'package:knotted_donut_tdd/app/features/donut/model/donut_model.dart';
import 'package:knotted_donut_tdd/app/features/donut/providers/donut_provider.dart';
import 'package:knotted_donut_tdd/app/features/donut/widget/donut_list_widget.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});
  static const String routeName = "search";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final donuts = ref.watch(getDonutProvider);
    final keyword = ref.watch(productSearchTextProvider);
    return ReusableSearchView(
      title: "제품검색",
      hindText: "제품명으로 검색",
      keyword: keyword,
      onChange: (String? value) {
        ref.read(productSearchTextProvider.notifier).state = value;
      },
      body: AsyncValueWidget<List<DonutModel>>(
        value: donuts,
        data: (data) {
          final filterd = keyword == null
              ? data
              : data
                  .where((element) => element.title.contains(keyword))
                  .toList();
          return filterd.isEmpty
              ? const Center(
                  child: Text("검색 결과가 없습니다"),
                )
              : ListView.builder(
                  itemCount: filterd.length,
                  itemBuilder: (context, index) {
                    return DonutListWidget.fromModel(
                      filterd[index],
                    );
                  },
                );
        },
      ),
    );
  }
}
