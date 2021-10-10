import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Text(title,
          style: Theme.of(context).textTheme.title,
          textAlign: TextAlign.center),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle, color: Colors.grey,

        /// Creates a border radius where all radii
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
