import 'package:dream_calc/calcs/cubicCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class cubicCalc extends StatefulWidget {
  const cubicCalc({Key key}) : super(key: key);

  @override
  _cubicCalcState createState() => _cubicCalcState();
}

class _cubicCalcState extends State<cubicCalc> {
  
  Widget myCubicText(String text, {double fontSize = 20}){
    return FittedBox(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
        ),
      ),
    );
  }

  Widget myCubicTextField(TextEditingController cont){
    return Expanded(
      flex: 1,
      child: TextField(
        textAlign: TextAlign.center,
        controller: cont,
        keyboardType: TextInputType.number,
        enableInteractiveSelection: true,
        inputFormatters: [
          FilteringTextInputFormatter(RegExp('[0-9-]'), allow: true),
        ],
        decoration: myInputDecoration(),
      ),
    );
  }

  Widget myCubicAnswerRow(String item, String answer){
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(),
              color: Colors.white,
            ),
            child: Text(
              item,
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(),
              color: Colors.white,
            ),
            child: Center(
              child: Text(
                answer,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  TextEditingController userInputA = new TextEditingController();
  TextEditingController userInputB = new TextEditingController();
  TextEditingController userInputC = new TextEditingController();
  TextEditingController userInputD = new TextEditingController();
  List<String> answers = ['','','',''];
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("CUBIC EQUATION"),
        body: SingleChildScrollView(
            child : Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Column(
                children : [
                  Center(
                    child: myCubicText('ax³ + bx² + cx + d = 0', fontSize: 30)
                  ),
                  SizedBox(height: 2,),
                  // Text(
                  //   'Please note that d is an integer',
                  //   style: TextStyle(
                  //     fontSize: 15
                  //   ),
                  // ),
                  SizedBox(height: 30,),
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          myCubicText('a : '),
                          SizedBox(width: 5,),
                          myCubicTextField(userInputA),
                          SizedBox(width: 20,),
                          myCubicText('b : '),
                          SizedBox(width: 5,),
                          myCubicTextField(userInputB),
                          SizedBox(width: 5,)
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          myCubicText('c : '),
                          SizedBox(width: 5,),
                          myCubicTextField(userInputC),
                          SizedBox(width: 20,),
                          myCubicText('d : '),
                          SizedBox(width: 5,),
                          myCubicTextField(userInputD),
                          SizedBox(width: 5,)
                        ],
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: myButtonStyle,
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          setState(() {
                            answers = cubeCalc(userInputA.text, userInputB.text, userInputC.text, userInputD.text);
                          });
                        },
                        child: Text(
                          "CALCULATE",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      myCubicAnswerRow('Root 1 : ', answers[0]),
                      myCubicAnswerRow('Root 2 : ', answers[1]),
                      myCubicAnswerRow('Root 3 : ', answers[2]),
                      myCubicAnswerRow('Disc : ', answers[3]),
                    ],
                  )
                ],
              ),

            )
        ),
      ),
    );
  }
}
