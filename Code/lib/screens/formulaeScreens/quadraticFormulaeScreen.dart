import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:catex/catex.dart';

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
        appBar: AppBar(
          title: Text(
            "QUADRATIC FORMULAE",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              color: colors[colorTheme][1],
            ),
          ),
          backgroundColor: colors[colorTheme][9],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "EQUATION",
                  style: TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold
                  ),
                ),
                DefaultTextStyle(
                  child: CaTeX(quads[0]),
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black
                  ),
                ),
                SizedBox(height: 50,),
                Text(
                  "SUM OF ROOTS",
                  style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold
                  ),
                ),
                DefaultTextStyle(
                  child: CaTeX(quads[1]),
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 50,),
                Text(
                  "PRODUCT OF ROOTS",
                  style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold
                  ),
                ),
                DefaultTextStyle(
                  child: CaTeX(quads[2]),
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 50,),
                Text(
                  "DISCRIMINANT",
                  style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                DefaultTextStyle(
                  child: CaTeX(quads[3]),
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                  ),
                ),
                SizedBox(height: 50,),
                Text(
                  "ROOTS",
                  style: TextStyle(
                      fontSize: 20,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(height: 10,),
                DefaultTextStyle(
                  child: CaTeX(quads[4]),
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                  ),
                ),
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