import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class coordinateFormula extends StatefulWidget {
  const coordinateFormula({Key key}) : super(key: key);

  @override
  _coordinateFormulaState createState() => _coordinateFormulaState();
}

class _coordinateFormulaState extends State<coordinateFormula> {

  Map quads = {
    0 : [r'Q',r'x',r'y'],
    1 : [r'Q1',r'+ve',r'+ve'],
    2 : [r'Q2',r'-ve',r'+ve'],
    3 : [r'Q3',r'-ve',r'-ve'],
    4 : [r'Q4',r'+ve',r'-ve'],
  };

  Map coGeo = {
    0 : [r'If\ points\ are\ (x_1,y_1)\ and\ (x_2,y_2)',r'D = \sqrt{(y_2 - y_1)^2 + (x_2 - x_1)^2}',
         r'If\ points\ are\ (0,0)\ and\ (x,y)', r'D = \sqrt{x^2 + y^2}'],
    1 : [r'Ratio = m:n\ (or)\ \frac{m}{n}', r'1.\ Internal\ Division',
         r'x = \frac{mx_2 + nx_1}{m+n}', r'y = \frac{my_2 + ny_1}{m+n}',
         r'2.\ External\ Division',
         r'x = \frac{mx_2 - nx_1}{m-n}', r'y = \frac{my_2 - ny_1}{m-n}',
         r'3.\ Mid-Point',
         r'x = \frac{x_2 + x_1}{2}', r'y = \frac{y_2 + y_1}{2}',],
    2 : [r'A(x_1,y_1)', r'B(x_2,y_2)', r'C(x_3,y_3)',
         r'A = \frac{1}{2}[x_1(y2-y3) + x_2(y3-y1) + x_3(y1-y2)]']
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          backgroundColor: colors[colorTheme][2],
          appBar: myAppBar("CO-ORDINATE GEOMETRY"),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myFormulaHeading("QUADRANTS", bigGap: 0),
                  Container(
                    height: 400,
                    child: ListView.builder(
                      itemCount: quads.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        return Row(
                          children: [
                            myFormulaTableBlock(quads[index][0]),
                            myFormulaTableBlock(quads[index][1]),
                            myFormulaTableBlock(quads[index][2]),
                          ],
                        );
                      },
                    ),
                  ),
                  myFormulaHeading("DISTANCE FORMULA"),
                  myFormula(coGeo[0][0]),
                  myFormula(coGeo[0][1]),
                  SizedBox(height: 20,),
                  myFormula(coGeo[0][2]),
                  myFormula(coGeo[0][3]),
                  myFormulaHeading("SECTION FORMULA"),
                  myFormula(coGeo[1][0]),
                  myFormula(coGeo[1][1]),
                  myFormula(coGeo[1][2]),
                  myFormula(coGeo[1][3]),
                  myFormula(coGeo[1][4]),
                  myFormula(coGeo[1][5]),
                  myFormula(coGeo[1][6]),
                  myFormula(coGeo[1][7]),
                  myFormula(coGeo[1][8]),
                  myFormula(coGeo[1][9]),
                  myFormulaHeading("AREA OF TRIANGLE"),
                  myFormula(coGeo[2][0]),
                  myFormula(coGeo[2][1]),
                  myFormula(coGeo[2][2]),
                  myFormula(coGeo[2][3]),
                ],
              ),
            ),
          )
      ),
    );
  }
}
