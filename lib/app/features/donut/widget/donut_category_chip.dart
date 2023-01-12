import 'package:flutter/material.dart';
import 'package:knotted_donut_tdd/app/features/donut/model/donut_model.dart';

class DonutCategoryChip extends StatelessWidget {
  const DonutCategoryChip({
    Key? key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  }) : super(key: key);
  final DonutCategory category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24),
      child: OutlinedButton(
          style: OutlinedButton.styleFrom(
              backgroundColor: isSelected ? Colors.black : Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22))),
          onPressed: onPressed,
          child: Text(
            category.name,
            style: TextStyle(color: isSelected ? Colors.white : Colors.black),
          )),
    );
  }
}
