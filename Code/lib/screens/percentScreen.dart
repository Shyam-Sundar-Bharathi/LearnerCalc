import 'dart:core';
import 'package:dream_calc/calcs/percentCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class percentCalc extends StatefulWidget {
  @override
  _percentCalcState createState() => _percentCalcState();
}

class _percentCalcState extends State<percentCalc> {

  Widget myPercentTextField(TextEditingController cont, func(String text)){
    return Expanded(
        child: TextField(
          onChanged: func,
          controller: cont,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          enableInteractiveSelection: true,
          inputFormatters: [
            FilteringTextInputFormatter(RegExp('[0-9. ]'), allow: true),
          ],
          decoration: myInputDecoration(labelText: "Enter"),
        ),
      );
  }

  Widget myPercentText(String text, {double fontSize = 25}){
    return FittedBox(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
  }

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
        appBar: myAppBar("PERCENTAGE"),
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
                    myPercentTextField(userInputOne, (text){
                      setState(() {
                        answer1 = percentOne(userInputOne.text,userInputTwo.text);
                      });
                    }),
                    myPercentText("  % of  "),
                    myPercentTextField(userInputTwo, (text){
                      setState(() {
                        answer1 = percentOne(userInputOne.text,userInputTwo.text);
                      });
                    }),
                  ],
                ),
                SizedBox(height: 20,),
                myPercentText('is'),
                SizedBox(height: 20,),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(),
                    borderRadius:  BorderRadius.all(Radius.circular(10.0)),
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
                    myPercentTextField(userInputThree, (text){
                      setState(() {
                        answer2 = percentTwo(userInputThree.text,userInputFour.text);
                      });
                    }),
                    myPercentText("  of  "),
                    myPercentTextField(userInputFour, (text){
                      setState(() {
                        answer2 = percentTwo(userInputThree.text,userInputFour.text);
                      });
                    }),
                  ],
                ),
                SizedBox(height: 20,),
                myPercentText('is'),
                SizedBox(height: 20,),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius:  BorderRadius.all(Radius.circular(10.0)),
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


