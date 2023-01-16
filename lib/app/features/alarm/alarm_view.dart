import 'package:flutter/material.dart';

class AlarmView extends StatelessWidget {
  const AlarmView({super.key});
  static const String routeName = "alarm";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "알림",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              OutlinedButton(
                  onPressed: () {},
                  child: const Text("전체 읽음",
                      style: TextStyle(color: Colors.black)))
            ],
          )
        ],
      ),
    );
  }
}
