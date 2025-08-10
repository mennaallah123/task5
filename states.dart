abstract class BMIStates {}

class BMIInitialState extends BMIStates {}

class BMIGenderSelectedState extends BMIStates {}

class BMIValuesChangedState extends BMIStates {}

class BMICalculatedState extends BMIStates {
  final double bmi;
  final String category;
  final double minWeight;
  final double maxWeight;

  BMICalculatedState({
    required this.bmi,
    required this.category,
    required this.minWeight,
    required this.maxWeight,
  });
}
