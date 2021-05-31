import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:catex/catex.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/rendering.dart';

class inverseTrigonometryFormula extends StatefulWidget {
  const inverseTrigonometryFormula({Key key}) : super(key: key);

  @override
  _inverseTrigonometryFormulaState createState() => _inverseTrigonometryFormulaState();
}

class _inverseTrigonometryFormulaState extends State<inverseTrigonometryFormula> {

  Widget myTrigHeading(String heading){
    return Column(
      children: [
        FittedBox(
          child: Text(
            heading,
            style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }

  Widget myTrigFormula(String text){
    return DefaultTextStyle(
      child: FittedBox(child: CaTeX(text)),
      style: TextStyle(
          fontSize: 25,
          color: Colors.black
      ),
    );
  }

  Map domainRange = {
    0 : [r'f(x)',r'DOMAIN', r'RANGE'],
    1 : [r'sin^{-1}x', r'[-1,1]', r'[-\frac{\pi}{2},\frac{\pi}{2}]'],
    2 : [r'cos^{-1}x', r'[-1,1]', r'[0,\frac{\pi}{2}]'],
    3 : [r'tan^{-1}x', r'R', r'(-\frac{\pi}{2},\frac{\pi}{2})'],
    4 : [r'cosec^{-1}x', r'R - (-1,1)', r'[-\frac{\pi}{2},\frac{\pi}{2}]'],
    5 : [r'sec^{-1}x', r'R - (-1,1)', r'[0,\pi]-\{\frac{\pi}{2}\}'],
    6 : [r'sin^{-1}x', r'R', r'[0,\pi]-\{0\}'],
  };

  Map minus = {
    0 : [r'1.\ sin^{-1}(-x) = -sin^{-1}x', r'x\ \epsilon\ [-1,1]'],
    1 : [r'2.\ cos^{-1}(-x) = \pi-cos^{-1}x', r'x\ \epsilon\ [-1,1]'],
    2 : [r'3.\ tan^{-1}(-x) = -sin^{-1}x', r'x\ \epsilon\ R'],
    3 : [r'4.\ cosec^{-1}(-x) = -cosec^{-1}x', r'|x| >= 1'],
    4 : [r'5.\ sec^{-1}(-x) = \pi-sec^{-1}x', r'|x| >= 1'],
    5 : [r'6.\ cot^{-1}(-x) = \pi-sec^{-1}x', r'x\ \epsilon\ R'],
  };

  Map complimentary = {
    0 : [r'1.\ sin^{-1}x + cos^{-1}x = \frac{\pi}{2}', r'x\ \epsilon\ [-\frac{\pi}{2},\frac{\pi}{2}]'],
    1 : [r'2.\ tan^{-1}x + cot^{-1}x = \frac{\pi}{2}', r'x\ \epsilon\ R'],
    2 : [r'3.\ sec^{-1}x + cosec^{-1}x = \frac{\pi}{2}', r'|x| >= 1'],
  };

  Map inverse = {
    0 : [r'1.\ sin^{-1}(\frac{1}{x}) = cosec^{-1}x ', r'|x| >= 1'],
    1 : [r'2.\ cos^{-1}(\frac{1}{x}) = sec^{-1}x', r'|x| >= 1'],
    2 : [r'3.\ tan^{-1}(\frac{1}{x}) = cot^{-1}x', r'x > 0'],
  };

  Map addition = {
    0 : [r'1.\ sin^{-1}x + sin^{-1}y =', r'sin^{-1}(x\sqrt{1-y^2} + y\sqrt{1-x^2})', r'x,y>=0\ and\ x^2 + y^2 <=1'],
    1 : [r'2.\ sin^{-1}x + sin^{-1}y =', r'\pi-sin^{-1}(x\sqrt{1-y^2} + y\sqrt{1-x^2})', r'x,y>=0\ and\ x^2 + y^2 >1'],
    2 : [r'3.\ sin^{-1}x - sin^{-1}y =', r'\pi-sin^{-1}(x\sqrt{1-y^2} - y\sqrt{1-x^2})', r'x,y>=0'],
    3 : [r'4.\ cos^{-1}x + cos^{-1}y =', r'cos^{-1}(xy - \sqrt{1-x^2}\sqrt{1-y^2})', r'x,y>=0\ and\ x^2 + y^2 <=1'],
    4 : [r'5.\ cos^{-1}x + cos^{-1}y =', r'\pi - cos^{-1}(xy - \sqrt{1-x^2}\sqrt{1-y^2})', r'x,y>=0\ and\ x^2 + y^2 >1'],
    5 : [r'6.\ cos^{-1}x - cos^{-1}y =', r'cos^{-1}(xy + \sqrt{1-x^2}\sqrt{1-y^2})', r'x,y>=0\ and\ x^2 + y^2 <=1'],
    6 : [r'7.\ cos^{-1}x + cos^{-1}y =', r'\pi - cos^{-1}(xy - \sqrt{1-x^2}\sqrt{1-y^2})', r'x,y>=0\ and\ x^2 + y^2 >1'],
    7 : [r'8.\ tan^{-1}x + tan^{-1}y =', r'tan^{-1}(\frac{x+y}{1-xy})', r'xy<1'],
    8 : [r'8.\ tan^{-1}x - tan^{-1}y =', r'tan^{-1}(\frac{x-y}{1+xy})', r'xy>-1'],
  };

  Map multiple = {
    0 : [r'1.\ 2tan^{-1}x = sin^{-1}(\frac{2x}{1+x^2})',r'|x| <= 1'],
    1 : [r'2.\ 2tan^{-1}x = cos^{-1}(\frac{1-x^2}{1+x^2})',r'x>=0'],
    2 : [r'3.\ 2tan^{-1}x = tan^{-1}(\frac{2x}{1-x^2})',r'|x| <= 1'],
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
                  myTrigHeading("DOMAIN AND RANGE"),
                  Container(
                      height: 560,
                      child: ListView.builder(
                        itemCount: domainRange.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index){
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
                                          child: CaTeX(domainRange[index][0]),
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
                                          child: CaTeX(domainRange[index][1]),
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
                                          child: CaTeX(domainRange[index][2]),
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
                  SizedBox(height: 50,),
                  myTrigHeading("COMPLIMENTARY"),
                  myTrigFormula(complimentary[0][0]),
                  myTrigFormula(complimentary[0][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(complimentary[1][0]),
                  myTrigFormula(complimentary[1][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(complimentary[2][0]),
                  myTrigFormula(complimentary[2][1]),
                  SizedBox(height: 50,),
                  myTrigHeading("INVERSE"),
                  myTrigFormula(inverse[0][0]),
                  myTrigFormula(inverse[0][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(inverse[1][0]),
                  myTrigFormula(inverse[1][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(inverse[2][0]),
                  myTrigFormula(inverse[2][1]),
                  SizedBox(height: 50,),
                  myTrigHeading("MINUS"),
                  myTrigFormula(minus[0][0]),
                  myTrigFormula(minus[0][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(minus[1][0]),
                  myTrigFormula(minus[1][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(minus[2][0]),
                  myTrigFormula(minus[2][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(minus[3][0]),
                  myTrigFormula(minus[3][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(minus[4][0]),
                  myTrigFormula(minus[4][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(minus[5][0]),
                  myTrigFormula(minus[5][1]),
                  SizedBox(height: 50,),
                  myTrigHeading("ADDITION AND SUBTRACTION"),
                  myTrigFormula(addition[0][0]),
                  myTrigFormula(addition[0][1]),
                  myTrigFormula(addition[0][2]),
                  SizedBox(height: 20,),
                  myTrigFormula(addition[1][0]),
                  myTrigFormula(addition[1][1]),
                  myTrigFormula(addition[1][2]),
                  SizedBox(height: 20,),
                  myTrigFormula(addition[2][0]),
                  myTrigFormula(addition[2][1]),
                  myTrigFormula(addition[2][2]),
                  SizedBox(height: 20,),
                  myTrigFormula(addition[3][0]),
                  myTrigFormula(addition[3][1]),
                  myTrigFormula(addition[3][2]),
                  SizedBox(height: 20,),
                  myTrigFormula(addition[4][0]),
                  myTrigFormula(addition[4][1]),
                  myTrigFormula(addition[4][2]),
                  SizedBox(height: 20,),
                  myTrigFormula(addition[5][0]),
                  myTrigFormula(addition[5][1]),
                  myTrigFormula(addition[5][2]),
                  SizedBox(height: 20,),
                  myTrigFormula(addition[6][0]),
                  myTrigFormula(addition[6][1]),
                  myTrigFormula(addition[6][2]),
                  SizedBox(height: 20,),
                  myTrigFormula(addition[7][0]),
                  myTrigFormula(addition[7][1]),
                  myTrigFormula(addition[7][2]),
                  SizedBox(height: 20,),
                  myTrigFormula(addition[8][0]),
                  myTrigFormula(addition[8][1]),
                  myTrigFormula(addition[8][2]),
                  SizedBox(height: 50,),
                  myTrigHeading("INVERSE"),
                  myTrigFormula(inverse[0][0]),
                  myTrigFormula(inverse[0][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(inverse[1][0]),
                  myTrigFormula(inverse[1][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(inverse[2][0]),
                  myTrigFormula(inverse[2][1]),
                  SizedBox(height: 50,),
                  myTrigHeading("MULTIPLE"),
                  myTrigFormula(multiple[0][0]),
                  myTrigFormula(multiple[0][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(multiple[1][0]),
                  myTrigFormula(multiple[1][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(multiple[2][0]),
                  myTrigFormula(multiple[2][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(multiple[3][0]),
                  myTrigFormula(multiple[3][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(multiple[4][0]),
                  myTrigFormula(multiple[4][1]),
                  SizedBox(height: 20,),
                  myTrigFormula(multiple[5][0]),
                  myTrigFormula(multiple[5][1]),
                ],
              ),
            ),
          ),
      ),
    );
  }
}