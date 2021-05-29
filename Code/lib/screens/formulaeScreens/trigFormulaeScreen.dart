import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:catex/catex.dart';

class trigonometryFormula extends StatefulWidget {
  const trigonometryFormula({Key key}) : super(key: key);

  @override
  _trigonometryFormulaState createState() => _trigonometryFormulaState();
}

class _trigonometryFormulaState extends State<trigonometryFormula> {

  Map comp = {
    0 : r'sin (90 - \theta) = cos(\theta)',
    1 : r'tan (90 - \theta) = cot(\theta)',
    2 : r'sec (90 - \theta) = cosec(\theta)',
  };

  Map recip =  {
    0 : r'\frac{1}{sin(\theta)} = cosec(\theta)',
    1 : r'\frac{1}{cos(\theta)} = sec(\theta)',
    2 : r'\frac{1}{tan(\theta)} = cot(\theta)',
  };

  Map squares = {
    0 : r'sin^2(\theta) + cos^2(\theta) = 1',
    1 : r'sec^2(\theta) = 1 + tan^2(\theta)',
    2 : r'cosec^2(\theta) = 1 + cot^2(\theta)',
  };

  Map quadrantInfo = {
    0 : r'All ratios are positive in the first quadrant.',
    1 : r'sin and cosec are positive in the second quadrant.',
    2 : r'tan and cot are positive in the third quadrant.',
    3 : r'cos and sec are positive in the fourth quadrant.'
  };

  Map quadrants = {
    0 : [r'sin(90 + \theta) = cos(\theta)',
      r'sin(180 - \theta) = sin(\theta)',
      r'sin(180 + \theta) = -sin(\theta)'
      r'sin(270 - \theta) = -cos(\theta)'
      r'sin(270 + \theta) = -cos(\theta)'
      r'sin(-\theta) = -sin(\theta)'],

    1 : [r'cos(90 + \theta) = -sin(\theta)',
      r'cos(180 - \theta) = -cos(\theta)',
      r'cos(180 + \theta) = -cos(\theta)'
      r'cos(270 - \theta) = -sin(\theta)'
      r'cos(270 + \theta) = sin(\theta)'
      r'cos(-\theta) = cos(\theta)'],

    2 : [r'tan(90 + \theta) = -cot(\theta)',
      r'tan(180 - \theta) = -tan(\theta)',
      r'tan(180 + \theta) = tan(\theta)'
      r'tan(270 - \theta) = -cot(\theta)'
      r'tan(270 + \theta) = -cot(\theta)'
      r'tan(-\theta) = -tan(\theta)'],
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
              "TRIGONOMETRY FORMULAE",
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
                    "COMPLEMENTARY",
                    style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10,),
                  DefaultTextStyle(
                    child: CaTeX(comp[0]),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black
                    ),
                  ),
                  DefaultTextStyle(
                    child: CaTeX(comp[1]),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black
                    ),
                  ),
                  DefaultTextStyle(
                    child: CaTeX(comp[2]),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "and vice-versa.",
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black
                    ),
                  ),
                  SizedBox(height: 50,),
                  Text(
                    "RECIPROCAL",
                    style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10,),
                  DefaultTextStyle(
                    child: CaTeX(recip[0]),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black
                    ),
                  ),
                  DefaultTextStyle(
                    child: CaTeX(recip[1]),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black
                    ),
                  ),
                  DefaultTextStyle(
                    child: CaTeX(recip[2]),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "and vice-versa.",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 50,),
                  Text(
                    "PROPERTY OF SQUARES",
                    style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 10,),
                  DefaultTextStyle(
                    child: CaTeX(squares[0]),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black
                    ),
                  ),
                  DefaultTextStyle(
                    child: CaTeX(squares[1]),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black
                    ),
                  ),
                  DefaultTextStyle(
                    child: CaTeX(squares[2]),
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                    "and vice-versa.",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black
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