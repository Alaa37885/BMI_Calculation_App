import 'package:bmi_aug/models/bmi_model.dart';
import 'package:flutter/material.dart';

class BmiDetails extends StatelessWidget {
  final BmiResponse bmiModel;

  const BmiDetails({
    super.key,
    required this.bmiModel,
  });

  int calculateAge() {
    String birthDate = bmiModel.birthDate ?? '';

    if (birthDate.isEmpty) {
      return 0;
    }

    List<String> date = birthDate.split('/');

    int day = int.parse(date[0]);
    int month = int.parse(date[1]);
    int year = int.parse(date[2]);

    DateTime birth = DateTime(year, month, day);
    DateTime today = DateTime.now();

    int age = today.year - birth.year;

    if (today.month < birth.month ||
        (today.month == birth.month && today.day < birth.day)) {
      age--;
    }

    return age;
  }

  String getBmiCategory() {
    double bmi = bmiModel.data?.bmi ?? 0.0;

    if (bmi < 18.5) {
      return 'Under Weight';
    } else if (bmi < 25) {
      return 'Normal Weight';
    } else if (bmi < 30) {
      return 'Over Weight';
    } else {
      return 'Obesity';
    }
  }

  String getBmiDescription() {
    double bmi = bmiModel.data?.bmi ?? 0.0;

    if (bmi < 18.5) {
      return 'Your BMI is less than 18.5';
    } else if (bmi < 25) {
      return 'Your BMI is in the normal range';
    } else if (bmi < 30) {
      return 'Your BMI is in the overweight range';
    } else {
      return 'Your BMI is in the obesity range';
    }
  }

  @override
  Widget build(BuildContext context) {
    int age = calculateAge();

    String name = bmiModel.name ?? 'Unknown';
    String gender = bmiModel.gender ?? 'Unknown';

    double bmi = bmiModel.data?.bmi ?? 0.0;

    String height = bmiModel.data?.height ?? '0';
    String weight = bmiModel.data?.weight ?? '0';

    String bmiCategory = getBmiCategory();
    String description = getBmiDescription();

    return Scaffold(
      backgroundColor: const Color(0xffF4F6FF),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),

          child: Column(
            children: [
              const SizedBox(height: 20),

              // =============================================================
              // TOP RESULT CARD
              // =============================================================

              Container(
                width: double.infinity,
                height: 330,

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
                        "$name ($gender)",

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
                        "$age years old.",

                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    // BMI
                    Positioned(
                      left: 50,
                      top: 110,

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

                          Transform.translate(
                            offset: const Offset(0, -2),

                            child: const Text(
                              "BMI Calc",

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
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
                            "$height ",

                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 3),

                          const Text(
                            "Height",

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // VERTICAL DIVIDER
                    Positioned(
                      left: 89,
                      bottom: 16,

                      child: Container(
                        width: 2,
                        height: 55,
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
                            "$weight ",

                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 3),

                          const Text(
                            "Weight",

                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
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

              Expanded(
                child: Container(
                  width: double.infinity,

                  padding: const EdgeInsets.all(15),

                  decoration: BoxDecoration(
                    color: const Color(0xff006039),
                    borderRadius: BorderRadius.circular(15),
                  ),

                  child: SingleChildScrollView(
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
                ),
              ),

              const SizedBox(height: 15),

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

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

