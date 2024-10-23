import 'package:flutter/material.dart';
import 'screens/smart_switch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Switch',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(primarySwatch:Colors.blue),
      home: const SmartSwitchScreen(),
    );
  }
}