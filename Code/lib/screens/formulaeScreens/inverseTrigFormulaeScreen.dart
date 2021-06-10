import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/rendering.dart';

class inverseTrigonometryFormula extends StatefulWidget {
  const inverseTrigonometryFormula({Key key}) : super(key: key);

  @override
  _inverseTrigonometryFormulaState createState() => _inverseTrigonometryFormulaState();
}

class _inverseTrigonometryFormulaState extends State<inverseTrigonometryFormula> {

  Map domainRange = {
    0 : [r'f(x)',r'DOMAIN', r'RANGE'],
    1 : [r'sin^{-1}x', r'[-1,1]', r'[-\frac{\pi}{2},\frac{\pi}{2}]'],
    2 : [r'cos^{-1}x', r'[-1,1]', r'[0,\pi]'],
    3 : [r'tan^{-1}x', r'R', r'(-\frac{\pi}{2},\frac{\pi}{2})'],
    4 : [r'cosec^{-1}x', r'R - (-1,1)', r'[-\frac{\pi}{2},\frac{\pi}{2}]-\{0\}'],
    5 : [r'sec^{-1}x', r'R - (-1,1)', r'[0,\pi]-\{\frac{\pi}{2}\}'],
    6 : [r'cot^{-1}x', r'R', r'(0,\pi)'],
  };

  Map minus = {
    0 : [r'1.\ sin^{-1}(-x) = -sin^{-1}x', r'x\ \epsilon\ [-1,1]'],
    1 : [r'2.\ cos^{-1}(-x) = \pi-cos^{-1}x', r'x\ \epsilon\ [-1,1]'],
    2 : [r'3.\ tan^{-1}(-x) = -tan^{-1}x', r'x\ \epsilon\ R'],
    3 : [r'4.\ cosec^{-1}(-x) = -cosec^{-1}x', r'|x| \ge 1'],
    4 : [r'5.\ sec^{-1}(-x) = \pi-sec^{-1}x', r'|x| \ge 1'],
    5 : [r'6.\ cot^{-1}(-x) = \pi-cot^{-1}x', r'x\ \epsilon\ R'],
  };

  Map complimentary = {
    0 : [r'1.\ sin^{-1}x + cos^{-1}x = \frac{\pi}{2}', r'x\ \epsilon\ [-\frac{\pi}{2},\frac{\pi}{2}]'],
    1 : [r'2.\ tan^{-1}x + cot^{-1}x = \frac{\pi}{2}', r'x\ \epsilon\ R'],
    2 : [r'3.\ sec^{-1}x + cosec^{-1}x = \frac{\pi}{2}', r'|x| \ge 1'],
  };

  Map inverse = {
    0 : [r'1.\ sin^{-1}(\frac{1}{x}) = cosec^{-1}x ', r'|x| \ge 1'],
    1 : [r'2.\ cos^{-1}(\frac{1}{x}) = sec^{-1}x', r'|x| \ge 1'],
    2 : [r'3.\ tan^{-1}(\frac{1}{x}) = cot^{-1}x', r'x > 0'],
  };

  Map addition = {
    0 : [r'1.\ sin^{-1}x + sin^{-1}y =', r'sin^{-1}(x\sqrt{1-y^2} + y\sqrt{1-x^2})', r'x,y \ge 0\ and\ x^2 + y^2 \le 1'],
    1 : [r'2.\ sin^{-1}x + sin^{-1}y =', r'\pi-sin^{-1}(x\sqrt{1-y^2} + y\sqrt{1-x^2})', r'x,y \ge 0\ and\ x^2 + y^2 >1'],
    2 : [r'3.\ sin^{-1}x - sin^{-1}y =', r'\pi-sin^{-1}(x\sqrt{1-y^2} - y\sqrt{1-x^2})', r'x,y \ge 0'],
    3 : [r'4.\ cos^{-1}x + cos^{-1}y =', r'cos^{-1}(xy - \sqrt{1-x^2}\sqrt{1-y^2})', r'x,y \ge 0\ and\ x^2 + y^2 \le 1'],
    4 : [r'5.\ cos^{-1}x + cos^{-1}y =', r'\pi - cos^{-1}(xy - \sqrt{1-x^2}\sqrt{1-y^2})', r'x,y \ge 0\ and\ x^2 + y^2 >1'],
    5 : [r'6.\ cos^{-1}x - cos^{-1}y =', r'cos^{-1}(xy + \sqrt{1-x^2}\sqrt{1-y^2})', r'x,y \ge 0\ and\ x^2 + y^2 \le 1'],
    6 : [r'7.\ cos^{-1}x + cos^{-1}y =', r'\pi - cos^{-1}(xy - \sqrt{1-x^2}\sqrt{1-y^2})', r'x,y \ge 0\ and\ x^2 + y^2 >1'],
    7 : [r'8.\ tan^{-1}x + tan^{-1}y =', r'tan^{-1}(\frac{x+y}{1-xy})', r'xy<1'],
    8 : [r'8.\ tan^{-1}x - tan^{-1}y =', r'tan^{-1}(\frac{x-y}{1+xy})', r'xy>-1'],
  };

  Map multiple = {
    0 : [r'1.\ 2tan^{-1}x = sin^{-1}(\frac{2x}{1+x^2})',r'|x| \le 1'],
    1 : [r'2.\ 2tan^{-1}x = cos^{-1}(\frac{1-x^2}{1+x^2})',r'x \ge 0'],
    2 : [r'3.\ 2tan^{-1}x = tan^{-1}(\frac{2x}{1-x^2})',r'|x| \le 1'],
    3 : [r'4.\ 3sin^{-1}x = sin^{-1}(3x-4x^3)',r'x\ \epsilon\ R'],
    4 : [r'5.\ 3cos^{-1}x = cos^{-1}(4x^3-3x)',r'x\ \epsilon\ R'],
    5 : [r'6.\ 3tan^{-1}x = tan^{-1}(\frac{3x-x^3}{1-3x^2})',r'x\ \epsilon\ R'],
  };


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          backgroundColor: colors[colorTheme][2],
          appBar: myAppBar("INVERSE TRIGONOMETRY"),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  myFormulaHeading("DOMAIN AND RANGE", bigGap: 0),
                  Container(
                      height: 560,
                      child: ListView.builder(
                        itemCount: domainRange.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index){
                          return Row(
                            children: [
                              myFormulaTableBlock(domainRange[index][0]),
                              myFormulaTableBlock(domainRange[index][1]),
                              myFormulaTableBlock(domainRange[index][2]),
                            ],
                          );
                        },
                      ),
                    ),
                  myFormulaHeading("COMPLIMENTARY"),
                  myFormula(complimentary[0][0]),
                  myFormula(complimentary[0][1]),
                  SizedBox(height: 20,),
                  myFormula(complimentary[1][0]),
                  myFormula(complimentary[1][1]),
                  SizedBox(height: 20,),
                  myFormula(complimentary[2][0]),
                  myFormula(complimentary[2][1]),
                  myFormulaHeading("INVERSE"),
                  myFormula(inverse[0][0]),
                  myFormula(inverse[0][1]),
                  SizedBox(height: 20,),
                  myFormula(inverse[1][0]),
                  myFormula(inverse[1][1]),
                  SizedBox(height: 20,),
                  myFormula(inverse[2][0]),
                  myFormula(inverse[2][1]),
                  myFormulaHeading("MINUS"),
                  myFormula(minus[0][0]),
                  myFormula(minus[0][1]),
                  SizedBox(height: 20,),
                  myFormula(minus[1][0]),
                  myFormula(minus[1][1]),
                  SizedBox(height: 20,),
                  myFormula(minus[2][0]),
                  myFormula(minus[2][1]),
                  SizedBox(height: 20,),
                  myFormula(minus[3][0]),
                  myFormula(minus[3][1]),
                  SizedBox(height: 20,),
                  myFormula(minus[4][0]),
                  myFormula(minus[4][1]),
                  SizedBox(height: 20,),
                  myFormula(minus[5][0]),
                  myFormula(minus[5][1]),
                  myFormulaHeading("ADDITION AND SUBTRACTION"),
                  myFormula(addition[0][0]),
                  myFormula(addition[0][1]),
                  myFormula(addition[0][2]),
                  SizedBox(height: 20,),
                  myFormula(addition[1][0]),
                  myFormula(addition[1][1]),
                  myFormula(addition[1][2]),
                  SizedBox(height: 20,),
                  myFormula(addition[2][0]),
                  myFormula(addition[2][1]),
                  myFormula(addition[2][2]),
                  SizedBox(height: 20,),
                  myFormula(addition[3][0]),
                  myFormula(addition[3][1]),
                  myFormula(addition[3][2]),
                  SizedBox(height: 20,),
                  myFormula(addition[4][0]),
                  myFormula(addition[4][1]),
                  myFormula(addition[4][2]),
                  SizedBox(height: 20,),
                  myFormula(addition[5][0]),
                  myFormula(addition[5][1]),
                  myFormula(addition[5][2]),
                  SizedBox(height: 20,),
                  myFormula(addition[6][0]),
                  myFormula(addition[6][1]),
                  myFormula(addition[6][2]),
                  SizedBox(height: 20,),
                  myFormula(addition[7][0]),
                  myFormula(addition[7][1]),
                  myFormula(addition[7][2]),
                  SizedBox(height: 20,),
                  myFormula(addition[8][0]),
                  myFormula(addition[8][1]),
                  myFormula(addition[8][2]),
                  myFormulaHeading("INVERSE"),
                  myFormula(inverse[0][0]),
                  myFormula(inverse[0][1]),
                  SizedBox(height: 20,),
                  myFormula(inverse[1][0]),
                  myFormula(inverse[1][1]),
                  SizedBox(height: 20,),
                  myFormula(inverse[2][0]),
                  myFormula(inverse[2][1]),
                  myFormulaHeading("MULTIPLE"),
                  myFormula(multiple[0][0]),
                  myFormula(multiple[0][1]),
                  SizedBox(height: 20,),
                  myFormula(multiple[1][0]),
                  myFormula(multiple[1][1]),
                  SizedBox(height: 20,),
                  myFormula(multiple[2][0]),
                  myFormula(multiple[2][1]),
                  SizedBox(height: 20,),
                  myFormula(multiple[3][0]),
                  myFormula(multiple[3][1]),
                  SizedBox(height: 20,),
                  myFormula(multiple[4][0]),
                  myFormula(multiple[4][1]),
                  SizedBox(height: 20,),
                  myFormula(multiple[5][0]),
                  myFormula(multiple[5][1]),
                  SizedBox(height: 50,)
                ],
              ),
            ),
          ),
      ),
    );
  }
}