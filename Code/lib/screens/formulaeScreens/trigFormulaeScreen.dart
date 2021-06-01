import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:catex/catex.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class trigonometryFormula extends StatefulWidget {
  const trigonometryFormula({Key key}) : super(key: key);

  @override
  _trigonometryFormulaState createState() => _trigonometryFormulaState();
}

class _trigonometryFormulaState extends State<trigonometryFormula> {

  Widget myViceVersa(){
    return Column(
      children: [
        SizedBox(height: 10,),
        FittedBox(
          child: Text(
            "and vice-versa.",
            style: TextStyle(
                fontSize: 20,
                color: Colors.black
            ),
          ),
        ),
      ],
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

  Map sumToProduct = {
    0 : r'sinA + sinB = 2sin(\frac{A+B}{2})cos(\frac{A-B}{2})',
    1 : r'sinA - sinB = 2sin(\frac{A-B}{2})cos(\frac{A+B}{2})',
    2 : r'cosA + cosB = 2cos(\frac{A+B}{2})cos(\frac{A-B}{2})',
    3 : r'cosA - cosB = 2sin(\frac{A+B}{2})sin(\frac{A-B}{2})',
  };

  Map productToSum = {
    0 : r'sinAsinB = \frac{1}{2}[cos(A-B) - cos(A+B)]',
    1 : r'cosAcosB = \frac{1}{2}[cos(A-B) + cos(A+B)]',
    2 : r'sinAcosB = \frac{1}{2}[sin(A+B) + sin(A-B)]',
    3 : r'cosAsinB = \frac{1}{2}[sin(A+B) - sin(A+B)]',
  };

  String lawOfSines = r'\frac{a}{sina} = \frac{b}{sinb} = \frac{c}{sinc}';

  Map lawOfCosines = {
    0 : r'c = a^2 + b^2 - 2abcosC',
    1 : r'b = a^2 + c^2 - 2accosB',
    2 : r'a = b^2 + c^2 - 2bccosA',
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          backgroundColor: colors[colorTheme][2],
          appBar: myAppBar("TRIGONOMETRY"),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  myFormulaHeading("COMPLEMENTARY"),
                  myFormula(comp[0]),
                  myFormula(comp[1]),
                  myFormula(comp[2]),
                  myViceVersa(),
                  SizedBox(height: 50,),
                  myFormulaHeading("RECIPROCAL"),
                  myFormula(recip[0]),
                  myFormula(recip[1]),
                  myFormula(recip[2]),
                  myViceVersa(),
                  SizedBox(height: 50,),
                  myFormulaHeading("PROPERTY OF SQUARES"),
                  myFormula(squares[0]),
                  myFormula(squares[1]),
                  myFormula(squares[2]),
                  myViceVersa(),
                  SizedBox(height: 50,),
                  myFormulaHeading("QUADRANT INFORMATION"),
                  myFormula(quadrantInfo[0]),
                  myFormula(quadrantInfo[1]),
                  myFormula(quadrantInfo[2]),
                  myFormula(quadrantInfo[3]),
                  SizedBox(height: 50,),
                  myFormulaHeading("SIN ANGLES"),
                  myFormula(quadrants[0][0]),
                  myFormula(quadrants[0][1]),
                  myFormula(quadrants[0][2]),
                  myFormula(quadrants[0][3]),
                  myFormula(quadrants[0][4]),
                  myFormula(quadrants[0][5]),
                  SizedBox(height: 50,),
                  myFormulaHeading("COS ANGLES"),
                  myFormula(quadrants[1][0]),
                  myFormula(quadrants[1][1]),
                  myFormula(quadrants[1][2]),
                  myFormula(quadrants[1][3]),
                  myFormula(quadrants[1][4]),
                  myFormula(quadrants[1][5]),
                  SizedBox(height: 50,),
                  myFormulaHeading("TAN ANGLES"),
                  myFormula(quadrants[2][0]),
                  myFormula(quadrants[2][1]),
                  myFormula(quadrants[2][2]),
                  myFormula(quadrants[2][3]),
                  myFormula(quadrants[2][4]),
                  myFormula(quadrants[2][5]),
                  SizedBox(height: 50,),
                  myFormulaHeading("HALF-ANGLE"),
                  myFormula(halfAngle[0]),
                  myFormula(halfAngle[1]),
                  SizedBox(height: 50,),
                  myFormulaHeading("DOUBLE-ANGLE"),
                  myFormula(doubleAngle[0]),
                  myFormula(doubleAngle[1]),
                  myFormula(doubleAngle[2]),
                  myFormula(doubleAngle[3]),
                  SizedBox(height: 50,),
                  myFormulaHeading("TRIPLE-ANGLE"),
                  myFormula(tripleAngle[0]),
                  myFormula(tripleAngle[1]),
                  SizedBox(height: 50,),
                  myFormulaHeading("ADDITION"),
                  myFormula(addition[0]),
                  myFormula(addition[1]),
                  myFormula(addition[2]),
                  SizedBox(height: 50,),
                  myFormulaHeading("SUM TO PRODUCT"),
                  myFormula(sumToProduct[0]),
                  myFormula(sumToProduct[1]),
                  myFormula(sumToProduct[2]),
                  myFormula(sumToProduct[3]),
                  SizedBox(height: 50,),
                  myFormulaHeading("PRODUCT TO SUM"),
                  myFormula(productToSum[0]),
                  myFormula(productToSum[1]),
                  myFormula(productToSum[2]),
                  myFormula(productToSum[3]),
                  SizedBox(height: 50,),
                  myFormulaHeading("LAW OF SINES"),
                  myFormula(lawOfSines),
                  SizedBox(height: 50,),
                  myFormulaHeading("LAW OF COSINES"),
                  myFormula(lawOfCosines[0]),
                  myFormula(lawOfCosines[1]),
                  myFormula(lawOfCosines[2]),
                ],
              ),
            ),
          )
      ),
    );
  }
}