import 'dart:ui';
import 'package:flutter/material.dart';

/// id : "c1"
/// title : "Italian"
/// color : Colors.orange

class Category {
  final String id;
  final String title;
  final Color color;

  const Category({
    @required this.id,
    @required this.title,
    this.color = Colors.orange,
  });
}
