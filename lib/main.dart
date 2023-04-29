import 'package:flutter/material.dart';
import 'package:webtoon/screens/home_screen.dart';

// flutter run -d chrome --web-port=8080 --web-hostname=127.0.0.1 --web-browser-flag '--disable-web-security'
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
