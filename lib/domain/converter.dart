import '/data/model/answer.dart';
import '/data/model/node.dart';
import '/data/model/template.dart';
import '/presentation/preview_screen/preview_screen.dart';

class Converter {
  static List<Template> convert(List<APITemplate> list) {
    List<Template> templates = [];
    for (var e in list) {
      templates.add(Template.fromAPINode(e));
    }
    return templates;
  }

  static List<Map<String, dynamic>> convertAnswersToAPI(List<Answer> answers) {
    return answers.map((answer) => answer.toJson()).toList();
  }

  static List<List<Node>> convertStringsToNodes(List<List<String>> graph, List<Node> answers) {
    List<List<Node>> newGraph = [];

    for (int i = 0; i < graph.length; i++) {
      List<Node> row = [];
      for (int j = 0; j < graph[i].length; j++) {
        if (answers.contains(Node(i, j))) {
          final Node nodeWay = Node(i, j);
          nodeWay.color = hexToColor('#4CAF50');
          nodeWay.value = graph[i][j];
          row.add(nodeWay);
        } else {
          final Node nodeWay = Node(i, j);
          nodeWay.value = graph[i][j];
          row.add(nodeWay);
        }
      }
      newGraph.add(row);
    }

    return newGraph;
  }
}
