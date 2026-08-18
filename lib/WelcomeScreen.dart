import 'package:bmi_aug/CalculationScreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Image.asset("assets/images/Illustration.png"),
          // image
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 45),
            height: 400,
            decoration: BoxDecoration(
              color: Color(0xff7876CD),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Text("Know Your Body Better ,Get Your BMI Score in Less Than a Minute!",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white,),
                ),
                SizedBox(height: 24),
                Text("It takes just 30 seconds – and your health is worth it!",
                  style: TextStyle(fontSize:18 , fontWeight: FontWeight.w400, color: Color(0xffF8F9FFE5),),
                ),
                SizedBox(height: 24),

                Divider(),

                SizedBox(height: 24),
                SizedBox(
                  width: 390,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(9),
                      ),
                      backgroundColor: Color(0xff484783),
                    ),
                    onPressed: () {
                      onGetStarted(context);
                    },
                    child: Text("Get Started",
                      style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white,),
                    ),
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onGetStarted(BuildContext context) {
    // push
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CalculationScreen()),
    );

  }
}
