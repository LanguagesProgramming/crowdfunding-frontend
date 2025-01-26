import 'package:flutter/material.dart';

class Category {
  String label;
  bool isSelected;

  Category({
    required this.label,
    required this.isSelected,
  });
}

class CategoryComponent extends StatelessWidget {
  final String label;
  final bool isSelected;
  final Function() onTap;

  const CategoryComponent({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFFC8C8C8) : Colors.white,
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: Color(0xFFC8C8C8),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
