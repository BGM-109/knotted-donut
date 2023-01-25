import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/core/common/styled_bottom_button.dart';
import 'package:knotted_donut_tdd/app/core/util/async_value_widget.dart';
import 'package:knotted_donut_tdd/app/features/cart/model/cart_model.dart';
import 'package:knotted_donut_tdd/app/features/cart/providers/cart_providers.dart';
import 'package:knotted_donut_tdd/app/features/cart/widget/cart_item_widget.dart';
import 'package:knotted_donut_tdd/app/features/cart/widget/total_price_widget.dart';
import 'package:knotted_donut_tdd/app/features/store/providers/store_provider.dart';
import 'package:knotted_donut_tdd/app/features/store/widget/store_name_widget.dart';

class CartView extends ConsumerWidget {
  const CartView({super.key});
  static const String routeName = "cart";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(selectedStoreProvider);
    if (store == null) {
      return const Text("가게 정보가 없습니다");
    }

    final cart = ref.watch(cartProvider);
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
        body: AsyncValueWidget<CartModel>(
            value: cart,
            data: (data) => CartListBuilder(
                  storeName: data.storeName,
                  totalPriceWidget: const TotalPriceWidget(
                    totalPrice: 3000,
                  ),
                  items: data.items,
                  itemBuilder: (context, index) {
                    return CartItemWidget(
                        id: data.items.keys.toList()[index],
                        amount: data.items.values.toList()[index]);
                  },
                )));
  }
}

class CartListBuilder extends StatelessWidget {
  const CartListBuilder(
      {super.key,
      required this.items,
      required this.storeName,
      required this.itemBuilder,
      required this.totalPriceWidget});
  final Map<String, int> items;
  final String storeName;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget totalPriceWidget;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 60,
            child: StoreNameWidget(storeName: storeName, trailing: null)),
        Expanded(
          child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              children: [
                const Text(
                  "주문 상품",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                items.isEmpty
                    ? const Text("상품이 없습니다.")
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: items.entries.length,
                        itemBuilder: itemBuilder,
                      ),
                const SizedBox(
                  height: 24,
                ),
                totalPriceWidget
              ]),
        )
      ],
    );
  }
}
