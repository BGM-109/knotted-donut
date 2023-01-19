import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/core/common/styled_bottom_button.dart';
import 'package:knotted_donut_tdd/app/core/util/async_value_widget.dart';
import 'package:knotted_donut_tdd/app/features/cart/providers/cart_controller.dart';
import 'package:knotted_donut_tdd/app/features/cart/view/cart_view.dart';
import 'package:knotted_donut_tdd/app/features/cart/widget/add_to_cart_button.dart';
import 'package:knotted_donut_tdd/app/features/checkout/view/checkout_view.dart';
import 'package:knotted_donut_tdd/app/features/donut/model/donut_model.dart';
import 'package:knotted_donut_tdd/app/features/donut/providers/donut_provider.dart';
import 'package:knotted_donut_tdd/app/features/donut/widget/counter_button.dart';
import 'package:knotted_donut_tdd/app/features/donut/widget/donut_detail_widget.dart';

class DonutDetailView extends ConsumerWidget {
  const DonutDetailView({super.key, required this.id});
  static const String routeName = "detail";

  final String? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (id == null) {
      return const Text("잘못된 접근입니다.");
    }
    final detail = ref.watch(getDonutDetailProvider(id: id!));
    final counter = ref.watch(detailCountProivder);
    final controller = ref.watch(cartControllerProvider);
    ref.listen<AsyncValue>((cartControllerProvider), (_, state) {
      state.whenOrNull(
        error: ((error, stackTrace) => ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(error.toString())))),
      );
    });
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        actionsIconTheme: const IconThemeData(
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {
                context.pushNamed(CartView.routeName);
              },
              icon: const Icon(Icons.shopping_cart_outlined)),
        ],
      ),
      body: Center(
        child: AsyncValueWidget<DonutModel>(
            value: detail,
            data: (data) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DonutDetailWidget.fromModel(
                          data,
                          Row(
                            children: [
                              Row(
                                children: [
                                  CounterButton(
                                    onPressed: () {
                                      if (counter <= 1) return;
                                      ref
                                          .read(detailCountProivder.notifier)
                                          .state = counter - 1;
                                    },
                                    sign: "-",
                                  ),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  SizedBox(
                                      width: 30,
                                      child: Center(
                                          child: Text(counter.toString()))),
                                  const SizedBox(
                                    width: 12,
                                  ),
                                  CounterButton(
                                      onPressed: () {
                                        ref
                                            .read(detailCountProivder.notifier)
                                            .state = counter + 1;
                                      },
                                      sign: "+"),
                                ],
                              ),
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "상품 금액",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "${data.price * counter}원",
                            style: const TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )
                        ],
                      )
                    ],
                  ),
                )),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: AddToCartButton(
                  onPressed: () {
                    if (controller.isLoading) return;
                    ref.read(cartControllerProvider.notifier).addItem(id!);
                  },
                  isLoading: controller.isLoading,
                  productId: id!,
                )),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              flex: 1,
              child: StyledBottomButton(
                onPressed: () {
                  context.pushNamed(CheckOutView.routeName);
                },
                child: const Text(
                  "바로주문",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
