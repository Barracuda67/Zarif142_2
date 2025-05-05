import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String name;
  final String img;

  const ItemCard({
    super.key,
    required this.name,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              img,
              height: 600,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text(
              name,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}