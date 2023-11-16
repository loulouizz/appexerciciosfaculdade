import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TrainingListScreen extends StatelessWidget {
  final String listId;

  TrainingListScreen({required this.listId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Lista de Treinamento'),
      ),
      body: Column(
        children: [
          // Aqui você exibe outras informações sobre a lista, se necessário

          // Exibição dos exercícios
          Expanded(
            child: ExerciseListWidget(listId: listId),
          ),
        ],
      ),
    );
  }
}

class ExerciseListWidget extends StatelessWidget {
  final String listId;

  ExerciseListWidget({required this.listId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('exercise_lists')
          .doc(listId)
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var exerciseList = snapshot.data!.data();
        var exercises = exerciseList?['exercises'] ?? [];

        return ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            var exercise = exercises[index];
            return ListTile(
              title: Text(exercise['name']),
              subtitle: Text(
                'Repetições: ${exercise['repetitions']}, Séries: ${exercise['series']}, Carga: ${exercise['load']}',
              ),
            );
          },
        );
      },
    );
  }
}
