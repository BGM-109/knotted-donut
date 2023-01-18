import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:knotted_donut_tdd/app/features/store/model/store_model.dart';

class StoreWidget extends StatelessWidget {
  const StoreWidget(
      {super.key,
      required this.name,
      required this.address,
      required this.img,
      required this.lat,
      required this.long,
      required this.onTap});
  final String name;
  final String address;
  final String img;
  final double lat;
  final double long;
  final VoidCallback onTap;
  factory StoreWidget.fromModel(StoreModel store, VoidCallback onTap) =>
      StoreWidget(
        name: store.name,
        address: store.address,
        img: store.img,
        lat: store.lat,
        long: store.long,
        onTap: onTap,
      );

  @override
  Widget build(BuildContext context) {
    Widget divider = const SizedBox(
      height: 4,
    );
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.w800, fontSize: 18),
                ),
                divider,
                Text(
                  address,
                  style: const TextStyle(fontSize: 13),
                ),
                divider,
                const Text(
                  "300m",
                  style: TextStyle(color: Colors.red, fontSize: 14),
                )
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(99),
              child: CachedNetworkImage(
                imageUrl: img,
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
      ),
    );
  }
}
