// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bmi/widgets/left_bar.dart';
import 'package:bmi/widgets/right_bar.dart';
import 'package:bmi/constants/app_constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String in1 = "";
  final TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(fontSize: 30,color: accentColor, fontWeight: FontWeight.w400),
        ),
        backgroundColor: appBarColor,
        elevation: 0,
        centerTitle: true,
      ),
      backgroundColor: mainColor,
      body: SingleChildScrollView(// scrolling page
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),

            Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 130,
                  child: TextField(
                  textAlign: TextAlign.center,
                    controller: _heightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8))),
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: _weightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentColor),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(0.8))),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);
                  if(_bmiResult > 25){
                    _textResult = "You\'re over weight";
                  }
                  else if(_bmiResult >= 18.5 && _bmiResult <= 25){
                    _textResult = "You have normal weight";
                  }
                  else if(_bmiResult <= 18.5){
                    _textResult = "You\'re under weight";
                  }
                });
              },
              child: Text(
                "Calculate",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: accentColor),
              ),
            ),

            SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: (){
                setState(() {

                });
              },
              child: Text(
                "Reset",
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepOrange
                ),
              ),
            ),

            SizedBox(
              height: 50,
            ),
            Text(
              _bmiResult.toStringAsFixed(2),
              style: TextStyle(
                  fontSize: 90,
                  fontWeight: FontWeight.bold,
                  color: accentColor),
            ),
            // SizedBox(
            //   height: 50,
            // ),
            // Text(
            //
            //   "Calculate",
            //   style: TextStyle(
            //       fontSize: 22,
            //       fontWeight: FontWeight.bold,
            //       color: accentColor),
            // ),

            SizedBox(
              height: 50,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Text(
                _textResult,
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                    color: accentColor),
              ),
            ),


            SizedBox(height: 10,),
            RightBar(barWidth: 40,),

            SizedBox(height: 20,),
            RightBar(barWidth: 70,),

            SizedBox(height: 20,),
            RightBar(barWidth: 40,),

            SizedBox(height: 20,),
            LeftBar(barWidth: 70,),

            SizedBox(height: 50,),
            LeftBar(barWidth: 70,),

          ],
        ),
      ),
    );
  }
}
