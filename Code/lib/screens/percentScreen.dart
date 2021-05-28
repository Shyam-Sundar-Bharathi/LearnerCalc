import 'dart:core';
import 'package:dream_calc/calcs/percentCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class percentCalc extends StatefulWidget {
  @override
  _percentCalcState createState() => _percentCalcState();
}

class _percentCalcState extends State<percentCalc> {

  TextEditingController userInputOne = new TextEditingController();
  TextEditingController userInputTwo = new TextEditingController();
  TextEditingController userInputThree = new TextEditingController();
  TextEditingController userInputFour = new TextEditingController();
  String answer1 = ' ';
  String answer2 = ' ';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
      FocusScope.of(context).requestFocus(FocusNode());
    },
    child: Scaffold(
      backgroundColor: colors[colorTheme][2],
        appBar: AppBar(
          backgroundColor: colors[colorTheme][9],
          title: Text(
            'PERCENTAGE',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              color: colors[colorTheme][1],
            ),
          ),
        ),
      //drawer: myDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                SizedBox(height: 50,),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (text){
                          setState(() {
                            answer1 = percentOne(userInputOne.text,userInputTwo.text);
                          });
                        },
                        controller: userInputOne,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        enableInteractiveSelection: true,
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9,. ]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelText: "Enter",
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        "  % of  ",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (text){
                          setState(() {
                            answer1 = percentOne(userInputOne.text,userInputTwo.text);
                          });
                        },
                        controller: userInputTwo,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.]'), allow: true),
                        ],
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelText: "Enter",
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                FittedBox(
                  child:
                  Text(
                    'is',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        answer1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 150,),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (text){
                          setState(() {
                            answer2 = percentTwo(userInputThree.text,userInputFour.text);
                          });
                        },
                        textAlign: TextAlign.center,
                        controller: userInputThree,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9,. ]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelText: "Enter",
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      "  of  ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (text){
                          setState(() {
                            answer2 = percentTwo(userInputThree.text,userInputFour.text);
                          });
                        },
                        textAlign: TextAlign.center,
                        controller: userInputFour,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9,. ]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelText: "Enter",
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  "  is  ",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        answer2 == ' '? answer2 : answer2 + " %",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
    );
}
}


