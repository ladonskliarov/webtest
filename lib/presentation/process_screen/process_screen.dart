// LSkliarov 20 August 2024 19:39 UTC+2
// Process screen

import 'dart:async';

import 'package:flutter/material.dart';

import '/domain/converter.dart';
import '/domain/analyzer.dart';
import '/presentation/result_screen/results_screen.dart';
import '/data/model/template.dart';
import '../../data/service/data_service.dart';

class ProcessScreen extends StatefulWidget {
  const ProcessScreen({required this.templates, super.key});
  final List<Template> templates;

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  late StreamController<double> controller;
  late Stream<double> percentStream;

  double percentProgress = 0;
  bool isNotSending = true;

  @override
  void initState() {
    super.initState();
    Analyzer.graphsAmount = widget.templates.length;
    Analyzer.elementsAmount = widget.templates.fold(0, (outerAcc, template) {
      return outerAcc +
          template.graph.fold(0, (innerAcc, list) {
            return innerAcc + list.length;
          });
    });

    controller = StreamController<double>();
    Analyzer.percentController = controller;
    percentStream = controller.stream;

    percentStream.listen((value) {
      setState(() {
        percentProgress += value;
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Analyzer.iterator(widget.templates);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
        title: const Align(
            alignment: Alignment.centerLeft, child: Text('Process screen', style: TextStyle(color: Colors.white))),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Spacer(),
          SizedBox(
              child: isNotSending
                  ? Column(
                      children: [
                        const Text(
                          'All calculations has finished, you can send your results to server',
                          style: TextStyle(fontSize: 17),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text('$percentProgress%', style: const TextStyle(color: Colors.black, fontSize: 17)),
                        const SizedBox(height: 10),
                        Divider(height: 1, color: Colors.grey[200]),
                        const SizedBox(height: 10),
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: CircularProgressIndicator(
                              value: percentProgress.toDouble(),
                              color: Colors.blue,
                            )),
                      ],
                    )
                  : const SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(),
                    )),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: DecoratedBox(
                decoration: BoxDecoration(
                    color: isNotSending ? Colors.blue : percentProgress == 100 ? Colors.lightBlue : Colors.grey,
                    border: Border.all(
                      color: Colors.blueAccent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(20)),
                child: GestureDetector(
                  onTap: (percentProgress == 100 || isNotSending)
                      ? () async {
                          isNotSending = false;
                          setState(() {});
                          final results = Converter.convertAnswersToAPI(Analyzer.answers);
                          final response = await DataService.postData(results);
                          if (response['error'] == false && context.mounted) {
                            Navigator.push(
                                context,
                                MaterialPageRoute<void>(
                                    builder: (context) => ResultsScreen(
                                          templates: widget.templates,
                                          answers: Analyzer.answers,
                                        )));
                            isNotSending = true;
                            setState(() {});
                          }
                        }
                      : null,
                  child: const SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Align(
                        alignment: Alignment.center,
                        child: Text('Send results to server',
                            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
                  ),
                )),
          ),
        ]),
      )),
    );
  }
}
