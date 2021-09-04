
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/calcs/centTendCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class centTendCalc extends StatefulWidget {
  @override
  _centTendCalcState createState() => _centTendCalcState();
}
class _centTendCalcState extends State<centTendCalc> {

  Widget myCentTendButton(String ch, String text, int fn){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            choice = ch;
            result = centTendChoice(userInput.text,fn);
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("STATISTICS"),
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
                    FilteringTextInputFormatter(RegExp('[0-9,.]'), allow: true),
                  ],
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500
                  ),
                  decoration: InputDecoration(
                    labelText: "Enter comma separated positive numbers",
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
                    myCentTendButton("AM", "ARITHMETIC\n      MEAN", 0),
                    SizedBox(width: 10),
                    myCentTendButton("GM","GEOMETRIC\n     MEAN",7),
                    SizedBox(width: 10),
                    myCentTendButton("HM","HARMONIC\n    MEAN",8),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myCentTendButton("MEDIAN", "MEDIAN", 1),
                    SizedBox(width: 10),
                    myCentTendButton("MODE", "MODE", 2),
                    SizedBox(width: 10),
                    myCentTendButton("RANGE", "RANGE", 6),
                    SizedBox(width: 10,),
                    myCentTendButton("COUNT OF ELEMENTS", "COUNT", 11),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myCentTendButton("POP. VARIANCE","POPULATION\n  VARIANCE",9),
                    SizedBox(width: 10),
                    myCentTendButton("SMP. VARIANCE", "  SAMPLE\nVARIANCE", 4),
                    SizedBox(width: 10,),
                    myCentTendButton("CV", "CO-EFFICIENT\nOF VARIATION", 5),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    myCentTendButton("POP. STD. DEVIATION", "        POPULATION\nSTANDARD DEVIATION", 10),
                    SizedBox(width: 10),
                    myCentTendButton("SMP. STD. DEVIATION", "             SAMPLE\nSTANDARD DEVIATION", 3),
                  ],
                ),
                SizedBox(height: 20),
                myClearButton((){
                  setState(() {
                    userInput.text = "";
                    choice = " ";
                    result = " ";
                  });
                }),
                SizedBox(height: 20),
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
                            result == "CHECK INPUT" || result == "INPUT CAN'T CONTAIN 0" ? result :
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
