import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/rendering.dart';

class constantsFormula extends StatefulWidget {
  const constantsFormula({Key key}) : super(key: key);

  @override
  _constantsFormulaState createState() => _constantsFormulaState();
}

class _constantsFormulaState extends State<constantsFormula> {

  Map constants = {
    0 : ['c', r'2.99 \times 10^8\ m/s'],
    1 : ['G', r'6.67 \times 10^{-11}\ Nm^2/kg^2'],
    2 : ['h', r'6.62 \times 10^{-34}\ Js'],
    3 : ['hc', r'1.986 \times 10^{-25}\ Jm'],
    4 : ['e', r'1.602 \times 10^{-19}\ C'],
    5 : [r'\epsilon_0', r'8.854 \times 10^{-12}\ C^2/Nm^2'],
    6 : [r'\mu_0', r'1.257 \times 10^{-7}\ T/mA'],
    7 : [r'N_A', r'6.022 \times 10^{23}\ /mol'],
    8 : [r'k', r'1.38 \times 10^{-23}\ J/K'],
    9 : [r'R', r'8.314\ J/molK'],
    10 : [r'\sigma', r'5.67 \times 10^{-8}\ W/m^2K^4'],
    11 : [r'm_u', r'1.66 \times 10^{-27}\ kg'],
    12 : [r'm_e', r'9.1 \times 10^{-31}\ kg'],
    13 : [r'm_p', r'1.672 \times 10^{-27}\ kg'],
    14 : [r'H_0', r'69.3 \times 10^{-12}\ km/s/Mpc'],
    15 : ['f_{Cs}', '9,192,631,770\ Hz'],
    16 : [r'\hbar', r'1.054 \times 10^{-34}\ Js'],
    17 : [r'b', '2.898\ mm K'],
    18 : [r'K_{cd}', '683\ lm/W'],



  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("CONSTANTS"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 1520,
                  child: ListView.builder(
                    itemCount: constants.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Row(
                        children: [
                          myFormulaTableBlock(constants[index][0], flex: 1),
                          myFormulaTableBlock(constants[index][1], flex: 2),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}