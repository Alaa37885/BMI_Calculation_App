import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'ResultScreen.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({super.key});

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {

  TextEditingController _nameController = TextEditingController();
  TextEditingController _birthController = TextEditingController();
  TextEditingController _heightController = TextEditingController(text: "1");
  TextEditingController _weightController = TextEditingController(text: "1");

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  int selectedGender = 0;

  DateTime? selectedBirthDate;

  Dio dio = Dio();

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
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: Text("BMI",
          style: TextStyle(
            letterSpacing: 20,
            fontWeight: FontWeight.w900,
            fontSize: 40,
            color: Color(0xE501502E),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14),
        child: Form(
          key: formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // Name
              Text("Name",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                controller: _nameController,

                decoration: InputDecoration(
                  hintText: "ex. ahmed maged",
                  counterText: "",
                  fillColor: Color(0x26B3B2EA),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),

                maxLength: 50,

                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "this is required";
                  }
                  return null;
                },
              ),

              SizedBox(height: 24),

              // Birth Date
              Text("birth date",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                controller: _birthController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "ex. 1/1/2001",
                  counterText: "",
                  fillColor: Color(0x26B3B2EA),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),

                maxLength: 50,

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
                    selectedBirthDate = result;
                    _birthController.text =
                    "${result.day}/${result.month}/${result.year}";
                    setState(() {});
                  }
                },
              ),

              SizedBox(height: 24),

              // Gender
              Text("select gender",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  // Male
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 0;
                      });
                    },

                    child: Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0x26B3B2EA),

                        border: selectedGender == 0 ? Border.all(width: 1, color: Color(0xE501502E),)
                            : null,
                      ),

                      child: Image.asset("assets/images/Group.png",),
                    ),
                  ),

                  SizedBox(width: 40),

                  // Female
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 1;
                      });
                    },

                    child: Container(
                      height: 80,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Color(0x26B3B2EA),
                        border: selectedGender == 1 ? Border.all(width: 1, color: Color(0xE501502E),)
                            : null,
                      ),

                      child: Image.asset("assets/images/female.png",),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),

              // Height
              Text("Your Height(cm)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                textAlign: TextAlign.center,
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  // Plus
                  suffixIcon: GestureDetector(
                    onTap: () {
                      int x =
                          int.tryParse(_heightController.text) ?? 0;
                      x++;
                      _heightController.text = x.toString();
                    },

                    child: Icon(
                      Icons.add,
                      size: 26,
                      color: Colors.black,
                    ),
                  ),

                  // Minus
                  prefixIcon: GestureDetector(
                    onTap: () {
                      int x =
                          int.tryParse(_heightController.text) ?? 0;
                      if (x > 0) {
                        x--;
                      }
                      _heightController.text = x.toString();
                    },

                    child: Icon(
                      Icons.remove,
                      size: 26,
                      color: Colors.black,
                    ),
                  ),

                  counterText: "",
                  fillColor: Color(0x26B3B2EA),
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),

                maxLength: 50,

                validator: (value) {
                  int? height = int.tryParse(value ?? "");
                  if (height == null || height <= 0) {
                    return "Please enter your height";
                  }
                  return null;
                },
              ),

              SizedBox(height: 24),

              // Weight
              Text("Your Weight(kg)",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                textAlign: TextAlign.center,
                controller: _weightController,
                keyboardType: TextInputType.number,

                decoration: InputDecoration(

                  // Plus
                  suffixIcon: GestureDetector(
                    onTap: () {
                      int x =
                          int.tryParse(_weightController.text) ?? 0;
                      x++;
                      _weightController.text = x.toString();
                    },

                    child: Icon(
                      Icons.add,
                      size: 26,
                      color: Colors.black,
                    ),
                  ),

                  // Minus
                  prefixIcon: GestureDetector(
                    onTap: () {
                      int x =
                          int.tryParse(_weightController.text) ?? 0;
                      if (x > 0) {
                        x--;
                      }
                      _weightController.text = x.toString();
                    },

                    child: Icon(
                      Icons.remove,
                      size: 26,
                      color: Colors.black,
                    ),
                  ),

                  counterText: "",
                  fillColor: Color(0x26B3B2EA),
                  filled: true,

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                ),

                maxLength: 50,

                validator: (value) {
                  int? weight = int.tryParse(value ?? "");
                  if (weight == null || weight <= 0) {
                    return "Please enter your weight";
                  }
                  return null;
                },
              ),

              Spacer(),

              // Get Started
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  SizedBox(
                    width: 380,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9),
                        ),

                        backgroundColor: Color(0xff484783),
                      ),

                      onPressed: () async {
                        // Check form
                        if (!formKey.currentState!.validate()) {
                          return;
                        }

                        // Check birth date
                        if (selectedBirthDate == null) {
                          return;
                        }

                        // Get height
                        int height =
                        int.parse(_heightController.text);

                        // Get weight
                        int weight =
                        int.parse(_weightController.text);

                        // Loading
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );

                        // api cnstrains : link , query , headers , quthorizatipon
                        // Dependinies , dev Dependinies (that i didn't nees in production
                        // icons)

                        try {
                          // Call API
                          var response = await dio.get(
                            "https://api.apiverve.com/v1/bmicalculator",
                            queryParameters: {
                              "weight": weight,
                              "height": height,
                              "unit": "metric",
                            },
                            options: Options(
                              headers: {
                                "x-api-key":
                                "ff870e7d-5d78-4309-82bc-0b5e0347db0f",
                              },
                            ),
                          );
                          print("API RESPONSE:");
                          print(response.data);

                          // Get BMI
                          double bmi =
                          (response.data["data"]["bmi"] as num).toDouble();

                          // Close loading
                          if (context.mounted) {
                            Navigator.pop(context);
                          }

                          // Go to result screen
                          if (context.mounted) {
                            Navigator.push(
                              context,

                              MaterialPageRoute(
                                builder: (context) {
                                  return ResultScreen(
                                    name: _nameController.text,
                                    bmi: bmi,
                                    height: height,
                                    weight: weight,
                                    birthDate: selectedBirthDate!,
                                    gender: selectedGender,
                                  );
                                },
                              ),
                            );
                          }
                        }

                        catch (e) {
                          if (context.mounted) {
                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Error $e"),
                              ),
                            );
                          }
                        }
                      },

                      child: Text(
                        "Get Started",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
