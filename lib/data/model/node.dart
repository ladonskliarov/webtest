// LSkliarov 20 August 2024 19:22 UTC+2
// Node class

import 'dart:ui';

import '/presentation/preview_screen/preview_screen.dart';

class Node {
  Node(this.x, this.y);
  Color color = hexToColor('#FFFFFF');
  String? value;
  final int x;
  final int y;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Node && runtimeType == other.runtimeType && x == other.x && y == other.y;

  @override
  int get hashCode => x.hashCode ^ y.hashCode;

  Map<String, dynamic> toJson() {
    return {
      'x': x,
      'y': y,
    };
  }
}
