import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:catex/catex.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class differentialFormula extends StatefulWidget {
  const differentialFormula({Key key}) : super(key: key);

  @override
  _differentialFormulaState createState() => _differentialFormulaState();
}

class _differentialFormulaState extends State<differentialFormula> {

  Map diffs = {
    0 : [r'f(x)', r'\frac{d}{dx}\ f(x)'],
    1 : [r'constant', r'0'],
    2 : [r'x^n', r'n\ x^{n-1}'],
    3 : [r'a^x', r'a^x\ lna'],
    4 : [r'e^x', r'e^x'],
    5 : [r'ln\ x', r'\frac{1}{x}'],
    6 : [r'log_a\ x', r'\frac{1}{x\ lna}'],
    7 : [r'sin\ x', r'cos\ x'],
    8 : [r'cos\ x', r'- sin\ x'],
    9 : [r'tan\ x', r'sec^2\ x'],
    10 : [r'cot\ x', r'- cosec^2\ x', ],
    11 : [r'sec\ x', r'sec\ x\ tan\ x'],
    12 : [r'cosec\ x',  r'- cosec\ x\ cot\ x'],
    13 : [r'sin^{-1}\ x', r'\frac {1}{\sqrt{1-x^2}}'],
    14 : [r'cos^{-1}\ x', r'- \frac {1}{\sqrt{1-x^2}}'],
    15 : [r'tan^{-1}\ x', r'\frac {1}{1+x^2}'],
    16 : [r'cot^{-1}\ x', r'- \frac {1}{1+x^2}'],
    17 : [r'sec^{-1}\ x', r'\frac {1}{|x|\sqrt{x^2-1}}'],
    18 : [r'cosec^{-1}\ x', r'- \frac {1}{|x|\sqrt{x^2-1}}'],
    19 : [r'sinh\ x',  r'cosh\ x'],
    20 : [r'cosh\ x',  r'sinh\ x'],
    21 : [r'tanh\ x',  r'sech^2\ x'],
    22 : [r'coth\ x',  r'- cosech^2\ x'],
    23 : [r'sech\ x',  r'- sech\ x\ tanh\ x'],
    24 : [r'cosech\ x', r'- cosech\ x\ coth\ x'],
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("DIFFERENTIATION"),
        body: Container(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: diffs.length,
            itemBuilder: (context, index) {
                return Row(
                  children: [
                    myFormulaTableBlock(diffs[index][0]),
                    myFormulaTableBlock(diffs[index][1]),
                  ],
                );
            },
          ),
        ),
      ),
    );
  }
}