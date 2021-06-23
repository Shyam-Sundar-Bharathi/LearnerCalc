import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/rendering.dart';

class areaFormula extends StatefulWidget {
  const areaFormula({Key key}) : super(key: key);

  @override
  _areaFormulaState createState() => _areaFormulaState();
}

class _areaFormulaState extends State<areaFormula> {

  Map area = {
    0 : ['SHAPE', 'AREA'],
    1 : ['SQUARE', 'a^2'],
    2 : ['RECTANGLE', r'lb'],
    3 : ['TRIANGLE', r'\frac{1}{2}(bh)'],
    4 : ['CIRCLE', r'\pi r^2'],
    5 : ['PARALLELOGRAM', r'bh'],
    6 : ['RHOMBUS', r'\frac{1}{2}(d_1d_2)'],
    7 : ['TRAPEZOID', r'\frac{1}{2}(b_1 + b_2)h'],
    8 : ['ELLIPSE', r'\pi a b'],

  };

  Map surfaceArea = {
    0 : ['SHAPE', 'AREA'],
    1 : ['CUBE', '6a^2'],
    2 : ['CUBOID', r'2(lb + bh + lh)'],
    3 : ['SPHERE', r'4 \pi r^2'],
    4 : ['CYLINDER', r'2 \pi r(r + h)'],
    5 : ['CONE', r'\frac{1}{3} \pi r(l + r)'],
    6 : ['HEMISPHERE', r'3 \pi r^2']
  };


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("AREA"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ElevatedButton(
                    style: myButtonStyle,
                    onPressed: () {
                      Navigator.pushNamed(context, '/area');
                    },
                    child: FittedBox(
                      child: Text(
                        "GO TO AREA CALCULATOR",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                myFormulaHeading("PLANE AREA", bigGap: 0),
                Container(
                  height: 720,
                  child: ListView.builder(
                    itemCount: area.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Row(
                        children: [
                          myFormulaTableBlock(area[index][0]),
                          myFormulaTableBlock(area[index][1]),
                        ],
                      );
                    },
                  ),
                ),
                myFormulaHeading("SURFACE AREA", bigGap: 1),
                Container(
                  height: 560,
                  child: ListView.builder(
                    itemCount: area.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Row(
                        children: [
                          myFormulaTableBlock(surfaceArea[index][0]),
                          myFormulaTableBlock(surfaceArea[index][1]),
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