import 'dart:core';
import 'package:catex/catex.dart';
import 'package:dream_calc/calcs/straightLineCalcs/twoPointCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class straightLineTwoPoint extends StatefulWidget {
  @override
  _straightLineTwoPointState createState() => _straightLineTwoPointState();
}

class _straightLineTwoPointState extends State<straightLineTwoPoint> {

  TextEditingController x1 = new TextEditingController();
  TextEditingController y1 = new TextEditingController();
  TextEditingController x2 = new TextEditingController();
  TextEditingController y2 = new TextEditingController();

  String choice = '';
  String result = '';

  Widget myStraightLineButton(String ch, String text, int fn){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
              choice = ch;
              result = straightLineTwoPointChoice(x1.text, y1.text, x2.text, y2.text, fn);
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

  Widget myStraightLineText(String text, {double fontSize = 25}){
    return FittedBox(
      child: DefaultTextStyle(
        child: CaTeX(text),
        style: TextStyle(
          color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget myStraightLineTextField(TextEditingController cont, {String regExp = '[0-9.-]', bool lastBox = false}){
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("STRAIGHT LINE"),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 30,),
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myStraightLineText('x_1 : '),
                      SizedBox(width: 5,),
                      myStraightLineTextField(x1),
                      SizedBox(width: 20,),
                      myStraightLineText('y_1 : '),
                      SizedBox(width: 5,),
                      myStraightLineTextField(y1),
                      SizedBox(width: 5,)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myStraightLineText('x_2 : '),
                      SizedBox(width: 5,),
                      myStraightLineTextField(x2),
                      SizedBox(width: 20,),
                      myStraightLineText('y_2 : '),
                      SizedBox(width: 5,),
                      myStraightLineTextField(y2),
                      SizedBox(width: 5,)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myStraightLineButton('SLOPE', 'SLOPE', 0),
                      SizedBox(width: 20,),
                      myStraightLineButton('', 'EQUATION', 1),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myStraightLineButton('X - INTERCEPT', 'X - INTERCEPT', 2),
                      SizedBox(width: 20,),
                      myStraightLineButton('Y - INTERCEPT', 'Y - INTERCEPT', 3),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myStraightLineButton('', 'ANGLE WITH X-AXIS', 4),
                      SizedBox(width: 20,),
                      myStraightLineButton('', 'ANGLE WITH Y-AXIS', 5),
                    ],
                  ),
                  SizedBox(height: 20,),
                  result == "" ? Container() :
                  myResultCard(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 200,
                      child: Center(
                        child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              result == "CHECK INPUT" ? result :
                              choice == '' ? result :
                              "$choice = $result",
                              style: TextStyle(
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
            ],
          ),
        ),
      ),
    );
  }
}


