import 'package:flutter/material.dart';

// Decerilization

class ResultScreen extends StatelessWidget {
  final String name;
  final double bmi;
  final int height;
  final int weight;
  final DateTime birthDate;
  final int gender;

  const ResultScreen({
    super.key,
    required this.name,
    required this.bmi,
    required this.height,
    required this.weight,
    required this.birthDate,
    required this.gender,
  });

  // calc calculatedAge
  int get calculatedAge {
    final DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month &&
            today.day < birthDate.day)) {
      age--;
    }
    return age;
  }


  String get bmiCategory {
    if (bmi < 18.5) {
      return "Under Weight";
    } else if (bmi < 25) {
      return "Normal Weight";
    } else if (bmi < 30) {
      return "Over Weight";
    } else {
      return "Obesity";
    }
  }


  String get description {
    if (bmi < 18.5) {
      return "Your BMI is less than 18.5";
    } else if (bmi < 25) {
      return "Your BMI is within the normal range";
    } else if (bmi < 30) {
      return "Your BMI is above the normal range";
    } else {
      return "Your BMI is in the obesity range";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FF),

      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [

              const SizedBox(height: 45),

              // =============================================================
              // TOP RESULT CARD
              // =============================================================

              Container(
                width: double.infinity,
                height: 228,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xff7772CF),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Stack(
                  children: [
                    // NAME
                    Positioned(
                      left: 0,
                      top: 15,
                      child: Text(
                        "$name ${gender == 0 ? "(male)" : "(female)"}",

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    // AGE
                    Positioned(
                      left: 0,
                      top: 42,
                      child: Text(
                        "$calculatedAge years old.",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),

                    // BMI
                    Positioned(
                      left: 50,
                      top: 70,
                      child: Column(
                        children: [
                          Text(
                            bmi.toStringAsFixed(1),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          // BMI Calc
                          Transform.translate(
                            offset: const Offset(0, -2),
                            child: const Text(
                              "BMI Calc",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // HEIGHT
                    Positioned(
                      left: 0,
                      bottom: 18,
                      child: Column(
                        children: [
                          Text(
                            "$height cm",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 3),

                          const Text(
                            "Height",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // VERTICAL DIVIDER
                    Positioned(
                      left: 89,
                      bottom: 14,
                      child: Container(
                        width: 2,
                        height: 40,
                        color: Colors.white54,
                      ),
                    ),

                    // WEIGHT
                    Positioned(
                      left: 108,
                      bottom: 18,
                      child: Column(
                        children: [
                          Text(
                            "$weight kg",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 3),

                          const Text(
                            "Weight",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // BODY IMAGE
                    Positioned(
                      right: 5,
                      top: 0,
                      bottom: 0,
                      child: Image.asset(
                        "assets/images/body.png",
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // =====================================================
              // BMI INFORMATION CARD
              // =====================================================

              Container(
                width: double.infinity,
                height: 400,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xff006039),
                  borderRadius: BorderRadius.circular(15),
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // CATEGORY
                    Text(
                      bmiCategory,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    // DESCRIPTION
                    Text(
                      description,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // INFORMATION
                    const Text(
                      "Lorem ipsum dolor sit amet consectetur. "
                          "Sagittis ritticidunt dui enim imperdiet sapien "
                          "cursus velit pharetra. Viverra justo tempor "
                          "dictum odio. Nisl non dui integer orci nulla "
                          "eget laoreet tellus. Orci nunc a orci convallis "
                          "ac orci. Urna auctor at elementum sit ante "
                          "maecenas ullamcorper rhoncus dictum. "
                          "Morbi venenatis lectus ultrices euismod. "
                          "Laoreet purus risus amet enim sagittis ut. "
                          "Consectetur libero orci urna.",

                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        height: 1.45,
                      ),
                    ),
                  ],
                ),
              ),

              // Push button toward bottom
              const Spacer(),

              // =====================================================
              // CALCULATE AGAIN BUTTON
              // =====================================================

              SizedBox(
                width: double.infinity,
                height: 38,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff484783),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),

                  child: const Text(
                    "Calculate BMI Again",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),
            ],
          ),
        ),
    );
  }
}
