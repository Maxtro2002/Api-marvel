import 'package:flutter/material.dart';
import 'package:api_marvel/apiMarvel.dart';
import 'package:api_marvel/pages/characterDetail.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: MainAppEjemplo1(),
      routes: {'detail_character': (context) => DetailCharacter()},
    );
  }
}
