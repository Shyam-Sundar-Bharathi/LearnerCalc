import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/calcs/areaCalc.dart';
import 'package:dream_calc/screens/genScreen.dart';


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
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: AppBar(
          title: Text(
            "AREA",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              color: colors[colorTheme][1],
            ),
          ),
          backgroundColor: colors[colorTheme][9],
        ),
        //drawer: myDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: userInput,
                  keyboardType: TextInputType.number,
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
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                    minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                  ),
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {
                      result = area(userInput.text, dropDownValue);
                    });
                  },
                  child: Text(
                    "AREA",
                    style: TextStyle(
                      color: Colors.black,
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
                    });
                  },
                  items: <String>['SQUARE','CIRCLE','RECTANGLE','TRIANGLE','PARALLELOGRAM','RHOMBUS'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 40),

                Text(
                  "AREA OF $dropDownValue",
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Center(
                    child: FittedBox(
                        child: Text(
                          result,
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
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