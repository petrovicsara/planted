import 'package:flutter/material.dart';

import 'my_home_page.dart';

void main() {
  runApp(const MyPlantedApp());
}

class MyPlantedApp extends StatelessWidget {
  const MyPlantedApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}