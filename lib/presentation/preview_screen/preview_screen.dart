// LSkliarov 20 August 2024 21:59 UTC+2
// Preview screen

import 'package:flutter/material.dart';

import '/data/model/template.dart';
import '/data/model/node.dart';

class PreviewScreen extends StatelessWidget {
  const PreviewScreen({required this.graph, required this.template, required this.answerPath, super.key});
  final List<List<Node>> graph;
  final Template template;
  final String answerPath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Column(children: [
        SizedBox(
            height: MediaQuery.of(context).size.height / 2.2,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: graph.length,
              ),
              itemCount: graph.length * graph.length,
              itemBuilder: (context, index) {
                int row = index ~/ graph.length;
                int col = index % graph.length;
                String cellNode = '($row,$col)';
                String? cellValue = graph[row][col].value;

                return Container(
                  decoration: BoxDecoration(
                    color: cellValue == 'X' ? hexToColor('#000000')
                      : row == template.start.x && col == template.start.y ? hexToColor('#64FFDA')
                      : row == template.end.x && col == template.end.y ? hexToColor('#009688')
                      : graph[row][col].color,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Center(
                    child: Text(
                      cellNode,
                      style: TextStyle(color: cellValue == 'X' ? hexToColor('#FFFFFF') : hexToColor('#000000')),
                    ),
                  ),
                );
              },
            )),
        Divider(color: hexToColor('#000000'), height: 1),
        Text(
          answerPath,
          style: const TextStyle(color: Colors.black, fontSize: 17),
        ),
      ]),
    );
  }
}

Color hexToColor(String hex) {
  hex = hex.replaceAll("#", "");
  hex = "FF$hex";
  return Color(int.parse(hex, radix: 16));
}
