import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

enum Gender { male, female }

class BMICubit extends Cubit<BMIStates> {
  BMICubit() : super(BMIInitialState());

  Gender? selectedGender;
  int weight = 65;
  int age = 26;
  int height = 170;

  void selectGender(Gender gender) {
    selectedGender = gender;
    emit(BMIGenderSelectedState());
  }

  void changeWeight(bool increase) {
    if (increase) {
      weight++;
    } else if (weight > 1) {
      weight--;
    }
    emit(BMIValuesChangedState());
  }

  void changeAge(bool increase) {
    if (increase) {
      age++;
    } else if (age > 1) {
      age--;
    }
    emit(BMIValuesChangedState());
  }

  void changeHeight(int value) {
    height = value;
    emit(BMIValuesChangedState());
  }

  void calculateBMI() {
    double heightMeters = height / 100;
    double bmi = weight / (heightMeters * heightMeters);

    String category;
    if (bmi < 18.5) {
      category = "Underweight";
    } else if (bmi < 25) {
      category = "Normal";
    } else if (bmi < 30) {
      category = "Overweight";
    } else {
      category = "Obese";
    }

    double minWeight = 18.5 * (heightMeters * heightMeters);
    double maxWeight = 24.9 * (heightMeters * heightMeters);

    emit(BMICalculatedState(
      bmi: double.parse(bmi.toStringAsFixed(1)),
      category: category,
      minWeight: double.parse(minWeight.toStringAsFixed(1)),
      maxWeight: double.parse(maxWeight.toStringAsFixed(1)),
    ));
  }
}
