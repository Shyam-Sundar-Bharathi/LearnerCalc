import 'dart:core';
import 'package:catex/catex.dart';
import 'package:dream_calc/calcs/progressionsCalcs/harmonicCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class harmonicProgression extends StatefulWidget {
  @override
  _harmonicProgressionState createState() => _harmonicProgressionState();
}

class _harmonicProgressionState extends State<harmonicProgression> {

  TextEditingController a = new TextEditingController();
  TextEditingController d = new TextEditingController();
  TextEditingController n = new TextEditingController();

  String choice = '';
  String result = '';

  Widget myHarmonicButton(String ch, String text, int fn){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            choice = ch;
            result = harmonicChoice(a.text, d.text, n.text, fn);
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

  Widget myHarmonicText(String text, {double fontSize = 25}){
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

  Widget myHarmonicTextField(TextEditingController cont, {String regExp = '[0-9.-]', bool lastBox = false}){
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
        appBar: myAppBar("HARMONIC"),
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
                      myHarmonicText('a : '),
                      SizedBox(width: 5,),
                      myHarmonicTextField(a),
                      SizedBox(width: 5,),
                      myHarmonicText('d : '),
                      SizedBox(width: 5,),
                      myHarmonicTextField(d),
                      SizedBox(width: 5,),
                      myHarmonicText('n : '),
                      SizedBox(width: 5,),
                      myHarmonicTextField(n, regExp: '[0-9]'),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myHarmonicButton('a_n', 'nᵗʰ TERM', 0),
                      SizedBox(width: 20,),
                      myHarmonicButton('S_n', 'SUM UPTO n TERMS', 1),
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
                              child : CaTeX(result == "INPUT" ? result :
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


