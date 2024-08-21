import 'package:flutter/material.dart';
import 'package:webspark/presentation/home_screen/home_screen.dart';

// Test data
// flutter: [{id: 7d785c38-cd54-4a98-ab57-44e50ae646c1, field: [.X., .X., ...], start: {x: 2, y: 1}, end: {x: 0, y: 2}},
// {id: 88746d24-bf68-4dea-a6b6-4a8fefb47eb9, field: [XXX., X..X, X..X, .XXX], start: {x: 0, y: 3}, end: {x: 3, y: 0}}]

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
