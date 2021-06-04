import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class quadraticFormula extends StatefulWidget {
  const quadraticFormula({Key key}) : super(key: key);

  @override
  _quadraticFormulaState createState() => _quadraticFormulaState();
}

class _quadraticFormulaState extends State<quadraticFormula> {

  Map quads = {
    0 : r'ax^2 + bx + c = 0',
    1 : r'-b/a',
    2 : r'c/a',
    3 : r'D = b^2 - 4ac',
    4 : r'x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}',
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("QUADRATIC EQUATION"),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                ElevatedButton(
                  style: myButtonStyle,
                  onPressed: () {
                    Navigator.pushNamed(context, '/quadratic');
                  },
                  child: FittedBox(
                    child: Text(
                      "GO TO QUADRATIC EQUATION CALCULATOR",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myFormulaHeading("EQUATION"),
                    myFormula(quads[0]),
                    myFormulaHeading("SUM OF ROOTS"),
                    myFormula(quads[1]),
                    myFormulaHeading("PRODUCT OF ROOTS"),
                    myFormula(quads[2]),
                    myFormulaHeading("DISCRIMINANT"),
                    myFormula(quads[3]),
                    myFormulaHeading("ROOTS"),
                    myFormula(quads[4]),
                    myFormulaHeading("CONDITIONS"),
                    SizedBox(height: 10,),
                    FittedBox(
                      child: Text(
                        "D > 0 : Roots are real and unequal.\n"
                            "D = 0 : Roots are real and equal.\n"
                            "D < 0 : Roots are imaginary.",
                        style: TextStyle(
                            fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                  ],
                ),
              ],
            ),
          ),
        )
      ),
    );
  }
}
