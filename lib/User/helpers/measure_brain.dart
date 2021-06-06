import 'dart:math';

class MeasureBrain {
  final int calories;
  final int fats;
  final int carb;
  final int protein;
  final int measure;

  MeasureBrain(
      {this.fats, this.carb, this.protein, this.calories, this.measure});

  List calculateNewMeasure() {
    double newMeasure = measure / 100;

    var newCals = calories * newMeasure;
    var newFats = fats * newMeasure;
    var newCarb = carb * newMeasure;
    var newProtein = protein * newMeasure;
    return [newCals, newFats, newCarb, newProtein];
  }
}
