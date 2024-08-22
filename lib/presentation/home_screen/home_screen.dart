// LSkliarov 20 August 2024 18:40 UTC+2
// Home screen for setting API

import 'package:flutter/material.dart';

import '/domain/converter.dart';
import '/data/model/template.dart';
import '/data/service/data_service.dart';
import '../process_screen/process_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController urlController = TextEditingController();
  bool isButtonActive = false;

  @override
  void initState() {
    urlController.addListener(() {
      if ((!urlController.text.startsWith('https://') || !urlController.text.startsWith('http://')) &&
          isButtonActive == true) {
        isButtonActive = false;
        setState(() {});
      } else if ((urlController.text.startsWith('https://') || urlController.text.startsWith('http://')) &&
          isButtonActive == false) {
        isButtonActive = true;
        DataService.url = urlController.text;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
            alignment: Alignment.centerLeft, child: Text('Home screen', style: TextStyle(color: Colors.white))),
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const Text('Set valid API base URL in order to continue', style: TextStyle(fontSize: 17)),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.swap_horiz_sharp, color: Colors.grey, size: 30),
                  const SizedBox(width: 20),
                  Expanded(child: TextField(controller: urlController))
                ],
              ),
              const Spacer(),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: isButtonActive ? Colors.lightBlue : Colors.grey,
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: GestureDetector(
                      onTap: isButtonActive
                          ? () async {
                              setState(() {
                                isButtonActive = false;
                              });
                              final List<APITemplate> response = await DataService.getData(urlController.text);
                              final templates = Converter.convert(response);
                              if (context.mounted) {
                                isButtonActive = true;
                                setState(() {});
                                Navigator.push(context,
                                    MaterialPageRoute<void>(builder: (context) => ProcessScreen(templates: templates)));
                              }
                            }
                          : null,
                      child: const SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: Align(
                            alignment: Alignment.center,
                            child: Text('Start counting process',
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
