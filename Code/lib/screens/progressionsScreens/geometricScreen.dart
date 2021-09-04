import 'dart:core';
import 'package:catex/catex.dart';
import 'package:dream_calc/calcs/progressionsCalcs/geometricCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class geometricProgression extends StatefulWidget {
  @override
  _geometricProgressionState createState() => _geometricProgressionState();
}

class _geometricProgressionState extends State<geometricProgression> {

  TextEditingController a = new TextEditingController();
  TextEditingController r = new TextEditingController();
  TextEditingController n = new TextEditingController();

  String choice = '';
  String result = '';

  Widget myGeometricButton(String ch, String text, int fn){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            choice = ch;
            result = geometricChoice(a.text, r.text, n.text, fn);
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

  Widget myGeometricText(String text, {double fontSize = 25}){
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

  Widget myGeometricTextField(TextEditingController cont, {String regExp = '[0-9.-]', bool lastBox = false}){
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
        appBar: myAppBar("GEOMETRIC"),
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
                      myGeometricText('a : '),
                      SizedBox(width: 5,),
                      myGeometricTextField(a),
                      SizedBox(width: 5,),
                      myGeometricText('r : '),
                      SizedBox(width: 5,),
                      myGeometricTextField(r),
                      SizedBox(width: 5,),
                      myGeometricText('n : '),
                      SizedBox(width: 5,),
                      myGeometricTextField(n, regExp: '[0-9]', lastBox: true),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myGeometricButton('a_n', 'nᵗʰ TERM', 0),
                      SizedBox(width: 20,),
                      myGeometricButton('S_n', 'SUM UPTO n TERMS', 1),
                    ],
                  ),
                  SizedBox(height: 20,),
                  myClearButton((){
                    setState(() {
                      a.text = "";
                      r.text = "";
                      n.text = "";
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
                  SizedBox(height: 20,),
                  // Column(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     myCatexDisplayCard(r"First\ Term => a"),
                  //     SizedBox(height: 10,),
                  //     myCatexDisplayCard(r"Common\ Ratio => r"),
                  //     SizedBox(height: 20,),
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


