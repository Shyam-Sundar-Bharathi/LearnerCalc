import 'dart:core';
import 'package:catex/catex.dart';
import 'package:dream_calc/calcs/circleCalcs/centerRadiusCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class circleCenterRadius extends StatefulWidget {
  @override
  _circleCenterRadiusState createState() => _circleCenterRadiusState();
}

class _circleCenterRadiusState extends State<circleCenterRadius> {

  TextEditingController x = new TextEditingController();
  TextEditingController y = new TextEditingController();
  TextEditingController r = new TextEditingController();

  String choice = '';
  String result = '';

  Widget myCircleButton(String ch, String text, int fn){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            choice = ch;
            result = cirlceCenterRadiusChoice(x.text, y.text, r.text, fn);
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
              SizedBox(height: 20,),
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myCircleText('x : '),
                      SizedBox(width: 5,),
                      myCircleTextField(x),
                      SizedBox(width: 5,),
                      myCircleText('y : '),
                      SizedBox(width: 5,),
                      myCircleTextField(y),
                      SizedBox(width: 5,),
                      myCircleText('r : '),
                      SizedBox(width: 5,),
                      myCircleTextField(r),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myCircleButton('', 'EQUATION', 0),
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
                  SizedBox(height: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myCatexDisplayCard("Center => (x,y)"),
                      SizedBox(height: 10,),
                      myCatexDisplayCard("Radius => r"),
                    ],
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


