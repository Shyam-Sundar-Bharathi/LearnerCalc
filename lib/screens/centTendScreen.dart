
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/calcs/centTendCalc.dart';
import 'package:dream_calc/screens/genScreen.dart';
class centTendCalc extends StatefulWidget {
  @override
  _centTendCalcState createState() => _centTendCalcState();
}

class _centTendCalcState extends State<centTendCalc> {

  var choice = " ";
  var result = " ";
  TextEditingController userInput = new TextEditingController();

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
            "CENTRAL TENDENCY",
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
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  enableInteractiveSelection: true,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp('[0-9,.]'), allow: true),
                  ],
                  decoration: InputDecoration(
                    labelText: "Enter comma separated numbers",
                    labelStyle: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                        minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          choice = "MEAN";
                          result = centTend(userInput.text,0);
                        });
                      },
                      child: Text(
                        "MEAN",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                        minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          choice = "MEDIAN";
                          result = centTend(userInput.text,1);
                        });
                      },
                      child: Text(
                        "MEDIAN",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                        minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          choice = "MODE";
                          result = centTend(userInput.text,2);
                        });
                      },
                      child: Text(
                        "MODE",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                        minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          choice = "STANDARD DEVIATION";
                          result = centTend(userInput.text,3);
                        });
                      },
                      child: Text(
                        "STANDARD DEVIATION",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                        minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          choice = "VARIANCE";
                          result = centTend(userInput.text,4);
                        });
                      },
                      child: Text(
                        "VARIANCE",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                        minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          choice = "CV";
                          result = centTend(userInput.text,5);
                        });
                      },
                      child: Text(
                        "CO-EFFICIENT OF VARIATION",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                        minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          choice = "RANGE";
                          result = centTend(userInput.text, 6);
                        });
                      },
                      child: Text(
                        "RANGE",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                        minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          choice = "GM";
                          result = centTend(userInput.text,7);
                        });
                      },
                      child: Text(
                        "GEOMETRIC MEAN",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                        minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          choice = "HM";
                          result = centTend(userInput.text, 8);
                        });
                      },
                      child: Text(
                        "HARMONIC MEAN",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 40),
                Text(
                  choice,
                  style: TextStyle(
                    fontSize: 30,
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
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}