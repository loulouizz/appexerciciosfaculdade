class ExerciseData {
  String name;
  int repetitions;
  int series;
  String load;

  ExerciseData({
    required this.name,
    required this.repetitions,
    required this.series,
    required this.load,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'repetitions': repetitions,
      'series': series,
      'load': load,
    };
  }
}
