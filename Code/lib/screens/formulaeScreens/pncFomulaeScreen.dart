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
    4 : r"^nC_r = \frac{n!}{r!(n-r)!}",
    5 : r"If\ k_i\ is\ the\ number\ of\ identical\ items\ of\ type\ i",
    6 : r"^nP_n = \frac{n!}{k_1!k_2!......}",
    7 : r"\rightarrow ^nP_r = ^nC_r\ r!",
    8 : r"\rightarrow ^nC_r = ^nC_{n-r}",
    9 : r"\rightarrow ^nC_r = ^nC_k,\ then\ r=k\ or\ r=n-k",
    10 : r"\rightarrow ^nC_r + ^nC_{r-1} = ^{n+1}C_r",
    11 : r"\rightarrow ^nC_r = \frac{n}{r}\ \ ^{n-1}C_{r-1}",
    12 : r"\rightarrow \frac{^nC_r}{^nC_{r-1}} = \frac{n-r+1}{r}",
    13 : r"\rightarrow If\ n\ is\ even",
    14 : r"^nC_r\ is\ greatest\ for\ r=\frac{n}{2}",
    15 : r"\rightarrow If\ n\ is\ odd",
    16 : r"^nC_r\ is\ greatest\ for\ r=\frac{n+1}{2}\ and\ \frac{n-1}{2}",
    17 : r"\rightarrow \sum_{r=0}^n\ \ \ \ \ \ (^nC_r) = 2^n",
    18 : r"\rightarrow ^nP_0 = 1",
    19 : r"\rightarrow ^nP_1 = n",
    20 : r"\rightarrow ^nP_{n-1} = n!",
    21 : r"\rightarrow ^nP_{n} = n!",
    22 : r"\rightarrow ^nC_{0} = 1",
    23 : r"\rightarrow ^nC_{1} = n",
    24 : r"\rightarrow ^nC_{n-1} = n",
    25 : r"\rightarrow ^nC_{n} = 1",

  };

  //nCr/nCr-1 = (n-r+1)/ r
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
                      myFormulaHeading("PERMUTATION WITH IDENTICAL ITEMS"),
                      myFormula(pnc[5]),
                      myFormula(pnc[6]),
                      myFormulaHeading("SOME GENERAL FORMULAE"),
                      myFormula(pnc[7]),
                      myFormula(pnc[8]),
                      myFormula(pnc[9]),
                      myFormula(pnc[10]),
                      myFormula(pnc[11]),
                      myFormula(pnc[12]),
                      myFormula(pnc[13]),
                      myFormula(pnc[14]),
                      myFormula(pnc[15]),
                      myFormula(pnc[16]),
                      myFormula(pnc[17]),
                      myFormula(pnc[18]),
                      myFormula(pnc[19]),
                      myFormula(pnc[20]),
                      myFormula(pnc[21]),
                      myFormula(pnc[22]),
                      myFormula(pnc[23]),
                      myFormula(pnc[24]),
                      myFormula(pnc[25]),
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
