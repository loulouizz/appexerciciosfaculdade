import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provafaculdadeexericios1511/screens/GeneralDrawer.dart';
import 'package:provafaculdadeexericios1511/screens/add_exercise_list_screen.dart';
import 'package:provafaculdadeexericios1511/screens/exercises_list_widget.dart';

class MainScreen extends StatefulWidget {
  final String userEmail;
  final String userId;

  const MainScreen({Key? key, required this.userId, required this.userEmail}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seu App de Saúde'),
      ),
      drawer: GeneralDrawer(),
      body: ExerciseListsWidget(userId: widget.userId),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Adicione a navegação para a tela de criação de lista aqui
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddExerciseListScreen(),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
