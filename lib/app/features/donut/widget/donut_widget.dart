import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:knotted_donut_tdd/app/features/donut/model/donut_model.dart';
import 'package:knotted_donut_tdd/app/features/donut/view/donut_detail_view.dart';

class DonutWidget extends StatelessWidget {
  const DonutWidget(
      {super.key,
      required this.img,
      required this.title,
      required this.price,
      required this.id});
  final String img;
  final String title;
  final int price;
  final int id;

  factory DonutWidget.fromModel(DonutModel donut) => DonutWidget(
        img: donut.img,
        title: donut.title,
        price: donut.price,
        id: donut.id,
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context
            .goNamed(DonutDetailView.routeName, params: {'id': id.toString()});
      },
      child: Column(
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
      ),
    );
  }
}
