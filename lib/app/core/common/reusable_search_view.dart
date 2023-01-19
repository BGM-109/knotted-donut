import 'package:flutter/material.dart';

class ReusableSearchView extends StatelessWidget {
  const ReusableSearchView(
      {super.key,
      required this.title,
      required this.hindText,
      required this.keyword,
      required this.onChange,
      required this.body});
  final String title;
  final String hindText;
  final String? keyword;
  final void Function(String) onChange;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(48),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: TextField(
                onChanged: onChange,
                decoration: InputDecoration(
                    enabledBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    hintText: hindText,
                    focusColor: Colors.black,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    prefixIconColor: Colors.black),
              ),
            )),
      ),
      body: body,
    );
  }
}
