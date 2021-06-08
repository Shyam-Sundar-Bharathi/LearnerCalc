import 'dart:ui';
import 'dart:io' show Platform;
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:flutter/material.dart';
import 'package:dream_calc/services/buttons.dart';
import 'package:flutter/rendering.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class genCalc extends StatefulWidget {
  @override
  _genCalcState createState() => _genCalcState();
}

class _genCalcState extends State<genCalc> {
  TextEditingController userInput = new TextEditingController();
  var cursorPos;
  var answer = '';
  final List<String> buttons = [
    '^',
    '(',
    ')',
    'DEL',
    '7',
    '8',
    '9',
    '÷',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '.',
    '0',
    '=',
    '+',
    'π',
    'e',
    'ϕ',
    'R',
    '√2',
    '√3',
    '√5',
    '√10',
    'log2',
    'log3',
    'log5',
    'loge',
    'ln2',
    'ln3',
    'ln5',
    'ln10',
    'μ',
    'm',
    'c',
    'k'
  ];

  final Map<String, String> symbols = {
    'π' : pi.toStringAsFixedNoZero(precision),
    'e' : e.toStringAsFixedNoZero(precision),
    'ϕ' : phi.toStringAsFixedNoZero(precision),
    'R' : r.toStringAsFixedNoZero(precision),
    '√2' : roottwo.toStringAsFixedNoZero(precision),
    '√3' : rootthree.toStringAsFixedNoZero(precision),
    '√5' : rootfive.toStringAsFixedNoZero(precision),
    '√10' : rootten.toStringAsFixedNoZero(precision),
    'log2' : logtwo.toStringAsFixedNoZero(precision),
    'log3' : logthree.toStringAsFixedNoZero(precision),
    'log5' : logfive.toStringAsFixedNoZero(precision),
    'loge' : loge.toStringAsFixedNoZero(precision),
    'ln2' : lntwo.toStringAsFixedNoZero(precision),
    'ln3' : lnthree.toStringAsFixedNoZero(precision),
    'ln5' : lnfive.toStringAsFixedNoZero(precision),
    'ln10' : lnten.toStringAsFixedNoZero(precision),
    'μ' : '10^(-6)',
    'm' : '10^(-3)',
    'c' : '10^(-2)',
    'k' : '10^(3)'
  };

  int tappedIndex = -1;

  void tapped(int index) async {
    setState(() => tappedIndex = index);
    await Future.delayed(Duration(milliseconds: 100));
    setState(() => tappedIndex = -1);
  }

  bool isOperator(String x) {
    if (x == '/' || x == '÷' || x == 'x' || x == '-' || x == '+' || x == '=' ||
        x == '^') {
      return true;
    }
    return false;
  }

  void insertText(String myText) {
    cursorPos = userInput.selection.base.offset;
    if (cursorPos < 0) {
      if (myText == '.') {
        userInput.text == '' ? userInput.text += '0.' :
        isOperator(userInput.text[userInput.text.length - 1]) ?
        userInput.text += '0.' :
        userInput.text += myText;
      }
      else
        userInput.text += myText;
    }

    else {
      final text = userInput.text;
      final textSelection = userInput.selection;
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        myText,
      );
      final myTextLength = myText.length;
      userInput.text = newText;
      userInput.selection = textSelection.copyWith(
        baseOffset: textSelection.start + myTextLength,
        extentOffset: textSelection.start + myTextLength,
      );
    }
    isOperator(myText) ? answer = '' : evaluate(userInput.text);
  }

  void insertOperator(String operator) {
    if (userInput.text.length == 0)
      if (operator == '-')
        userInput.text += operator;
      else
        return;

    else if (isOperator(userInput.text[userInput.text.length - 1]))
      if (operator == '-')
        userInput.text += '(-';
      else if (userInput.text[userInput.text.length - 2] == '(')
        return;
      else
        setState(() {
          userInput.text =
              userInput.text.substring(0, userInput.text.length - 1) + operator;
        });

    else if (userInput.text[userInput.text.length - 1] == '(')
      if (operator == '-')
        userInput.text += '-';
      else
        return;

    else
      insertText(operator);
  }

  void backSpace() {
    if (userInput.text.length == 0)
      return;
    cursorPos = userInput.selection.base.offset;
    if (cursorPos < 0)
      userInput.text = userInput.text.substring(0, userInput.text.length - 1);
    else {
      final text = userInput.text;
      final textSelection = userInput.selection;
      final selectionLength = textSelection.end - textSelection.start;
      // There is a selection.
      if (selectionLength > 0) {
        final newText = text.replaceRange(
          textSelection.start,
          textSelection.end,
          '',
        );
        userInput.text = newText;
        userInput.selection = textSelection.copyWith(
          baseOffset: textSelection.start,
          extentOffset: textSelection.start,
        );
      }
      else {
        final offset = 1;
        final newStart = textSelection.start - offset;
        final newEnd = textSelection.start;
        final newText = text.replaceRange(
          newStart,
          newEnd,
          '',
        );
        userInput.text = newText;
        userInput.selection = textSelection.copyWith(
          baseOffset: newStart,
          extentOffset: newStart,
        );
      }
    }
    if (userInput.text.length == 0)
      setState(() {
        answer = "";
      });
    else if (isOperator(userInput.text[userInput.text.length - 1]))
      evaluate(userInput.text.substring(0, userInput.text.length - 1));
    else
      evaluate(userInput.text);
  }

  void evaluate(String input) {
    String finaluserinput = input.replaceAll('x', '*');
    finaluserinput = finaluserinput.replaceAll('÷', '/');

    Parser p = Parser();
    try {
      Expression exp = p.parse(finaluserinput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      setState(() {
        answer = eval.toString();
      });
      //print("END TRY");
    }
    on FormatException {
      try {
        int open = '('
            .allMatches(userInput.text)
            .length;
        int close = ')'
            .allMatches(userInput.text)
            .length;
        if (open > close) {
          for (int i = 0; i < open - close; i++) {
            finaluserinput += ')';
          }
        }
        else if (close > open) {
          String temp = finaluserinput;
          finaluserinput = '';
          for (int i = 0; i < close - open; i++) {
            finaluserinput += '(';
          }
          finaluserinput += temp;
        }
        if (finaluserinput.length == 0) {
          setState(() {
            answer = '';
          });
          return;
        }
        Expression exp = p.parse(finaluserinput);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        setState(() {
          answer = eval.toString();
        });
      }
      on Exception {
        setState(() {
          answer = "Incorrect Expression";
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black,
      appBar: myAppBar("GENERAL CALCULATOR"),
      body: Column(
        children: [
          Container(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: 20),
                Container(
                  height: MediaQuery.of(context).size.height/12,
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerRight,
                  child: TextField(
                    readOnly: true,
                    showCursor: true,
                    autofocus: true,
                    cursorColor: colors[colorTheme][11],
                    cursorHeight: 30,
                    textAlign: TextAlign.right,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                    controller: userInput,
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/8,
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.centerRight,
                  child: Text(
                    answer == '' || answer == 'Incorrect Expression'
                        ? answer
                        : formatNumber((answer).toStringAsFixedNoZero(10)),
                    overflow: TextOverflow.clip,
                    softWrap: false,
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black87,
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 0,
                  crossAxisCount: 4,
                ),
                itemBuilder: (BuildContext context, int index) {

                  //parenthesis buttons
                  if (index == 1 || index == 2) {
                    return MyButton(
                      buttontapped: () {
                        tapped(index);
                        setState(() {
                          insertText(buttons[index]);
                        });
                      },
                      buttonText: buttons[index],
                      color: tappedIndex == index
                          ? colors[colorTheme][5]
                          : colors[colorTheme][11],
                      textColor: Colors.white,
                    );
                  }

                  //delete button
                  if (index == 3) {
                    return MyButton(
                      buttontapped: () {
                        tapped(index);
                        backSpace();
                      },
                      buttonlongpressed: () {
                        tapped(index);
                        setState(() {
                          userInput.text = '';
                          answer = '';
                        });
                      },
                      buttonText: buttons[index],
                      color: tappedIndex == index ? Colors.red[500] : Colors
                          .redAccent,
                      textColor: Colors.white,
                      fontSize: 20.0,
                    );
                  }
                  // Equal button
                  else if (index == 18) {
                    return MyButton(
                      buttontapped: () {
                        tapped(index);
                        if ((answer == '' || answer == '0') && userInput.text !=
                            '')
                          setState(() {
                            answer = "Incorrect Expression";
                          });
                        else if (answer != 'Incorrect Expression')
                          setState(() {
                            userInput.text =
                                double.parse(answer).toStringAsFixedNoZero(10);
                            answer = "";
                          });
                      },
                      buttonText: buttons[index],
                      color: tappedIndex == index ? Colors.green : Colors
                          .greenAccent[400],
                      textColor: Colors.black,
                    );
                  }
                  else if(index >= 20 && index <=39){
                    return MyButton(
                      buttontapped: () {
                        tapped(index);
                        setState(() {
                            insertText(symbols[buttons[index]]);
                          });
                      },
                      buttonText: buttons[index],
                      color: tappedIndex == index ? colors[colorTheme][1] : colors[colorTheme][11],
                      textColor: Colors.white
                    );
                  }
                  //other buttons
                  else {
                    return MyButton(
                      buttontapped: () {
                        tapped(index);
                        if (isOperator(buttons[index]))
                          insertOperator(buttons[index]);
                        else
                          setState(() {
                            insertText(buttons[index]);
                          });
                      },
                      buttonText: buttons[index],
                      color: isOperator(buttons[index])
                          ? tappedIndex == index
                          ? colors[colorTheme][5]
                          : colors[colorTheme][11]
                          : tappedIndex == index ? Colors.grey[400] : Colors
                          .grey[200],
                      textColor: isOperator(buttons[index])
                          ? Colors.white
                          : Colors.black,
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}