import 'package:flutter/material.dart';

import '../../domain/converter.dart';
import '/../data/model/answer.dart';
import '/presentation/preview_screen/preview_screen.dart';
import '/data/model/template.dart';

class ResultsScreen extends StatefulWidget {
  const ResultsScreen({super.key, required this.answers, required this.templates});
  final List<Answer> answers;
  final List<Template> templates;

  @override
  State<ResultsScreen> createState() => _ResultsScreenState();
}

class _ResultsScreenState extends State<ResultsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SafeArea(
          child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    final graph = Converter.convertStringsToNodes(widget.templates[index].graph, widget.answers[index].list);
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (context) => PreviewScreen(
                          template: widget.templates[index],
                          graph: graph,
                          answerPath: widget.answers[index].path,
                        )
                      )
                    );
                  },
                  child: Container(
                    height: 80,
                    alignment: Alignment.center,
                    child: Text(widget.answers[index].path, style: const TextStyle(color: Colors.black, fontSize: 17)),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(height: 2, color: Colors.grey);
              },
              itemCount: widget.answers.length)),
    );
  }
}
