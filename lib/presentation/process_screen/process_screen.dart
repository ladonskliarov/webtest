// LSkliarov 20 August 2024 19:39 UTC+2
// Process screen

import 'package:flutter/material.dart';

class ProcessScreen extends StatefulWidget {
  const ProcessScreen({super.key});

  @override
  State<ProcessScreen> createState() => _ProcessScreenState();
}

class _ProcessScreenState extends State<ProcessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text('Process screen', style: TextStyle(color: Colors.white))),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(children: [
            const Text('All calculations has finished, you can send your results to server',
            style: TextStyle(fontSize: 17), textAlign: TextAlign.center,),
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
                onTap: () {},
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
        )
      ),
    );
  }
}
