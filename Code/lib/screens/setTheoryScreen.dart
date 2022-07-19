import 'dart:core';
import 'package:catex/catex.dart';
import 'package:dream_calc/calcs/straightLineCalcs/pointSlopeCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class setTheory extends StatefulWidget {
  @override
  _setTheoryState createState() => _setTheoryState();
}

class _setTheoryState extends State<setTheory> {

  TextEditingController a = new TextEditingController();
  TextEditingController b = new TextEditingController();
  TextEditingController u = new TextEditingController();

  String choice = '';
  String result = '';

  Widget mySetTheoryButton(String ch, String text, int fn){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            choice = ch;
            result = straightLinePointSlopeChoice(a.text, b.text, u.text, fn);
          });
        },
        child: FittedBox(
          child: DefaultTextStyle(
            child: CaTeX(text),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget mySetTheoryText(String text, {double fontSize = 25}){
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

  Widget mySetTheoryField(TextEditingController cont, {String regExp = '[0-9.-]', bool lastBox = false}){
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
        appBar: myAppBar("SET THEORY"),
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
                      mySetTheoryText('A : '),
                      SizedBox(width: 5,),
                      mySetTheoryField(a),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mySetTheoryText('B : '),
                      SizedBox(width: 5,),
                      mySetTheoryField(b),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mySetTheoryText('U : '),
                      SizedBox(width: 5,),
                      mySetTheoryField(u),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("A union between A, B, and U will be obtained and considered U (universal set) for sanctity purpose. (U can be left empty if not needed)"),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mySetTheoryButton(r"A \cup B", r"A \cup B", 0),
                      SizedBox(width: 20,),
                      mySetTheoryButton(r"A \cap B", r"A \cap B", 1),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mySetTheoryButton(r"A - B", r"A - B", 2),
                      SizedBox(width: 20,),
                      mySetTheoryButton(r"B - A", r"B - A", 3),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mySetTheoryButton(r"(A \cup B)^{C}", r"(A \cup B)^{C}", 4),
                      SizedBox(width: 20,),
                      mySetTheoryButton(r"(A \cap B)^{C}", r"(A \cap B)^{C}", 5),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mySetTheoryButton(r"A - (A \cap B)", r"A - (A \cap B)", 4),
                      SizedBox(width: 20,),
                      mySetTheoryButton(r"B - (A \cap B)", r"B - (A \cap B)", 5),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      mySetTheoryButton(r"A^{C}", r"A^{C}", 6),
                      SizedBox(width: 20,),
                      mySetTheoryButton(r"B^{C}", r"B^{C}", 7),
                    ],
                  ),
                  SizedBox(height: 20,),
                  myClearButton((){
                    setState(() {
                      a.text = "";
                      b.text = "";
                      u.text = "";
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


