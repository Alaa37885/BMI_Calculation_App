import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({super.key});

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _birthDateController = TextEditingController();
  final TextEditingController _hightController = TextEditingController();
  final TextEditingController _WeightController = TextEditingController();



  var selected_gender = 0 ;  // male
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "BMI",
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xFF01502E),
            letterSpacing: 10,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Name ================================================================

              SizedBox(height: 26),

              Text(
                "Name",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight(500),
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                controller: _nameController,
                maxLength: 50,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "this is reqiered";
                  }
                  return null;
                },

                decoration: InputDecoration(
                  fillColor: Color(0x26B3B2EA),
                  filled: true,

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),


              //  Birth Date =========================================================

              SizedBox(height: 10),

              Text(
                "Birth Date",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight(500),
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                controller: _birthDateController,
                maxLength: 50,
                readOnly: true,
                onTap :()async{
                    var res = await showDatePicker(context: context, firstDate: DateTime(1850), lastDate: DateTime.now());
                    print("show");
                    if (res != null){
                       _birthDateController.text=res.toString();

                      }
                   } ,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "this is reqiered";
                  }
                  return null;
                },

                decoration: InputDecoration(
                  fillColor: Color(0x26B3B2EA),
                  filled: true,

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              //  Select Gender ======================================================
              Spacer(),
              Text(
                "Select Gender",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight(500),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      selected_gender = 0 ;
                      setState(() {
                      });
                    },
                    child: Container(
                      height: 120,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0x26B3B2EA),
                        border: selected_gender == 0
                            ? Border.all(
                          color: Color(0xff484783),
                          width: 3,
                        )
                            : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/Group.png",
                            height: 60,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ) ,


                  SizedBox(width: 30,),

                  GestureDetector(
                    onTap: (){
                      selected_gender = 0 ;
                      setState(() {

                      });
                    },
                    child: Container(
                      height: 120,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Color(0x26B3B2EA),
                        border: selected_gender == 1
                            ? Border.all(
                          color: Color(0xff484783),
                          width: 3,
                        )
                            : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/female.png",
                            height: 60,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ) ,

              //  Your Hight(CM) =====================================================

              SizedBox(height: 10,),
              Text(
                "Your Hight(CM)",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight(500),
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                controller: _hightController,
                maxLength: 50,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "this is reqiered";
                  }
                  return null;
                },

                decoration: InputDecoration(
                  suffixIcon: GestureDetector(onTap: (){
                    // var x = int.parse(_hightController)
                  } ,child: Icon (Icons.add, size :26 ,color: Colors.black, )),
                  prefixIcon: GestureDetector(onTap: (){},child: Icon (Icons.remove, size :26 ,color: Colors.black, ),),
                  fillColor: Color(0x26B3B2EA),
                  filled: true,

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              //  Your Weight(KG) ====================================================
              SizedBox(height: 10,),
              Text("Your Weight(KG)",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight(500),
                ),
              ),

              SizedBox(height: 10),

              TextFormField(
                controller: _WeightController,
                maxLength: 50,

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "this is reqiered";
                  }
                  return null;
                },

                decoration: InputDecoration(
                  suffixIcon: GestureDetector(onTap: (){
                    // var x = int.parse(_hightController)
                  } ,child: Icon (Icons.add, size :26 ,color: Colors.black, )),
                  prefixIcon: GestureDetector(onTap: (){},child: Icon (Icons.remove, size :26 ,color: Colors.black, ),),
                  fillColor: Color(0x26B3B2EA),
                  filled: true,

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              //  ElevatedButton ====================================================

              SizedBox(height: 50 ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9),
                  ),
                  backgroundColor: Color(0xff484783),
                  minimumSize: Size(double.infinity, 40),
                ),

                onPressed: () {},

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Calculate BMI",
                      style: TextStyle(fontSize: 20, color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}