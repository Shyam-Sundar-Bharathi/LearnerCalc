import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:catex/catex.dart';

class trigonometryFormula extends StatefulWidget {
  const trigonometryFormula({Key key}) : super(key: key);

  @override
  _trigonometryFormulaState createState() => _trigonometryFormulaState();
}

class _trigonometryFormulaState extends State<trigonometryFormula> {

  Widget myTrigHeading(String heading){
    return Text(
      heading,
      style: TextStyle(
          fontSize: 20,
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold
      ),
    );
  }

  Widget myTrigFormula(String text){
    return DefaultTextStyle(
      child: FittedBox(child: CaTeX(text)),
      style: TextStyle(
          fontSize: 25,
          color: Colors.black
      ),
    );
  }

  Widget myViceVersa(){
    return FittedBox(
      child: Text(
        "and vice-versa.",
        style: TextStyle(
            fontSize: 20,
            color: Colors.black
        ),
      ),
    );
  }

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
    0 : r'Q1 : all\ ratios\ are\ positive.',
    1 : r'Q2 : sin\ and\ cosec\ are\ positive.',
    2 : r'Q3 : tan\ and\ cot\ are\ positive.',
    3 : r'Q4 : cos\ and\ sec\ are\ positive.'
  };

  Map quadrants = {
    0 : [r'sin(90 + \theta) = cos(\theta)',
      r'sin(180 - \theta) = sin(\theta)',
      r'sin(180 + \theta) = -sin(\theta)',
      r'sin(270 - \theta) = -cos(\theta)',
      r'sin(270 + \theta) = -cos(\theta)',
      r'sin(-\theta) = -sin(\theta)'],

    1 : [r'cos(90 + \theta) = -sin(\theta)',
      r'cos(180 - \theta) = -cos(\theta)',
      r'cos(180 + \theta) = -cos(\theta)',
      r'cos(270 - \theta) = -sin(\theta)',
      r'cos(270 + \theta) = sin(\theta)',
      r'cos(-\theta) = cos(\theta)'],

    2 : [r'tan(90 + \theta) = -cot(\theta)',
      r'tan(180 - \theta) = -tan(\theta)',
      r'tan(180 + \theta) = tan(\theta)',
      r'tan(270 - \theta) = -cot(\theta)',
      r'tan(270 + \theta) = -cot(\theta)',
      r'tan(-\theta) = -tan(\theta)'],
  };

  Map halfAngle = {
    0 : r'1+cos(\theta)\ =\ 2cos^2(\frac{\theta}{2})',
    1 : r'1-cos(\theta)\ =\ 2sin^2(\frac{\theta}{2})',
  };

  Map doubleAngle = {
    0 : r'sin(2\theta) = 2sin(\theta)cos(\theta)',
    1 : r'cos(2\theta) = cos^2(\theta) - sin^2(\theta)',
    2 : r'cos(2\theta) = 2cos^2(\theta) - 1',
    3 : r'cos(2\theta) = 1 - 2sin^2(\theta)'
  };

  Map tripleAngle = {
    0 : r'cos(3\theta)\ =\ 4cos^3(\theta) - 3cos(\theta)',
    1 : r'sin(3\theta)\ =\ 3sin(\theta) - 4sin^3(\theta)',
  };

  Map addition = {
    0 : r'sin(A \pm B) = sinAcosB \pm cosAsinB',
    1 : r'cos(A \pm B) = cosAcosB \mp sinAsinB',
    2 : r'tan(A \pm B) = \frac{tanA \pm tanB}{1 \mp tanAtanB}'
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  myTrigHeading("COMPLEMENTARY"),
                  SizedBox(height: 10,),
                  myTrigFormula(comp[0]),
                  myTrigFormula(comp[1]),
                  myTrigFormula(comp[2]),
                  SizedBox(height: 10,),
                  myViceVersa(),
                  SizedBox(height: 50,),
                  myTrigHeading("RECIPROCAL"),
                  SizedBox(height: 10,),
                  myTrigFormula(recip[0]),
                  myTrigFormula(recip[1]),
                  myTrigFormula(recip[2]),
                  SizedBox(height: 10,),
                  myViceVersa(),
                  SizedBox(height: 50,),
                  myTrigHeading("PROPERTY OF SQUARES"),
                  SizedBox(height: 10,),
                  myTrigFormula(squares[0]),
                  myTrigFormula(squares[1]),
                  myTrigFormula(squares[2]),
                  SizedBox(height: 10,),
                  myViceVersa(),
                  SizedBox(height: 50,),
                  myTrigHeading("QUADRANT INFORMATION"),
                  SizedBox(height: 10,),
                  myTrigFormula(quadrantInfo[0]),
                  myTrigFormula(quadrantInfo[1]),
                  myTrigFormula(quadrantInfo[2]),
                  myTrigFormula(quadrantInfo[3]),
                  SizedBox(height: 50,),
                  myTrigHeading("SIN ANGLES"),
                  SizedBox(height: 10,),
                  myTrigFormula(quadrants[0][0]),
                  myTrigFormula(quadrants[0][1]),
                  myTrigFormula(quadrants[0][2]),
                  myTrigFormula(quadrants[0][3]),
                  myTrigFormula(quadrants[0][4]),
                  myTrigFormula(quadrants[0][5]),
                  SizedBox(height: 50,),
                  myTrigHeading("COS ANGLES"),
                  SizedBox(height: 10,),
                  myTrigFormula(quadrants[1][0]),
                  myTrigFormula(quadrants[1][1]),
                  myTrigFormula(quadrants[1][2]),
                  myTrigFormula(quadrants[1][3]),
                  myTrigFormula(quadrants[1][4]),
                  myTrigFormula(quadrants[1][5]),
                  SizedBox(height: 50,),
                  myTrigHeading("TAN ANGLES"),
                  SizedBox(height: 10,),
                  myTrigFormula(quadrants[2][0]),
                  myTrigFormula(quadrants[2][1]),
                  myTrigFormula(quadrants[2][2]),
                  myTrigFormula(quadrants[2][3]),
                  myTrigFormula(quadrants[2][4]),
                  myTrigFormula(quadrants[2][5]),
                  SizedBox(height: 50,),
                  myTrigHeading("HALF-ANGLE"),
                  SizedBox(height: 10,),
                  myTrigFormula(halfAngle[0]),
                  myTrigFormula(halfAngle[1]),
                  SizedBox(height: 50,),
                  myTrigHeading("DOUBLE-ANGLE"),
                  SizedBox(height: 10,),
                  myTrigFormula(doubleAngle[0]),
                  myTrigFormula(doubleAngle[1]),
                  myTrigFormula(doubleAngle[2]),
                  myTrigFormula(doubleAngle[3]),
                  SizedBox(height: 50,),
                  myTrigHeading("TRIPLE-ANGLE"),
                  SizedBox(height: 10,),
                  myTrigFormula(tripleAngle[0]),
                  myTrigFormula(tripleAngle[1]),
                  SizedBox(height: 50,),
                  myTrigHeading("ADDITION"),
                  SizedBox(height: 10,),
                  myTrigFormula(addition[0]),
                  myTrigFormula(addition[1]),
                  myTrigFormula(addition[2]),
                ],
              ),
            ),
          )
      ),
    );
  }
}