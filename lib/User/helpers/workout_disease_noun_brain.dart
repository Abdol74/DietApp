import 'package:daily_tracker_diet_app/User/screens/workout_disease.dart';

class WorkoutDiseaseBrain {
  WorkoutDiseaseBrain({this.runningType, this.weight, this.duration});

  RunningType runningType;
  double weight;
  double duration;
  double met;

  double caloriesBurned() {
    if (runningType == RunningType.General) {
      met = 8;
      return ((met * weight * 3.5) / 200) * (duration/60);
    } else {
      met = 10;
      return ((met * weight * 3.5) / 200) *( duration/60);
    }
  }
}
