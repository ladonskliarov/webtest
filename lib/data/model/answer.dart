import '/data/model/node.dart';

class Answer {
  Answer({required this.id, required this.list, required this.path});
  final String id;
  final List<Node> list;
  final String path;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'result': {
        'steps': list.map((node) => node.toJson()).toList(),
        'path': path,
      }
    };
  }
}
