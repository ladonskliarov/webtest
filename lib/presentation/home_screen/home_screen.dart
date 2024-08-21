// LSkliarov 20 August 2024 18:40 UTC+2
// Home screen for setting API

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController urlController = TextEditingController(text: 'https://flutter.webspark.dev/flutter/api');

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
                        color: Colors.lightBlue,
                        border: Border.all(
                          color: Colors.blueAccent,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: GestureDetector(
                      onTap: () async {
                        // Just print input result
                        debugPrint('flutter: [{id: 7d785c38-cd54-4a98-ab57-44e50ae646c1, field: [.X., .X., ...], start: {x: 2, y: 1}, end: {x: 0, y: 2}}, {id: 88746d24-bf68-4dea-a6b6-4a8fefb47eb9, field: [XXX., X..X, X..X, .XXX], start: {x: 0, y: 3}, end: {x: 3, y: 0}}]');

                        //await DataService.getData(urlController.text);
                        // if (context.mounted){
                        //   Navigator.push(context, MaterialPageRoute<void>(builder: (context) => const ProcessScreen()));
                        // }
                      },
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
