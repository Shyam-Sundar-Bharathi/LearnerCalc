import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/calcs/lcmhcfCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class lcmhcfCalc extends StatefulWidget {
  @override
  _lcmhcfCalcState createState() => _lcmhcfCalcState();
}

class _lcmhcfCalcState extends State<lcmhcfCalc> {


  Widget mylcmhcfButton(String ch, String text, int fn){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            choice = ch;
            result = lcmhcfChoice(userInput.text, userInputf.text, fn);
          });
        },
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
  var choice = " ";
  var result = " ";
  TextEditingController userInput = new TextEditingController();
  TextEditingController userInputf = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("NUMBER THEORY"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: userInput,
                  keyboardType: TextInputType.text,
                  enableInteractiveSelection: true,
                  textAlign: TextAlign.center,
                  cursorColor: colors[colorTheme][9],
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp('[0-9,]'), allow: true),
                  ],
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                  ),
                  decoration: InputDecoration(
                    labelText: "Enter comma separated positive integers",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: colors[colorTheme][9]),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: colors[colorTheme][9]),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    mylcmhcfButton("LCM", "LCM", 0),
                    SizedBox(width: 20),
                    mylcmhcfButton("HCF", "HCF", 1),
                  ],
                ),
                SizedBox(height: 40),
                TextField(
                  controller: userInputf,
                  keyboardType: TextInputType.number,
                  enableInteractiveSelection: true,
                  cursorColor: colors[colorTheme][9],
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp('[0-9]'), allow: true),
                  ],
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                  ),
                  decoration: InputDecoration(
                    labelText: "Enter a positive integer",
                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1.5, color: colors[colorTheme][9]),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.5, color: colors[colorTheme][9]),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   mylcmhcfButton(" ", "FACTORS", 2),
                   SizedBox(width: 20),
                   mylcmhcfButton(" ", "   PRIME\nFACTORS", 3),
                   SizedBox(width: 20),
                   mylcmhcfButton(" ", "IS PRIME ?", 4),
                 ],
               ),
                SizedBox(height: 40),
                result == " " ? Container() :
                myResultCard(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 100,
                    child: Center(
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            result == "CHECK INPUT" || result == "INPUT CAN'T CONTAIN 0" ?
                            result :
                            choice == " " ? result :
                            "$choice = $result",
                            style: TextStyle(
                              color: result == "CHECK INPUT" || result == "INPUT CAN'T CONTAIN 0" ? Colors.red : Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
