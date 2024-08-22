// LSkliarov 20 August 2024 19:10 UTC+2
// Core class for data analysis

import 'dart:async';
import 'dart:collection';

import '/data/model/answer.dart';
import '/data/model/node.dart';
import '/presentation/preview_screen/preview_screen.dart';
import '/data/model/template.dart';

class Analyzer {
  static late StreamController<double> percentController;
  static late int graphsAmount;
  static late double elementsAmount;
  static List<Answer> answers = [];

  static iterator(List<Template> list) async {
    // ignore: avoid_function_literals_in_foreach_calls
    list.forEach((e) async {
      final Answer result = await Analyzer.bfs(graph: e.graph, start: e.start, end: e.end, id: e.id);
      answers.add(result);
      percentController.add(100/graphsAmount);
    });
  }

  static bfs({required List<List<String>> graph, required Node start, required Node end, required String id}) async {
    int rows = graph.length;
    int cols = graph[0].length;

    Queue<Node> queue = Queue();
    Set<Node> visited = {};
    Map<Node, Node> parentMap = {};

    List<Node> directions = [
      Node(0, 1),
      Node(1, 0),
      Node(0, -1),
      Node(-1, 0),
      Node(1, 1),
      Node(1, -1),
      Node(-1, 1),
      Node(-1, -1)
    ];

    queue.add(start);
    visited.add(start);

    while (queue.isNotEmpty) {
      Node current = queue.removeFirst();

      if (current.x == end.x && current.y == end.y) {
        // Reconstruct path
        List<Node> path = [];
        String stringPath = '';
        Node? step = current;
        while (step != null) {
          path.add(step);
          step = parentMap[step];
        }
        final reversedPath = path.reversed.toList();
        for (var e in reversedPath) {
          if (e == end) {
            e.color = hexToColor('#009688');
            stringPath += '(${e.x},${e.y})';
          } else if (e == start) {
            e.color = hexToColor('#64FFDA');
          } else {
            e.color = hexToColor('#4CAF50');
            stringPath += '(${e.x},${e.y})->';
          }
        }
        return Answer(id: id, list: reversedPath, path: stringPath);
      }

      for (Node direction in directions) {
        int newX = current.x + direction.x;
        int newY = current.y + direction.y;

        if (newX >= 0 &&
            newY >= 0 &&
            newX < rows &&
            newY < cols &&
            graph[newX][newY] == '.' &&
            !visited.contains(Node(newX, newY))) {
          Node neighbor = Node(newX, newY);
          queue.add(neighbor);
          visited.add(neighbor);
          parentMap[neighbor] = current;
        }
      }
    }

    return Answer(id: id, list: [], path: '');
  }
}
