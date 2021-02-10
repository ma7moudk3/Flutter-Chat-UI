import 'package:chating_ui/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chating App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Color(0xFFFCFCFC), primaryColor: Color(0xFF651DD8)),
      home: SplashScreen(),
    );
  }
}
