import 'dart:math';
import 'package:daily_tracker_diet_app/User/screens/step2.dart';

class CalculatorBrain {
  CalculatorBrain(
      {this.weight,
      this.height,
      this.age,
      this.activityLevelValue,
      this.goalValue,
      this.selectedGender});
  final double weight;
  final double height;
  final double age;
  final String activityLevelValue;
  final String goalValue;
  final Gender selectedGender;

  double bmi() {
    return (weight / pow(height / 100, 2));
  }

  double bmr() {
    if (selectedGender == Gender.male) {
      return 10 * weight + 6.25 * height - 5 * age + 5;
    } else {
      return 10 * weight + 6.25 * height - 5 * age - 161;
    }
  }

  double tdee() {
    if (activityLevelValue == 'Sedentary')
      return bmr() * 1.2;
    else if (activityLevelValue == 'Lightly Active')
      return bmr() * 1.375;
    else if (activityLevelValue == 'Moderately Active')
      return bmr() * 1.55;
    else if (activityLevelValue == 'Very Active')
      return bmr() * 1.725;
    else if (activityLevelValue == 'Extremely Active')
      return bmr() * 1.9;
    else
      return null;
  }

  double totalCalories() {
    if (goalValue == 'lose weight') {
      return (tdee() - 500);
    } else if (goalValue == 'maintain weight') {
      return tdee();
    } else if (goalValue == 'gain weight') {
      return tdee() + 400;
    } else
      return null;
  }

  //protein
  double protein() {
    if (goalValue == 'lose weight') {
      return loPro() / 4;
    } else if (goalValue == 'maintain weight') {
      return mnPro() / 4;
    } else if (goalValue == 'gain weight') {
      return gnPro() / 4;
    }
    return null;
  }

  //fats
  double fat() {
    if (goalValue == 'lose weight') {
      return loFat() / 9;
    } else if (goalValue == 'maintain weight') {
      return mnFat() / 9;
    } else if (goalValue == 'gain weight') {
      return gnFat() / 9;
    }
    return null;
  }

  //carbs
  double carb() {
    if (goalValue == 'lose weight') {
      return loCarb() / 4;
    } else if (goalValue == 'maintain weight') {
      return mnCarb() / 4;
    } else if (goalValue == 'gain weight') {
      return gnCarb() / 4;
    }
    return null;
  }

  // loose weight
  double loPro() {
    return (1.1 * (weight * 2.2)) * 4;
  }

  double loFat() {
    return 0.20 * totalCalories();
  }

  double loCarb() {
    return (totalCalories() - (loFat() + loPro()));
  }

  //maintain weight
  double mnPro() {
    return (weight * 2.2) * 4;
  }

  double mnFat() {
    return 0.20 * totalCalories();
  }

  double mnCarb() {
    return totalCalories() - (mnPro() + mnFat());
  }

  //gain weight
  double gnPro() {
    return (0.9 * (weight * 2.2)) * 4;
  }

  double gnFat() {
    return 0.25 * totalCalories();
  }

  double gnCarb() {
    return totalCalories() - (gnFat() + gnPro());
  }
}
