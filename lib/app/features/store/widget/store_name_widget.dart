import 'package:flutter/material.dart';

class StoreNameWidget extends StatelessWidget {
  const StoreNameWidget(
      {super.key, required this.storeName, required this.trailing});
  final String storeName;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: const BoxDecoration(color: Color(0xffF4B2FF)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$storeName점",
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600)),
          trailing ?? Container()
        ],
      ),
    );
  }
}
