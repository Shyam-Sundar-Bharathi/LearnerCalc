import 'package:dream_calc/calcs/matrixCalcs/matrixFourCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';

Widget myExpandedTextField(TextEditingController a, {bool lastBox = false}) {
  return Expanded(
    flex: 1,
    child: TextField(
      textAlign: TextAlign.center,
      controller: a,
      cursorColor: colors[colorTheme][9],
      style: TextStyle(fontWeight: FontWeight.bold),
      keyboardType: TextInputType.number,
      enableInteractiveSelection: true,
      textInputAction: lastBox ? TextInputAction.done : TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
      ],
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors[colorTheme][9], width: 1),
          borderRadius: BorderRadius.zero,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colors[colorTheme][9], width: 2.0),
          borderRadius: BorderRadius.zero,
        ),
        labelStyle: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget myMatrixResult(String choice, Widget result){
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        FittedBox(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              choice,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        result,
      ],
    ),
  );
}

class matrixFour extends StatefulWidget {
  const matrixFour({Key key}) : super(key: key);

  @override
  _matrixFourState createState() => _matrixFourState();
}

class _matrixFourState extends State<matrixFour> {


  Widget myMatrixButton(String ch, String text, fn){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            choice = ch;
            result = matrixFourChoice(a1.text, b1.text, c1.text, d1.text, a2.text, b2.text, c2.text, d2.text, a3.text, b3.text, c3.text, d3.text, a4.text, b4.text, c4.text, d4.text, fn);
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
  String choice = " ";
  Widget result = Container();
  TextEditingController a1 = new TextEditingController();
  TextEditingController b1 = new TextEditingController();
  TextEditingController c1 = new TextEditingController();
  TextEditingController d1 = new TextEditingController();
  TextEditingController a2 = new TextEditingController();
  TextEditingController b2 = new TextEditingController();
  TextEditingController c2 = new TextEditingController();
  TextEditingController d2 = new TextEditingController();
  TextEditingController a3 = new TextEditingController();
  TextEditingController b3 = new TextEditingController();
  TextEditingController c3 = new TextEditingController();
  TextEditingController d3 = new TextEditingController();
  TextEditingController a4 = new TextEditingController();
  TextEditingController b4 = new TextEditingController();
  TextEditingController c4 = new TextEditingController();
  TextEditingController d4 = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
            backgroundColor: colors[colorTheme][2],
            appBar: myAppBar("MATRIX"),
            body: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                    children: [
                      Row(
                        children: [
                         myExpandedTextField(a1),
                         myExpandedTextField(b1),
                         myExpandedTextField(c1),
                         myExpandedTextField(d1),
                        ],
                      ),
                      Row(
                        children: [
                          myExpandedTextField(a2),
                          myExpandedTextField(b2),
                          myExpandedTextField(c2),
                          myExpandedTextField(d2),
                        ],
                      ),
                      Row(
                        children: [
                          myExpandedTextField(a3),
                          myExpandedTextField(b3),
                          myExpandedTextField(c3),
                          myExpandedTextField(d3),
                        ],
                      ),
                      Row(
                        children: [
                          myExpandedTextField(a4),
                          myExpandedTextField(b4),
                          myExpandedTextField(c4),
                          myExpandedTextField(d4, lastBox: true),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          myMatrixButton("TRANSPOSE", "TRANSPOSE", 0),
                          SizedBox(width: 20,),
                          myMatrixButton("DETERMINANT", "DETERMINANT", 1),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          myMatrixButton("TRACE", "TRACE", 2),
                          SizedBox(width: 20,),
                          myMatrixButton("INVERSE", "INVERSE", 3),
                        ],
                      ),
                      SizedBox(height: 40,),
                      choice == " "?
                      Container() :
                      myResultCard(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 30,
                          child: myMatrixResult(choice, result),
                        ),
                      ),
                    ]
                ),
              ),
            )
        ));
  }
}