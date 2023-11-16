import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provafaculdadeexericios1511/screens/training_list_page.dart';
import 'package:provafaculdadeexericios1511/screens/training_list_page.dart';

class ExerciseListsWidget extends StatelessWidget {
  final String userId;

  ExerciseListsWidget({required this.userId});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('exercise_lists').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        var exerciseLists = snapshot.data!.docs;

        return ListView.builder(
          itemCount: exerciseLists.length,
          itemBuilder: (context, index) {
            var exerciseList = exerciseLists[index];
            return ListTile(
              title: Text(exerciseList['name']),
              onTap: () {
                // Adicione a navegação para a página da lista de treinamento aqui
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrainingListScreen(listId: exerciseList.id),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
