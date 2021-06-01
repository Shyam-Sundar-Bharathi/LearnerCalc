import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:catex/catex.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class progressionFormula extends StatefulWidget {
  const progressionFormula({Key key}) : super(key: key);

  @override
  _progressionFormulaState createState() => _progressionFormulaState();
}

class _progressionFormulaState extends State<progressionFormula> {

  Map progs = {
    0 : [r'a \rightarrow first\ term',
         r'd \rightarrow common\ difference',
         r'l \rightarrow last\ term',
         r'nᵗʰ term',
         r'a_n = a+(n-1)d',
         r'Sum of first n terms',
         r'S_n = \frac{n}{2}[2a + (n-1)d]',
         r'S_n = \frac{n}{2}[a+l]'],
    1 : [r'a \rightarrow first\ term',
         r'r \rightarrow common\ ratio',
         r'nᵗʰ term',
         r'a_n = ar^{n-1}',
         r'Sum of first n terms',
         r'r = 1, S_n = na',
         r'r \neq 1, S_n = \frac{a(r^n - 1)}{r-1}',
         r'Sum of infinite terms',
         r'-1<r<1, S_{\infty} = \frac{a}{1-r}'],
    2 :  [r'a \rightarrow first\ term\ of\ AP',
          r'd \rightarrow common\ difference\ of\ AP',
          r'nᵗʰ term',
          r'a_n = \frac{1}{a+(n-1)d}',
          r'Sum of n terms',
          r'S_n = \frac{1}{d}\ \frac{ln(2a + (2n-1)d)}{2a-d}'],
    3 : r'AM \ge GM \ge HM'
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          backgroundColor: colors[colorTheme][2],
          appBar: myAppBar("PROGRESSION"),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myFormulaHeading("ARITHMETIC PROGRESSION", mainHeading: 1),
                  myFormula(progs[0][0]),
                  myFormula(progs[0][1]),
                  myFormula(progs[0][2]),
                  SizedBox(height: 20,),
                  myFormulaHeading(progs[0][3]),
                  myFormula(progs[0][4]),
                  SizedBox(height: 20,),
                  myFormulaHeading(progs[0][5]),
                  myFormula(progs[0][6]),
                  myFormula(progs[0][7]),
                  SizedBox(height: 50,),
                  myFormulaHeading("GEOMETRIC PROGRESSION", mainHeading: 1),
                  myFormula(progs[1][0]),
                  myFormula(progs[1][1]),
                  SizedBox(height: 20,),
                  myFormulaHeading(progs[1][2]),
                  myFormula(progs[1][3]),
                  SizedBox(height: 20,),
                  myFormulaHeading(progs[1][4]),
                  myFormula(progs[1][5]),
                  myFormula(progs[1][6]),
                  SizedBox(height: 20,),
                  myFormulaHeading(progs[1][7]),
                  myFormula(progs[1][8]),
                  SizedBox(height: 50,),
                  myFormulaHeading("HARMONIC PROGRESSION", mainHeading: 1),
                  myFormula(progs[2][0]),
                  myFormula(progs[2][1]),
                  SizedBox(height: 20,),
                  myFormulaHeading(progs[2][2]),
                  myFormula(progs[2][3]),
                  SizedBox(height: 20,),
                  myFormulaHeading(progs[2][4]),
                  myFormula(progs[2][5]),
                  SizedBox(height: 50,),
                  myFormulaHeading("RELATIONSHIP BETWEEN AM,GM,HM", mainHeading: 1),
                  myFormula(progs[3])
                ],
              ),
            ),
          )
      ),
    );
  }
}
