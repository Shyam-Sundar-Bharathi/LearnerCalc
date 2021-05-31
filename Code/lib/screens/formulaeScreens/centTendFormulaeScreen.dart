import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:catex/catex.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class centTendFormula extends StatefulWidget {
  const centTendFormula({Key key}) : super(key: key);

  @override
  _centTendFormulaState createState() => _centTendFormulaState();
}

class _centTendFormulaState extends State<centTendFormula> {

  Widget myCentTendHeading(String text){
    return FittedBox(
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20,
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget myCentTendFormula(String text){
    return FittedBox(
      child: DefaultTextStyle(
        child: CaTeX(text),
        style: TextStyle(
            fontSize: 25,
            color: Colors.black
        ),
      ),
    );
  }

  Map centTend = {
    0 : r'If\ x_1,x_2,x_3 \cdot\cdot\cdot x_n\ are\ n\ readings',
    1 : [r'AM = \frac{x_1+x_2+x_3+\ \cdot\cdot\cdot \ +x_n}{n}',r'(or)\ \mu=\frac{\sum{x_i}}{n}'],
    2 : r'GM = (x_1x_2x_3 \cdot\cdot\cdot x_n)^{\frac{1}{n}}',
    3 : r'HM = \frac{n}{\frac{1}{x_1}+\frac{1}{x_2}+\frac{1}{x_3}+ \cdot\cdot\cdot+ \frac{1}{x_n}}',
    4 : [r'If\ x_1,x_2 \cdot\cdot\cdot x_n\ is\ in\ ascending\ order', r'1.\ If\ n\ is\ even',r'Median = \frac{x_{(\ \frac{n}{2}\ )} + x_{(\ \frac{n}{2}+1\ )}}{2}',
      r'1.\ If\ n\ is\ odd',r'Median = x_{(\ \frac{n+1}{2}\ )}'],
    5 : r'\sigma^2 = \frac{\sum (x_i - \mu)^2}{n}',
    6 : r'\sigma = \sqrt{\frac{\sum (x_i - \mu)^2}{n}}',
    7 : r'CV= \frac{\sigma}{\mu}',
    8 : r'Range = Largest\ reading - smallest\ reading'
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          backgroundColor: colors[colorTheme][2],
          appBar: myAppBar("CENTRAL TENDENCY"),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  ElevatedButton(
                    style: myButtonStyle,
                    onPressed: () {
                      Navigator.pushNamed(context, '/centTend');
                    },
                    child: FittedBox(
                      child: Text(
                        "GO TO CENTRAL TENDENCY CALCULATOR",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      myCentTendFormula(centTend[0]),
                      SizedBox(height: 50,),
                      myCentTendHeading("ARITHMETIC MEAN"),
                      myCentTendFormula(centTend[1][0]),
                      myCentTendFormula(centTend[1][1]),
                      SizedBox(height: 50,),
                      myCentTendHeading("GEOMETRIC MEAN"),
                      myCentTendFormula(centTend[2]),
                      SizedBox(height: 50,),
                      myCentTendHeading("HARMONIC MEAN"),
                      myCentTendFormula(centTend[3]),
                      SizedBox(height: 50,),
                      myCentTendHeading("MEDIAN"),
                      myCentTendFormula(centTend[4][0]),
                      SizedBox(height: 20,),
                      myCentTendFormula(centTend[4][1]),
                      myCentTendFormula(centTend[4][2]),
                      SizedBox(height: 10,),
                      myCentTendFormula(centTend[4][3]),
                      myCentTendFormula(centTend[4][4]),
                      SizedBox(height: 50,),
                      myCentTendHeading("VARIANCE"),
                      myCentTendFormula(centTend[5]),
                      SizedBox(height: 50,),
                      myCentTendHeading("STANDARD DEVIATION"),
                      myCentTendFormula(centTend[6]),
                      SizedBox(height: 50,),
                      myCentTendHeading("CO-EFFICIENT OF VARIATION"),
                      myCentTendFormula(centTend[7]),
                      SizedBox(height: 50,),
                      myCentTendHeading("RANGE"),
                      myCentTendFormula(centTend[8]),
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
