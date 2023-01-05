import 'package:api_example/TimeStorage.dart';
import 'package:api_example/model/Airlines.dart';
import 'package:api_example/view/HomePage.dart';
import 'package:api_example/view/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main(List<String> args) async {
  await Hive.initFlutter();
  Hive.registerAdapter(AirlinesAdapter());
  Hive.registerAdapter(TimeStorageAdapter());
  await Hive.openBox("airlines");
  await Hive.openBox("time");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
