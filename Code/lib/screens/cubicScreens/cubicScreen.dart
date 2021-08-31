import 'package:dream_calc/calcs/cubicCalcs/cubicCalc.dart';
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
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget myCubicTextField(TextEditingController cont, {String regExp = '[0-9.-]', bool lastBox = false}){
    return Expanded(
      flex: 1,
      child: TextField(
        textAlign: TextAlign.center,
        controller: cont,
        cursorColor: colors[colorTheme][9],
        style: TextStyle(fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        textInputAction: lastBox ? TextInputAction.done : TextInputAction.next,
        enableInteractiveSelection: true,
        inputFormatters: [
          FilteringTextInputFormatter(RegExp(regExp), allow: true),
        ],
        decoration: myInputDecoration(),
      ),
    );
  }

  Widget myCubicAnswerRow(String item, String answer,{topBlock=0, bottomBlock=0, isDisc=0}){
    return Row(
      children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            height: 70,
            child: FittedBox(
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 70,
            child: Center(
              child: Text(
                answer,
                style: TextStyle(
                  color: answer == "CHECK INPUT" || answer == "a CAN'T BE 0" ? Colors.red :
                  answer.contains("i") || isDisc ==1 ? Colors.black : Colors.green,
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
    SystemChrome.setEnabledSystemUIOverlays([]);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("CUBIC EQUATION"),
        body: SingleChildScrollView(
            child : Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                children : [
                  myCatexDisplayCard("ax^3 + bx^2 + cx + d = 0"),
                  SizedBox(height: 10,),
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
                          myCubicTextField(userInputD, regExp: '[0-9-]', lastBox: true),
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
                  answers[0] == ''? Container() :
                  myResultCard(
                    child: Column(
                      children: [
                        myCubicAnswerRow(' Root 1 : ', answers[0], topBlock: 1),
                        myCubicAnswerRow(' Root 2 : ', answers[1]),
                        myCubicAnswerRow(' Root 3 : ', answers[2]),
                        myCubicAnswerRow(' Disc : ', answers[3], bottomBlock: 1, isDisc: 1),
                      ],
                    ),
                  )
                ],
              ),

            )
        ),
      ),
    );
  }
}
