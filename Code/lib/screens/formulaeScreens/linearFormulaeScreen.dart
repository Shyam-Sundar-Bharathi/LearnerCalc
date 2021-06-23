import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class linearFormula extends StatefulWidget {
  const linearFormula({Key key}) : super(key: key);

  @override
  _linearFormulaState createState() => _linearFormulaState();
}

class _linearFormulaState extends State<linearFormula> {

  Map linears = {
    0 : "a_1x + b_1y + c_1 = 0",
    1 : "a_2x + b_2y + c_2 = 0",
    2 : r'\frac{a_1}{a_2} = \frac{b_1}{b_2} = \frac{c_1}{c_2}',
    3 : r'\rightarrow INFINITE\ SOLUTIONS.',
    4 : r'\rightarrow Lines\ are\ co-inciding.',
    5 : r'\frac{a_1}{a_2} = \frac{b_1}{b_2} \neq \frac{c_1}{c_2}',
    6 : r'\rightarrow NO\ SOLUTION.',
    7 : r'\rightarrow Lines\ are\ parallel.',
    8 : r'\frac{a_1}{a_2} \neq \frac{b_1}{b_2}',
    9 : r'\rightarrow x = \frac{b_1c_2 - b_2c_1}{a_1b_2 - a_2b_1}',
    10 : r'\rightarrow y = \frac{c_1a_2 - c_2a_1}{a_1b_2 - a_2b_1}',
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          backgroundColor: colors[colorTheme][2],
          appBar: myAppBar("LINEAR EQUATIONS"),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ElevatedButton(
                    style: myButtonStyle,
                    onPressed: () {
                      Navigator.pushNamed(context, '/linearChoice');
                    },
                    child: FittedBox(
                      child: Text(
                        "GO TO LINEAR EQUATIONS CALCULATOR",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myFormulaHeading("EQUATIONS"),
                      myFormula(linears[0]),
                      myFormula(linears[1]),
                      myFormulaHeading("CASE 1"),
                      myFormula(linears[2]),
                      myFormula(linears[3]),
                      myFormula(linears[4]),
                      myFormulaHeading("CASE 2"),
                      myFormula(linears[5]),
                      myFormula(linears[6]),
                      myFormula(linears[7]),
                      myFormulaHeading("CASE 3"),
                      myFormula(linears[8]),
                      myFormula(linears[9]),
                      myFormula(linears[10]),
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
