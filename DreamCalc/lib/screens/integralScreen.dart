import 'package:flutter/material.dart';
import 'package:dream_calc/screens/genScreen.dart';
import 'package:catex/catex.dart';

class integral extends StatefulWidget {
  const integral({Key key}) : super(key: key);

  @override
  _integralState createState() => _integralState();
}

class _integralState extends State<integral> {

  Map integrals = {
    0 : [r'f(x)', r'∫f(x)dx'],
    1 : [r'0', r'constant'],
    2 : [r'1', r'x'],
    3 : [r'x^n', r'\frac {x^{n+1}}{n+1}'],
    4 : [r'e^x', r'e^x'],
    5 : [r'a^x', r'\frac{a^x}{lna}'],
    6 : [r'ln x', r'xlnx - x'],
    7 : [r'sin\ x', r'- cos\ x'],
    8 : [r'cos\ x', r'sin\ x'],
    9 : [r'sec^2\ x', r'tan\ x'],
    10 : [r'cosec^2\ x', r'- cot\ x', ],
    11 : [r'sec\ x\ tan\ x', r'sec\ x'],
    12 : [r'cosec\ x\ cot\ x',  r'- cosec\ x'],
    13 : [r'\frac {1}{\sqrt{1-x^2}}', r'sin^{-1}\ x'],
    14 : [r'\frac {1}{\sqrt{1-x^2}}', r'- cos^{-1}\ x'],
    15 : [r'\frac {1}{1+x^2}', r'tan^{-1}\ x'],
    16 : [r'\frac {1}{1+x^2}', r'- cot^{-1}\ x'],
    17 : [r'\frac {1}{|x|\sqrt{x^2-1}}', r'sec^{-1}\ x'],
    18 : [r'\frac {1}{|x|\sqrt{x^2-1}}', r'- cosec^{-1}\ x'],
    19 : [r'sinh\ x',  r'cosh\ x'],
    20 : [r'cosh\ x',  r'sinh\ x'],
    21 : [r'sech^2\ x',  r'tanh\ x'],
    22 : [r'cosech^2\ x',  r'- coth\ x'],
    23 : [r'sech\ x\ tanh\ x',  r'- sech\ x'],
    24 : [r'cosech\ x\ coth\ x', r'- cosech\ x'],
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
            "INTEGRAL FORMULAE",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              color: colors[colorTheme][1],
            ),
          ),
          backgroundColor: colors[colorTheme][9],
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: integrals.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Center(
                        child: FittedBox(
                            child: DefaultTextStyle(
                              child: CaTeX(integrals[index][0]),
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black
                              ),
                            )
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(),
                      ),
                      child: Center(
                        child: FittedBox(
                            child: DefaultTextStyle(
                              child: CaTeX(integrals[index][1]),
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black
                              ),
                            )
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
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