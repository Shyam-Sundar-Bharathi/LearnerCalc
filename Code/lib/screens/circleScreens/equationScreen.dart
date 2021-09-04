import 'dart:core';
import 'package:catex/catex.dart';
import 'package:dream_calc/calcs/circleCalcs/equationCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class circleEquation extends StatefulWidget {
  @override
  _circleEquationState createState() => _circleEquationState();
}

class _circleEquationState extends State<circleEquation> {

  TextEditingController a = new TextEditingController();
  TextEditingController b = new TextEditingController();
  TextEditingController c = new TextEditingController();
  TextEditingController d = new TextEditingController();

  String choice = '';
  String result = '';

  Widget myCirlceButton(String ch, String text, int fn){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            choice = ch;
            result = circleEquationChoice(a.text, b.text, c.text, d.text, fn);
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

  Widget myCircleText(String text, {double fontSize = 25}){
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

  Widget myCircleTextField(TextEditingController cont, {String regExp = '[0-9.-]', bool lastBox = false}){
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
        appBar: myAppBar("CIRCLE"),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Column(
                children: [
                 myCatexDisplayCard('ax^2 + ay^2 + bx + cy + d = 0'),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myCircleText('a : '),
                      SizedBox(width: 5,),
                      myCircleTextField(a),
                      SizedBox(width: 20,),
                      myCircleText('b : '),
                      SizedBox(width: 5,),
                      myCircleTextField(b),
                      SizedBox(width: 5,)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myCircleText('c : '),
                      SizedBox(width: 5,),
                      myCircleTextField(c),
                      SizedBox(width: 20,),
                      myCircleText('d : '),
                      SizedBox(width: 5,),
                      myCircleTextField(d),
                      SizedBox(width: 5,)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myCirlceButton('C', 'CENTER', 0),
                      SizedBox(width: 20,),
                      myCirlceButton('r', 'RADIUS', 1),
                    ],
                  ),
                  SizedBox(height: 20,),
                  myClearButton((){
                    setState(() {
                      a.text = "";
                      b.text = "";
                      c.text = "";
                      d.text = "";
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
                              child : result == "CHECK INPUT" || result == "IMPOSSIBLE CIRCLE" ? Text(result) :
                              CaTeX(choice == '' ? result : "$choice = $result"),
                              style: TextStyle(
                                color: result == "CHECK INPUT" || result == "IMPOSSIBLE CIRCLE" ? Colors.red : Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
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


