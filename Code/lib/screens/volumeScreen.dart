import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/calcs/volumeCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class volumeCalc extends StatefulWidget {
  @override
  _volumeCalcState createState() => _volumeCalcState();
}

class _volumeCalcState extends State<volumeCalc> {

  var choice = "Answer";
  var result = " ";
  TextEditingController userInput = new TextEditingController();
  String dropDownValue = "CUBE";
  List<String> shapesAvailable = ['CUBE','SPHERE','CUBOID','CYLINDER','CONE','HEMISPHERE','TETRAHEDRON'];
  Map disp = {
    'CUBE' : "Enter side length",
    'SPHERE' : "Enter radius",
    'CUBOID' : "Enter length, breadth, height (comma separated)",
    'CONE' : "Enter base radius, height (comma separated)",
    'CYLINDER' : "Enter base radius, height (comma separated)",
    'HEMISPHERE' : "Enter radius",
    'TETRAHEDRON' : "Enter side length"
  };

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("VOLUME"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: userInput,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.text,
                  enableInteractiveSelection: true,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp('[0-9,.]'), allow: true),
                  ],
                  cursorColor: Colors.black,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500
                  ),
                  decoration: InputDecoration(
                    labelText: "${disp[dropDownValue]}",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                    alignLabelWithHint: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: myButtonStyle,
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {
                      result = volume(userInput.text, dropDownValue);
                    });
                  },
                  child: Text(
                    "VOLUME",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 40),
                myDropDownBox(context,
                child: DropdownButton<String>(
                  value: dropDownValue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                  underline: Container(
                    color: colors[colorTheme][1],
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropDownValue = newValue;
                      result = " ";
                      userInput.text = "";
                    });
                  },
                  items: shapesAvailable.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                ),
                SizedBox(height: 50),
                result == " "? Container() :
                myResultCard(
                  child: Container(
                      width: MediaQuery. of(context). size. width - 30,
                      height: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FittedBox(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                "VOLUME OF $dropDownValue",
                                style: TextStyle(
                                    fontSize: 20,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
