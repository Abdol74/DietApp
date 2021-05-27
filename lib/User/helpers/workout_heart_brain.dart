import 'package:daily_tracker_diet_app/User/screens/step2.dart';

class WorkoutHeartDisease {
  WorkoutHeartDisease(
      {this.distance,
      this.heartRate,
      this.age,
      this.weight,
      this.time,
      this.gender});
  double age;
  double weight;
  double heartRate;
  double distance;
  double time;
  Gender gender;

  double caloriesBurned() {
    if (gender == Gender.male) {
      return ((-55.0969 +
                  (0.6309 * heartRate) +
                  (0.1988 * weight) +
                  (0.2017 * age)) /
              4.184) *
          10;
    } else {
      return ((-20.4022 +
                  (0.4472 * heartRate) -
                  (0.1263 * weight) +
                  (0.074 * age)) /
              4.184) *
          10;
    }
  }
}
