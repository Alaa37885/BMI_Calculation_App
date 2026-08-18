import 'package:flutter/material.dart';

class CalculationScreen extends StatelessWidget {
  const CalculationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),

        title: const Text("BMI", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xff01502EE5)),),

      ),
      body: Center(child: Text("Cal Screen" ,

      )),

    );
  }
}
