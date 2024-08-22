import '/data/model/node.dart';

class APITemplate {
  APITemplate({required this.id, required this.field, required this.start, required this.end});
  final String id;
  final List<String> field;
  final Map<String, int> start;
  final Map<String, int> end;

  factory APITemplate.fromJson(Map<String, dynamic> e) {
    return APITemplate(
        id: e['id'],
        field: List<String>.from(e['field']),
        start: Map<String, int>.from(e['start']).cast<String, int>(),
        end: Map<String, int>.from(e['end']).cast<String, int>());
  }
}

class Template {
  Template({required this.id, required this.graph, required this.start, required this.end});

  final String id;
  final List<List<String>> graph;
  final Node start;
  final Node end;

  factory Template.fromAPINode(APITemplate node) {
    return Template(
        id: node.id,
        graph: node.field.map((row) => row.split('')).toList(),
        start: Node(node.start['x'] as int, node.start['y'] as int),
        end: Node(node.end['x'] as int, node.end['y'] as int));
  }
}
