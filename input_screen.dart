import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic.dart';
import 'states.dart';
import 'colors.dart';
import 'styles.dart';

class InputScreen extends StatelessWidget {
  const InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BMICubit, BMIStates>(
      listener: (context, state) {
        if (state is BMICalculatedState) {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: const Text("Your BMI Result"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("${state.bmi}", style: AppTextStyles.bmiValue),
                  const SizedBox(height: 5),
                  Text(state.category, style: AppTextStyles.bmiCategory),
                  const SizedBox(height: 10),
                  Text(
                    "Healthy weight range: ${state.minWeight}kg - ${state.maxWeight}kg",
                    style: AppTextStyles.subtitle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        var cubit = context.read<BMICubit>();
        return Scaffold(
          appBar: AppBar(
            title: const Text("BMI Calculator"),
            backgroundColor: AppColors.primary,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                _buildHeightSlider(cubit),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(child: _buildWeightControl(cubit)),
                    const SizedBox(width: 20),
                    Expanded(child: _buildAgeControl(cubit)),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: () => cubit.calculateBMI(),
                  child: const Text("Calculate", style: AppTextStyles.buttonText),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeightSlider(BMICubit cubit) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey),
      ),
      child: Column(
        children: [
          const Text("Height", style: AppTextStyles.subtitle),
          Text("${cubit.height} cm", style: AppTextStyles.title),
          Slider(
            value: cubit.height.toDouble(),
            min: 100,
            max: 220,
            activeColor: AppColors.primary,
            onChanged: (value) => cubit.changeHeight(value.toInt()),
          ),
        ],
      ),
    );
  }

  Widget _buildWeightControl(BMICubit cubit) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey),
      ),
      child: Column(
        children: [
          const Text("Weight", style: AppTextStyles.subtitle),
          Text("${cubit.weight} kg", style: AppTextStyles.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => cubit.changeWeight(false),
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () => cubit.changeWeight(true),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAgeControl(BMICubit cubit) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey),
      ),
      child: Column(
        children: [
          const Text("Age", style: AppTextStyles.subtitle),
          Text("${cubit.age}", style: AppTextStyles.title),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () => cubit.changeAge(false),
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () => cubit.changeAge(true),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
