import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:bmi_aug/features/bmi/presentation/cubit/bmi_cubit.dart';
import 'package:bmi_aug/features/bmi/presentation/cubit/bmi_state.dart';
import 'package:bmi_aug/features/bmi/presentation/widgets/custom_text_field.dart';
import 'package:bmi_aug/features/bmi/presentation/widgets/gender_selection.dart';
import 'package:bmi_aug/features/bmi/presentation/widgets/metric_input_field.dart';
import 'package:bmi_aug/features/bmi/presentation/widgets/bmi_button.dart';
import 'package:bmi_aug/features/bmi/presentation/screens/result_screen.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({super.key});

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController(text: "170");
  final TextEditingController _weightController = TextEditingController(text: "70");

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int selectedGender = 0;
  DateTime? selectedBirthDate;

  @override
  void dispose() {
    _nameController.dispose();
    _birthController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCubit(Dio()),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "BMI",
            style: TextStyle(
              letterSpacing: 20,
              fontWeight: FontWeight.w900,
              fontSize: 40,
              color: Color(0xE501502E),
            ),
          ),
        ),
        body: BlocConsumer<BmiCubit, BmiState>(
          listener: (context, state) {
            if (state is BmiSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BmiDetails(bmiModel: state.bmiResponse),
                ),
              );
            } else if (state is BmiError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextField(
                      label: "Name",
                      hint: "ex. ahmed maged",
                      controller: _nameController,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "this is required";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    CustomTextField(
                      label: "birth date",
                      hint: "ex. 1/1/2001",
                      controller: _birthController,
                      readOnly: true,
                      validator: (value) {
                        if (selectedBirthDate == null) {
                          return "please, enter your birth date";
                        }
                        return null;
                      },
                      onTap: () async {
                        DateTime? result = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1850),
                          lastDate: DateTime.now(),
                          initialDate: selectedBirthDate ??
                              DateTime(
                                DateTime.now().year - 20,
                                DateTime.now().month,
                                DateTime.now().day,
                              ),
                        );

                        if (result != null) {
                          setState(() {
                            selectedBirthDate = result;
                            _birthController.text =
                                "${result.day}/${result.month}/${result.year}";
                          });
                        }
                      },
                    ),
                    const SizedBox(height: 24),
                    GenderSelection(
                      selectedGender: selectedGender,
                      onGenderSelected: (index) {
                        setState(() {
                          selectedGender = index;
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    MetricInputField(
                      label: "Your Height(cm)",
                      controller: _heightController,
                      validator: (value) {
                        int? height = int.tryParse(value ?? "");
                        if (height == null || height <= 0) {
                          return "Please enter your height";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 24),
                    MetricInputField(
                      label: "Your Weight(kg)",
                      controller: _weightController,
                      validator: (value) {
                        int? weight = int.tryParse(value ?? "");
                        if (weight == null || weight <= 0) {
                          return "Please enter your weight";
                        }
                        return null;
                      },
                    ),
                    const Spacer(),
                    BmiButton(
                      text: "Get Started",
                      isLoading: state is BmiLoading,
                      onPressed: () {
                        if (formKey.currentState!.validate() &&
                            selectedBirthDate != null) {
                          context.read<BmiCubit>().calculateBmi(
                                name: _nameController.text,
                                birthDate: _birthController.text,
                                gender: selectedGender == 0 ? "Male" : "Female",
                                height: int.parse(_heightController.text),
                                weight: int.parse(_weightController.text),
                              );
                        }
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
