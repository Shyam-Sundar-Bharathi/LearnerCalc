import 'package:dream_calc/services/formatNumber.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/calcs/volumeCalc.dart';
import 'package:dream_calc/screens/genScreen.dart';

class volumeCalc extends StatefulWidget {
  @override
  _volumeCalcState createState() => _volumeCalcState();
}

class _volumeCalcState extends State<volumeCalc> {

  var choice = "Answer";
  var result = " ";
  TextEditingController userInput = new TextEditingController();
  String dropDownValue = "CUBE";
  Map disp = {
    'CUBE' : "Enter side length",
    'SPHERE' : "Enter radius",
    'CUBOID' : "Enter length, breadth, height (comma separated)",
    'CONE' : "Enter base radius, height (comma separated)",
    'CYLINDER' : "Enter base radius, height (comma separated)",
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
            "Volume",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: colors[colorTheme][1],
            ),
          ),
          centerTitle: false,
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
                    setState(() {
                      result = volume(userInput.text, dropDownValue);
                    });
                  },
                  child: Text(
                    "VOLUME",
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
                  items: <String>['CUBE','SPHERE','CUBOID','CYLINDER','CONE'].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                SizedBox(height: 40),

                Text(
                  "VOLUME OF $dropDownValue",
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
                        result == " "? result : formatNumber(double.parse(result)),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
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
