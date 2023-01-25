import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/core/util/async_value_widget.dart';
import 'package:knotted_donut_tdd/app/features/cart/view/cart_view.dart';
import 'package:knotted_donut_tdd/app/features/donut/model/donut_model.dart';
import 'package:knotted_donut_tdd/app/features/donut/providers/donut_provider.dart';
import 'package:knotted_donut_tdd/app/features/donut/widget/donut_category_chip.dart';
import 'package:knotted_donut_tdd/app/features/donut/widget/donut_list_widget.dart';
import 'package:knotted_donut_tdd/app/features/donut/widget/donut_widget.dart';
import 'package:knotted_donut_tdd/app/features/donut/view/search_view.dart';
import 'package:knotted_donut_tdd/app/features/store/providers/store_provider.dart';
import 'package:knotted_donut_tdd/app/features/store/widget/store_name_widget.dart';

class DonutView extends ConsumerWidget {
  const DonutView({
    super.key,
  });
  static const String routeName = "donut";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final location = ref.read(selectedStoreProvider);
    if (location == null) {
      return const Text("스토어 정보가 없습니다");
    }
    // Get datas from restapi
    final donuts = ref.watch(getDonutProvider);
    // select category
    final selectCategory = ref.watch(donutCategoryProivder);
    // view state
    final isGrid = ref.watch(donutViewProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: StoreNameWidget(
        storeName: location.name,
        trailing: IconButton(
          onPressed: () {
            context.pushNamed(CartView.routeName);
          },
          icon: const Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("주문하기"),
        titleTextStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        iconTheme: const IconThemeData(color: Colors.black),
        actionsIconTheme: const IconThemeData(color: Colors.black),
        leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [
          IconButton(
              onPressed: () {
                context.pushNamed(SearchView.routeName);
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: DonutCategory.values
                    .map((category) => DonutCategoryChip(
                          category: category,
                          isSelected: category == selectCategory,
                          onPressed: () {
                            ref.read(donutCategoryProivder.notifier).state =
                                category;
                          },
                        ))
                    .toList(),
              ),
            ),
            Expanded(
              child: AsyncValueWidget<List<DonutModel>>(
                  value: donuts,
                  data: (data) {
                    final result = data
                        .where((obj) => obj.category == selectCategory)
                        .toList();

                    return ListView(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${result.length}개",
                            style: const TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                          GestureDetector(
                            onTap: () {
                              ref.read(donutViewProvider.notifier).state =
                                  !isGrid;
                            },
                            child: Icon(isGrid ? Icons.grid_on : Icons.list),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      isGrid
                          ? GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: result.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                      childAspectRatio: 1 / 1.7),
                              itemBuilder: (context, index) {
                                return DonutWidget.fromModel(result[index]);
                              })
                          : ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: result.length,
                              itemBuilder: (context, index) {
                                return DonutListWidget.fromModel(result[index]);
                              }),
                    ]);
                  }),
            )
          ],
        ),
      ),
    );
  }
}
