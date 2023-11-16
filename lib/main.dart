import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provafaculdadeexericios1511/firebase_options.dart';
import 'package:provafaculdadeexericios1511/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seu App de Saúde',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
