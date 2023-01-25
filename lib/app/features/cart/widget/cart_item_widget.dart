import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:knotted_donut_tdd/app/core/util/async_value_widget.dart';
import 'package:knotted_donut_tdd/app/features/cart/providers/cart_providers.dart';
import 'package:knotted_donut_tdd/app/features/donut/model/donut_model.dart';
import 'package:knotted_donut_tdd/app/features/donut/widget/counter_button.dart';

class CartItemWidget extends ConsumerWidget {
  const CartItemWidget({super.key, required this.id, required this.amount});
  final String id;
  final int amount;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(itemProvider(id));
    return AsyncValueWidget<DonutModel?>(
        value: item,
        data: (donut) => donut == null
            ? Container()
            : SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  children: [
                    CachedNetworkImage(
                      imageUrl: donut.img,
                      width: 100,
                      height: 100,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 24),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 14,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  donut.title,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(99)),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 22,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CounterButton(
                                      size: 16,
                                      sign: "-",
                                      onPressed: () {},
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    SizedBox(
                                      width: 30,
                                      child: Center(
                                          child: Text(amount.toString())),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    CounterButton(
                                      size: 16,
                                      sign: "+",
                                      onPressed: () {},
                                    ),
                                  ],
                                ),
                                Text(
                                  "${donut.price}원",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ));
  }
}
