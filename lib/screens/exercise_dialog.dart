import 'package:flutter/material.dart';
import 'package:provafaculdadeexericios1511/data/exercise_data.dart';

class ExerciseDialog extends StatefulWidget {
  final Function(ExerciseData) onAdd;

  ExerciseDialog({required this.onAdd});

  @override
  _ExerciseDialogState createState() => _ExerciseDialogState();
}

class _ExerciseDialogState extends State<ExerciseDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _repetitionsController = TextEditingController();
  final TextEditingController _seriesController = TextEditingController();
  final TextEditingController _loadController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Adicionar Exercício'),
      content: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Nome do Exercício'),
          ),
          TextField(
            controller: _repetitionsController,
            decoration: InputDecoration(labelText: 'Repetições'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _seriesController,
            decoration: InputDecoration(labelText: 'Séries'),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _loadController,
            decoration: InputDecoration(labelText: 'Carga'),
            keyboardType: TextInputType.numberWithOptions(decimal: true),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            // Adiciona o exercício e chama a função de callback
            ExerciseData newExercise = ExerciseData(
              name: _nameController.text,
              repetitions: int.parse(_repetitionsController.text),
              series: int.parse(_seriesController.text),
              load: _loadController.text,
            );

            // Chama a função de callback passando o novo exercício
            widget.onAdd(newExercise);

            // Fecha o dialog
            Navigator.pop(context);
          },
          child: Text('Adicionar'),
        ),
      ],
    );
  }
}
