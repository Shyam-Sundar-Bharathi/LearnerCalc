import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/calcs/areaCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class areaCalc extends StatefulWidget {
  @override
  _areaCalcState createState() => _areaCalcState();
}

class _areaCalcState extends State<areaCalc> {

  var choice = " ";
  var result = " ";
  TextEditingController userInput = new TextEditingController();
  String dropDownValue = "SQUARE";
  Map disp = {
    'SQUARE' : "Enter side length",
    'CIRCLE' : "Enter radius",
    'RECTANGLE' : "Enter length, breadth (comma separated)",
    'TRIANGLE' : "Enter base, height or sides a,b,c (comma separated)",
    'PARALLELOGRAM' : "Enter base, height (comma separated)",
    'RHOMBUS' : "Enter diagonal 1, diagonal 2 (comma separated)",
    'TRAPEZIUM' : "Enter height, base 1, base 2 (comma separated)",
    'ELLIPSE' : "Enter a,b (comma separated)",
    'CUBE' : "Enter side length",
    'CUBOID' : "Enter length, breadth, height (comma separated)",
    'SPHERE' : "Enter radius",
    'CONE' : "Enter base radius, slant height (comma separated)",
    'CYLINDER' : "Enter base radius, height (comma separated)",
    'HEMISPHERE' : "Enter radius"
  };

  bool is3d(String s){
    if(s == "CUBE" || s == "CUBOID" ||s == "SPHERE" ||s == "CONE" ||s == "CYLINDER" || s=="HEMISPHERE")
      return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("AREA"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: userInput,
                  keyboardType: TextInputType.text,
                  enableInteractiveSelection: true,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp('[0-9,.]'), allow: true),
                  ],
                  decoration: InputDecoration(
                    labelText: "${disp[dropDownValue]}",
                    labelStyle: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: myButtonStyle,
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {
                      result = area(userInput.text, dropDownValue);
                    });
                  },
                  child: FittedBox(
                    child: Text(
                      "AREA",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                DropdownButton<String>(
                  value: dropDownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 72,
                  elevation: 16,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropDownValue = newValue;
                      userInput.text = "";
                      result = "";
                    });
                  },
                  items: <String>['SQUARE','CIRCLE','RECTANGLE','TRIANGLE','PARALLELOGRAM','RHOMBUS','TRAPEZIUM','ELLIPSE','CUBE','SPHERE','CUBOID','CYLINDER','CONE', 'HEMISPHERE'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 50),
                result  == " "? Container() :
                Container(
                    width: MediaQuery. of(context). size. width - 30,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      color: Colors.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              is3d("$dropDownValue")? "SURFACE AREA OF $dropDownValue" : "AREA OF $dropDownValue",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              result,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
