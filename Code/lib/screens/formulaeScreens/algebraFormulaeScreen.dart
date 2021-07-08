import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class algebraicFormula extends StatefulWidget {
  const algebraicFormula({Key key}) : super(key: key);

  @override
  _algebraicFormulaState createState() => _algebraicFormulaState();
}

class _algebraicFormulaState extends State<algebraicFormula> {

  Map algebra = {
    0 : r'(a+b)^2 = a^2 + b^2 + 2ab',
    1 : r'(a-b)^2 = a^2 + b^2 - 2ab',
    2 : r'(a+b)(a-b) = a^2 - b^2',
    3 : r'(x+a)(x+b) = x^2 + (a+b)x + ab',
    4 : r'(x+a)(x-b) = x^2 + (a-b)x - ab',
    5 : r'(x-a)(x-b) = x^2 - (a+b)x + ab',
    6 : r'(a+b)^3 = a^3 + b^3 + 3ab(a+b)',
    7 : r'(a-b)^3 = a^3 - b^3 - 3ab(a-b)',
    8 : r'a^3 + b^3 = (a+b)(a^2 - ab + b^2)',
    9 : r'a^3 - b^3 = (a-b)(a^2 + ab + b^2)',
    10 : r'(a+b+c)^2 = a^2 + b^2 + c^2 + 2ab + 2bc + 2ca',
    11 : r'(a+b-c)^2 = a^2 + b^2 + c^2 + 2ab - 2bc - 2ca',
    12 : r'(a-b-c)^2 = a^2 + b^2 + c^2 - 2ab + 2bc - 2ca',
    13 : r'x^3 + y^3 + z^3 - 3xyz = (x+y+z)(x^2 + y^2 + z^2 -xy - yz - zx)',
    14 : r'x^2 + y^2 + z^2 - xy - yz - zx = \frac{1}{2}[(x-y)^2 + (y-z)^2 + (z-x)^2]'

  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("ALGEBRA"),
        body: Container(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: algebra.length,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  myFormulaTableBlock(algebra[index]),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}