import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/core/util/async_value_widget.dart';
import 'package:knotted_donut_tdd/app/features/donut/view/donut_view.dart';
import 'package:knotted_donut_tdd/app/features/store/model/store_model.dart';
import 'package:knotted_donut_tdd/app/features/store/providers/store_provider.dart';
import 'package:knotted_donut_tdd/app/features/store/widget/store_widget.dart';

class StoreSearchView extends ConsumerWidget {
  const StoreSearchView({super.key});
  static const String routeName = "store_search";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stores = ref.watch(getStoresProvider);
    final keyword = ref.watch(storeSearchTextProvider);
    Widget buildStoreList() {
      return AsyncValueWidget<List<StoreModel>>(
          value: stores,
          data: (data) {
            final filterd = keyword == null
                ? data
                : data
                    .where((element) => element.name.contains(keyword))
                    .toList();
            return ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: filterd.length,
                  itemBuilder: (context, index) {
                    return StoreWidget.fromModel(filterd[index], () {
                      ref.read(selectedStoreProvider.notifier).state =
                          data[index];
                      context.goNamed(DonutView.routeName);
                    });
                  },
                ),
              ],
            );
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("매장 검색"),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextField(
                onChanged: (String? value) {
                  ref.read(storeSearchTextProvider.notifier).state = value;
                },
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: "매장명으로 검색",
                    focusColor: Colors.black,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    prefixIconColor: Colors.black),
              ),
            )),
      ),
      body: buildStoreList(),
    );
  }
}
