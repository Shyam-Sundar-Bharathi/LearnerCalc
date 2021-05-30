import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:catex/catex.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class quadraticFormula extends StatefulWidget {
  const quadraticFormula({Key key}) : super(key: key);

  @override
  _quadraticFormulaState createState() => _quadraticFormulaState();
}

class _quadraticFormulaState extends State<quadraticFormula> {

  Widget myQuadraticHeading(String text){
    return Text(
      text,
      style: TextStyle(
          fontSize: 20,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold
      ),
    );
  }

  Widget myQuadraticFormula(String text){
    return DefaultTextStyle(
      child: CaTeX(text),
      style: TextStyle(
          fontSize: 30,
          color: Colors.black
      ),
    );
  }

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                myQuadraticHeading("EQUATION"),
                myQuadraticFormula(quads[0]),
                SizedBox(height: 50,),
                myQuadraticHeading("SUM OF ROOTs"),
                myQuadraticFormula(quads[1]),
                SizedBox(height: 50,),
                myQuadraticHeading("PRODUCT OF ROOTS"),
                myQuadraticFormula(quads[2]),
                SizedBox(height: 50,),
                myQuadraticHeading("DISCRIMINANT"),
                myQuadraticFormula(quads[3]),
                SizedBox(height: 50,),
                myQuadraticHeading("ROOTS"),
                myQuadraticFormula(quads[4]),
                SizedBox(height: 50,),
                Text(
                  "CONDITIONS",
                  style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold
                  ),
                ),
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
          ),
        )
      ),
    );
  }
}

// FittedBox(
// child: Text(
// diffs[index][0],
// style: TextStyle(
// fontSize: 30,
// fontWeight: FontWeight.w900,
// ),
// ),
// ),