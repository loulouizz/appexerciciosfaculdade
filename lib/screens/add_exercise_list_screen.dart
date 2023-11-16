import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provafaculdadeexericios1511/data/exercise_data.dart';

class AddExerciseListScreen extends StatefulWidget {
  @override
  _AddExerciseListScreenState createState() => _AddExerciseListScreenState();
}

class _AddExerciseListScreenState extends State<AddExerciseListScreen> {
  final TextEditingController _listNameController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _repetitionsController = TextEditingController();
  final TextEditingController _seriesController = TextEditingController();
  final TextEditingController _loadController = TextEditingController();
  final List<ExerciseData> _exercises = [];

  void _addExercise() {
    ExerciseData newExercise = ExerciseData(
      name: _nameController.text,
      repetitions: int.parse(_repetitionsController.text),
      series: int.parse(_seriesController.text),
      load: _loadController.text,
    );

    setState(() {
      _exercises.add(newExercise);
    });

    _nameController.clear();
    _repetitionsController.clear();
    _seriesController.clear();
    _loadController.clear();
  }


  void _saveExerciseList() async {
    Map<String, dynamic> exerciseListData = {
      'name': _listNameController.text,
      'exercises': _exercises.map((exercise) => exercise.toMap()).toList(),
    };

    try {
      await FirebaseFirestore.instance.collection('exercise_lists').add(exerciseListData);
      Navigator.pop(context); // Retorna à tela anterior após adicionar a lista
    } catch (e) {
      print("Erro ao salvar lista de exercícios: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adicionar Lista de Exercícios'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _listNameController,
              decoration: InputDecoration(labelText: 'Nome da Lista'),
            ),
            SizedBox(height: 16.0),
            Text('Exercícios Adicionados: ${_exercises.length}'),
            Expanded(
              child: ListView.builder(
                itemCount: _exercises.length,
                itemBuilder: (context, index) {
                  var exercise = _exercises[index];
                  return ListTile(
                    title: Text(exercise.name),
                    subtitle: Text('Repetições: ${exercise.repetitions}, Séries: ${exercise.series}, Carga: ${exercise.load}'),
                  );
                },
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome do Exercício'),
            ),
            TextFormField(
              controller: _repetitionsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Repetições'),
            ),
            TextFormField(
              controller: _seriesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Séries'),
            ),
            TextFormField(
              controller: _loadController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Carga'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _addExercise();
              },
              child: Text('Adicionar Exercício'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                _saveExerciseList();
              },
              child: Text('Salvar Lista de Exercícios'),
            ),
          ],
        ),
      ),
    );
  }
}
