
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/calcs/centTendCalc.dart';
import 'package:dream_calc/screens/menu.dart';
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

    Widget myCentTendButton(String ch, String text, int fn){
      return Expanded(
        child: ElevatedButton(
          style: myButtonStyle,
          onPressed: () {
            FocusScope.of(context).requestFocus(FocusNode());
            setState(() {
              choice = ch;
              result = centTend(userInput.text,fn);
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
                  keyboardType: TextInputType.text,
                  enableInteractiveSelection: true,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp('[0-9,.]'), allow: true),
                  ],
                  decoration: InputDecoration(
                    labelText: "Enter comma separated positive numbers",
                    labelStyle: TextStyle(
                      fontSize: 20.0,
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
                SizedBox(height: 50),
                result == " " ? Container() :
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          result == "CHECK INPUT" ? result :
                          choice == " " ? result :
                          "$choice = $result",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
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
