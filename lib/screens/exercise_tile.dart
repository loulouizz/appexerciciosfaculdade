import 'package:flutter/material.dart';
import 'package:provafaculdadeexericios1511/data/exercise_data.dart';

class ExerciseTile extends StatelessWidget {
  final ExerciseData exerciseData;
  final VoidCallback onDelete;

  ExerciseTile({required this.exerciseData, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        title: Text(exerciseData.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Repetições: ${exerciseData.repetitions}'),
            Text('Séries: ${exerciseData.series}'),
            Text('Carga: ${exerciseData.load}'),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}
