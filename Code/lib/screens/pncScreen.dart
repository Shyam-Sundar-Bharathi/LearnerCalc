import 'dart:core';
import 'package:catex/catex.dart';
import 'package:dream_calc/calcs/circleCalcs/centerRadiusCalc.dart';
import 'package:dream_calc/calcs/pncCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class permutationAndCombination extends StatefulWidget {
  @override
  _permutationAndCombinationState createState() => _permutationAndCombinationState();
}

class _permutationAndCombinationState extends State<permutationAndCombination> {

  TextEditingController n = new TextEditingController();
  TextEditingController r = new TextEditingController();

  String choice = '';
  String result = '';

  Widget myPnCButton(String ch, String text, int fn){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            choice = ch;
            result = pncChoice(n.text, r.text, fn);
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

  Widget myPnCText(String text, {double fontSize = 25}){
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

  Widget myPnCTextField(TextEditingController cont, {String regExp = '[0-9]', bool lastBox = false}){
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
        appBar: myAppBar("PERMUTATION COMBINATION"),
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
                      myPnCText('n : '),
                      SizedBox(width: 5,),
                      myPnCTextField(n),
                      SizedBox(width: 5,),
                      myPnCText('r : '),
                      SizedBox(width: 5,),
                      myPnCTextField(r,lastBox: true),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myPnCButton('n^r', 'PERMUTATION WITH REPETITION', 0),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myPnCButton('^nP_r', 'PERMUTATION WITHOUT REPETITION', 1),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myPnCButton('^{n+r-1}C_r', 'COMBINATION WITH REPETITION', 2),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myPnCButton('^nC_r', 'COMBINATION WITHOUT REPETITION', 3),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    //mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myPnCButton('n!', 'n !', 4),
                      SizedBox(width: 20,),
                      myPnCButton('r!', 'r !', 5),
                      SizedBox(width: 20,),
                      myPnCButton('( n - r ) !', '( n - r ) !', 6),
                    ],
                  ),
                  SizedBox(height: 20,),
                  myClearButton((){
                    setState(() {
                      n.text = "";
                      r.text = "";
                      choice = "";
                      result = "";
                    });
                  }),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


