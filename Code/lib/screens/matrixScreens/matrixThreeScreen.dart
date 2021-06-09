import 'package:dream_calc/calcs/matrixCalcs/matrixThreeCalc.dart';
import 'package:flutter/material.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/screens/matrixScreens/matrixFourScreen.dart';

class matrixThree extends StatefulWidget {
  const matrixThree({Key key}) : super(key: key);

  @override
  _matrixThreeState createState() => _matrixThreeState();
}

class _matrixThreeState extends State<matrixThree> {

  String choice =  " ";
  Widget result = Container();
  TextEditingController a1 = new TextEditingController();
  TextEditingController b1 = new TextEditingController();
  TextEditingController c1 = new TextEditingController();
  TextEditingController a2 = new TextEditingController();
  TextEditingController b2 = new TextEditingController();
  TextEditingController c2 = new TextEditingController();
  TextEditingController a3 = new TextEditingController();
  TextEditingController b3 = new TextEditingController();
  TextEditingController c3 = new TextEditingController();

  Widget myMatrixButton(String ch, String text, int fn){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            choice = ch;
            result = matrixThreeChoice(a1.text, b1.text, c1.text, a2.text, b2.text, c2.text, a3.text, b3.text, c3.text, fn);
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
                        ],
                      ),
                      Row(
                        children: [
                          myExpandedTextField(a2),
                          myExpandedTextField(b2),
                          myExpandedTextField(c2),
                        ],
                      ),
                      Row(
                        children: [
                          myExpandedTextField(a3),
                          myExpandedTextField(b3),
                          myExpandedTextField(c3),
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
                          myMatrixButton("TRACE","TRACE", 2),
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
