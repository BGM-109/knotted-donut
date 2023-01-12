import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knotted_donut_tdd/app/features/donut/model/donut_model.dart';

class DonutListWidget extends StatelessWidget {
  const DonutListWidget(
      {super.key, required this.img, required this.title, required this.price});
  final String img;
  final String title;
  final int price;

  factory DonutListWidget.fromModel(DonutModel donut) =>
      DonutListWidget(img: donut.img, title: donut.title, price: donut.price);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImage(
          imageUrl: img,
          width: 100,
          height: 100,
        ),
        const SizedBox(
          width: 24,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              maxLines: 1,
              style: const TextStyle(fontSize: 13),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              "$price 원",
              style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
            )
          ],
        )
      ],
    );
  }
}
