import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/core/util/async_value_widget.dart';
import 'package:knotted_donut_tdd/app/features/donut/view/donut_view.dart';
import 'package:knotted_donut_tdd/app/features/store/model/store_model.dart';
import 'package:knotted_donut_tdd/app/features/store/providers/store_provider.dart';
import 'package:knotted_donut_tdd/app/features/store/view/store_search_view.dart';
import 'package:knotted_donut_tdd/app/features/store/widget/store_widget.dart';

class StoreView extends ConsumerWidget {
  const StoreView({super.key});
  static const String routeName = "store";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stores = ref.watch(getStoresProvider);
    Widget buildStoreList() {
      return AsyncValueWidget<List<StoreModel>>(
          value: stores,
          data: (data) => ListView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                children: [
                  Text("내 주변에 ${data.length}개의 매장이 있습니다."),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return StoreWidget.fromModel(data[index], () {
                        ref.read(selectedStoreProvider.notifier).state =
                            data[index];
                        context.goNamed(DonutView.routeName);
                      });
                    },
                  ),
                ],
              ));
    }

    Widget buildStoreListMap() {
      return const Center(child: Text("지도로 선택"));
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: Stack(
              children: const [
                Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      indicatorSize: TabBarIndicatorSize.label,
                      splashFactory: NoSplash.splashFactory,
                      labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      unselectedLabelStyle:
                          TextStyle(fontWeight: FontWeight.normal),
                      labelColor: Colors.black,
                      indicatorColor: Colors.black,
                      isScrollable: true,
                      tabs: [
                        Tab(text: "리스트로 선택"),
                        Tab(text: "지도로 선택"),
                      ]),
                ),
              ],
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  context.goNamed(StoreSearchView.routeName);
                },
                icon: const Icon(Icons.search))
          ],
          title: const Text(
            "매장 선택",
          ),
        ),
        body: TabBarView(
          children: [buildStoreList(), buildStoreListMap()],
        ),
      ),
    );
  }
}
