import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class pncFormula extends StatefulWidget {
  const pncFormula({Key key}) : super(key: key);

  @override
  _pncFormulaState createState() => _pncFormulaState();
}

class _pncFormulaState extends State<pncFormula> {

  //https://www.askiitians.com/maths/permutation-and-combination.html
  Map pnc = {
    0 : "n! = (n)(n-1)(n-2).....(2)(1)",
    1 : "^nP_r = n^r",
    2 : r"^nP_r = \frac{n!}{(n-r)!}",
    3 : r"^{n+r-1}C_r = \frac{(n+r-1)!}{r!(n-1)!}",
    4 : r"^nC_r = \frac{n!}{r!(n-r)!}"
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          backgroundColor: colors[colorTheme][2],
          appBar: myAppBar("PERMUTATION COMBINATION"),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ElevatedButton(
                    style: myButtonStyle,
                    onPressed: () {
                      Navigator.pushNamed(context, '/pnc');
                    },
                    child: FittedBox(
                      child: Text(
                        "GO TO PERMUTATION COMBINATION CALCULATOR",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myFormulaHeading("FACTORIAL"),
                      myFormula(pnc[0]),
                      myFormulaHeading("PERMUTATION WITH REPETITION"),
                      myFormula(pnc[1]),
                      myFormulaHeading("PERMUTATION WITHOUT REPETITION"),
                      myFormula(pnc[2]),
                      myFormulaHeading("COMBINATION WITH REPETITION"),
                      myFormula(pnc[3]),
                      myFormulaHeading("COMBINATION WITHOUT REPETITION"),
                      myFormula(pnc[4]),
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
