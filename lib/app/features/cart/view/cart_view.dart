import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/core/common/styled_bottom_button.dart';
import 'package:knotted_donut_tdd/app/features/store/providers/store_provider.dart';
import 'package:knotted_donut_tdd/app/features/store/widget/store_name_widget.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});
  static const String routeName = "cart";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(selectedStoreProvider);
    if (store == null) {
      return const Text("가게 저옵가 없습니다");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("주문하기"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24.0),
        child: StyledBottomButton(
          onPressed: () {},
          text: "주문하기",
          child: null,
        ),
      ),
      body: Column(
        children: [
          StoreNameWidget(storeName: store.name, trailing: null),
          const Center(child: Text("cart")),
        ],
      ),
    );
  }
}
