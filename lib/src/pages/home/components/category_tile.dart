import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  const CategoryTile({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onPressed,
  });

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected ? Colors.deepPurpleAccent : Colors.transparent,
          ),
          child: Text(
            category,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.deepPurpleAccent,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
