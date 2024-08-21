// LSkliarov 20 August 2024 19:22 UTC+2
// Node class

class APINode {
  APINode({required this.field, required this.start, required this.end});
  final List<String> field;
  final Map<String, int> start;
  final Map<String, int> end;

  factory APINode.fromJson(Map<String, dynamic> e) {
    return APINode(
        field: List<String>.from(e['field']),
        start: Map<String, int>.from(e['start']).cast<String, int>(),
        end: Map<String, int>.from(e['end']).cast<String, int>());
  }
}

// class Node {
//   Node({required this.access, required this.x, required this.y});

//   final String access;
//   final int x;
//   final int y;

//   factory Node.fromAPINode(APINode node) {
//     return Node(
//       x: node['x'],
//     );
//   }
// }
