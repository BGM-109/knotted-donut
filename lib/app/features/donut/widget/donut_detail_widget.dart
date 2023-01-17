import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knotted_donut_tdd/app/features/donut/model/donut_model.dart';

class DonutDetailWidget extends StatelessWidget {
  const DonutDetailWidget(
      {super.key,
      required this.img,
      required this.title,
      required this.description,
      required this.id,
      required this.price,
      required this.child});
  final String img;
  final String title;
  final String description;
  final int id;
  final int price;
  final Widget child;

  factory DonutDetailWidget.fromModel(DonutModel donut, Widget child) =>
      DonutDetailWidget(
        description: donut.description,
        img: donut.img,
        id: donut.id,
        title: donut.title,
        price: donut.price,
        child: child,
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImage(
          imageUrl: img,
          width: 150,
          height: 150,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
            width: 220,
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 40),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              child,
              Text(
                "$price원",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )
            ],
          ),
        )
      ],
    );
  }
}
