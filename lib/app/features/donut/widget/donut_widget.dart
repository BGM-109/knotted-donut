import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knotted_donut_tdd/app/features/donut/model/donut_model.dart';

class DonutWidget extends StatelessWidget {
  const DonutWidget(
      {super.key, required this.img, required this.title, required this.price});
  final String img;
  final String title;
  final int price;

  factory DonutWidget.fromModel(DonutModel donut) =>
      DonutWidget(img: donut.img, title: donut.title, price: donut.price);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: img,
          width: 100,
          height: 100,
        ),
        Text(
          title,
          maxLines: 1,
          style: const TextStyle(fontSize: 13),
        ),
        Text(
          "$price 원",
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
        )
      ],
    );
  }
}
