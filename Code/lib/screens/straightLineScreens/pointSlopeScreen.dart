import 'dart:core';
import 'package:catex/catex.dart';
import 'package:dream_calc/calcs/straightLineCalcs/pointSlopeCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class straightLinePointSlope extends StatefulWidget {
  @override
  _straightLinePointSlopeState createState() => _straightLinePointSlopeState();
}

class _straightLinePointSlopeState extends State<straightLinePointSlope> {

  TextEditingController x = new TextEditingController();
  TextEditingController y = new TextEditingController();
  TextEditingController m = new TextEditingController();

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
            result = straightLinePointSlopeChoice(x.text, y.text, m.text, fn);
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
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myStraightLineText('x : '),
                      SizedBox(width: 5,),
                      myStraightLineTextField(x),
                      SizedBox(width: 5,),
                      myStraightLineText('y : '),
                      SizedBox(width: 5,),
                      myStraightLineTextField(y),
                      SizedBox(width: 5,),
                      myStraightLineText('m : '),
                      SizedBox(width: 5,),
                      myStraightLineTextField(m, lastBox: true),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myStraightLineButton('', 'EQUATION', 0),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myStraightLineButton('x', 'X - INTERCEPT', 1),
                      SizedBox(width: 20,),
                      myStraightLineButton('y', 'Y - INTERCEPT', 2),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myStraightLineButton('', 'ANGLE WITH X-AXIS', 3),
                      SizedBox(width: 20,),
                      myStraightLineButton('', 'ANGLE WITH Y-AXIS', 4),
                    ],
                  ),
                  SizedBox(height: 20,),
                  myClearButton((){
                    setState(() {
                      x.text = "";
                      y.text = "";
                      m.text = "";
                      choice = "";
                      result = "";
                    });
                  }),
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
                              child : result == "CHECK INPUT" ? Text(result) :
                              CaTeX(choice == '' ? result : "$choice = $result"),
                              style: TextStyle(
                                color: result == "CHECK INPUT"? Colors.red : Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     myCatexDisplayCard("Point => (x,y)"),
                  //     SizedBox(height: 10,),
                  //     myCatexDisplayCard("Slope => m"),
                  //   ],
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


