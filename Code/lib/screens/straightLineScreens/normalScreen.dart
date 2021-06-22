import 'dart:core';
import 'package:catex/catex.dart';
import 'package:dream_calc/calcs/straightLineCalcs/normalCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class straightLineNormal extends StatefulWidget {
  @override
  _straightLineNormalState createState() => _straightLineNormalState();
}

class _straightLineNormalState extends State<straightLineNormal> {

  Widget myTrigCard({Widget child}){
    return Card(
      color: colors[colorTheme][8],
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: child,
      ),
    );
  }

  Widget myTrigFootNotes(String text){
    return FittedBox(
      child: DefaultTextStyle(
        child: CaTeX(text),
        style: TextStyle(
            fontSize: 30,
            color: Colors.white
        ),
      ),
    );
  }

  TextEditingController length = new TextEditingController();
  TextEditingController angle = new TextEditingController();

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
            result = straightLineNormalChoice(length.text, angle.text,fn);
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
              SizedBox(height: 20,),
              Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myCatexDisplayCard("Distance => l"),
                      SizedBox(height: 10,),
                      myCatexDisplayCard(r"Angle => \theta"),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myStraightLineText(r'l\ : '),
                      SizedBox(width: 5,),
                      myStraightLineTextField(length),
                      SizedBox(width: 20,),
                      myStraightLineText(r'\theta\degree : '),
                      SizedBox(width: 5,),
                      myStraightLineTextField(angle),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myStraightLineButton('m', 'SLOPE', 0),
                      SizedBox(width: 20,),
                      myStraightLineButton('', 'EQUATION', 1),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myStraightLineButton('x', 'X - INTERCEPT', 2),
                      SizedBox(width: 20,),
                      myStraightLineButton('y', 'Y - INTERCEPT', 3),
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
                            child: DefaultTextStyle(
                              child: CaTeX(result == "INPUT" ? result :
                              choice == '' ? result :
                              "$choice = $result"),
                              style: TextStyle(
                                color: result == "INPUT" ? Colors.red : Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40,),
                  myTrigCard(
                    child: Container(
                      //width: MediaQuery.of(context).size.width-30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5,),
                          myTrigFootNotes(r'0.7071 = \frac{1}{\sqrt{2}}'),
                          SizedBox(height: 10,),
                          myTrigFootNotes(r'0.8660 = \frac{\sqrt{3}}{2}'),
                          SizedBox(height: 10,),
                          myTrigFootNotes(r'0.5774 = \frac{1}{\sqrt{3}}'),
                          SizedBox(height: 10,),
                          myTrigFootNotes(r'1.4142 = \sqrt{2}'),
                          SizedBox(height: 10,),
                          myTrigFootNotes(r'1.1547 = \frac{2}{\sqrt{3}}'),
                          SizedBox(height: 10,),
                          myTrigFootNotes(r'1.7321 = \sqrt{3}'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


