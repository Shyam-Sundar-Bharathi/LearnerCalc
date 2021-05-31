import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:catex/catex.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class powersOfTen extends StatefulWidget {
  const powersOfTen({Key key}) : super(key: key);

  @override
  _powersOfTenState createState() => _powersOfTenState();
}

class _powersOfTenState extends State<powersOfTen> {

  Map powers = {
    0 : [r'POWER',r'\ NAME\ ',r'SYMBOL'],
    1 : [r'10^{24}',r'yotta',r'Y'],
    2 : [r'10^{21}',r'zetta',r'Z'],
    3 : [r'10^{18}',r'exa',r'E'],
    4 : [r'10^{15}',r'peta',r'P'],
    5 : [r'10^{12}',r'tera',r'T'],
    6 : [r'10^9',r'giga',r'G'],
    7 : [r'10^6',r'mega',r'M'],
    8 : [r'10^3',r'kilo',r'k'],
    9 : [r'10^2',r'hecto',r'h'],
    10 : [r'10^1',r'deca',r'da'],
    11 : [r'10^{-1}',r'deci',r'd'],
    12 : [r'10^{-2}',r'centi',r'c'],
    13 : [r'10^{-3}',r'milli',r'm'],
    14 : [r'10^{-6}',r'micro',r'\mu'],
    15 : [r'10^{-9}',r'nano',r'n'],
    16 : [r'10^{-12}',r'pico',r'p'],
    17 : [r'10^{-15}',r'femto',r'f'],
    18 : [r'10^{-18}',r'atto',r'a'],
    19 : [r'10^{-21}',r'zepto',r'z'],
    20 : [r'10^{-24}',r'yotto',r'y'],
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("POWERS OF TEN"),
        body: Container(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: powers.length,
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
                              child: CaTeX(powers[index][0]),
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
                              child: CaTeX(powers[index][1]),
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
                              child: CaTeX(powers[index][2]),
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