import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'logic.dart';
import 'states.dart';
import 'colors.dart';
import 'styles.dart';
import 'input_screen.dart';

class GenderScreen extends StatelessWidget {
  const GenderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BMICubit, BMIStates>(
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
                Text("Please choose your gender", style: AppTextStyles.title),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => cubit.selectGender(Gender.male),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: cubit.selectedGender == Gender.male
                                ? AppColors.maleCard
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: cubit.selectedGender == Gender.male
                                  ? AppColors.primary
                                  : AppColors.grey,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 80,
                                child: Image.asset(
                                  "assets/male.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text("Male", style: AppTextStyles.subtitle),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => cubit.selectGender(Gender.female),
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: cubit.selectedGender == Gender.female
                                ? AppColors.femaleCard
                                : AppColors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: cubit.selectedGender == Gender.female
                                  ? AppColors.primary
                                  : AppColors.grey,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 80,
                                child: Image.asset(
                                  "assets/female.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(height: 10),
                              const Text("Female", style: AppTextStyles.subtitle),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  onPressed: cubit.selectedGender == null
                      ? null
                      : () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const InputScreen(),
                            ),
                          );
                        },
                  child: const Text("Continue", style: AppTextStyles.buttonText),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
