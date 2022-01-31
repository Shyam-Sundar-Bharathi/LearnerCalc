import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/rendering.dart';

class booleanAlgebraFormula extends StatefulWidget {
  const booleanAlgebraFormula({Key key}) : super(key: key);

  @override
  _booleanAlgebraFormulaState createState() => _booleanAlgebraFormulaState();
}

class _booleanAlgebraFormulaState extends State<booleanAlgebraFormula> {

  Map notX = {
    0 : [r'x',r'\tilde x'],
    1 : [r'0', r'1'],
    2 : [r'1', r'0'],
  };

  Map orXY = {
    0 : [r'x',r'y', r'x+y'],
    1 : [r'0', r'0', r'0'],
    2 : [r'0', r'1', r'1'],
    3 : [r'1', r'0', r'1'],
    4 : [r'1', r'1', r'1'],
  };

  Map norXY = {
    0 : [r'x',r'y', r'\tilde (x+y)'],
    1 : [r'0', r'0', r'1'],
    2 : [r'0', r'1', r'0'],
    3 : [r'1', r'0', r'0'],
    4 : [r'1', r'1', r'0'],
  };

  Map andXY = {
    0 : [r'x',r'y', r'x.y'],
    1 : [r'0', r'0', r'0'],
    2 : [r'0', r'1', r'0'],
    3 : [r'1', r'0', r'0'],
    4 : [r'1', r'1', r'1'],
  };

  Map nandXY = {
    0 : [r'x',r'y', r'\tilde (x.y)'],
    1 : [r'0', r'0', r'1'],
    2 : [r'0', r'1', r'1'],
    3 : [r'1', r'0', r'1'],
    4 : [r'1', r'1', r'0'],
  };

  Map xorXY = {
    0 : [r'x',r'y', r'x \oplus y'],
    1 : [r'0', r'0', r'0'],
    2 : [r'0', r'1', r'1'],
    3 : [r'1', r'0', r'1'],
    4 : [r'1', r'1', r'0'],
  };

  Map xnorXY = {
    0 : [r'x',r'y', r'\tilde (x \oplus y)'],
    1 : [r'0', r'0', r'1'],
    2 : [r'0', r'1', r'0'],
    3 : [r'1', r'0', r'0'],
    4 : [r'1', r'1', r'1'],
  };

  Map ifXY = {
    0 : [r'x',r'y', r'x \rightarrow y'],
    1 : [r'0', r'0', r'1'],
    2 : [r'0', r'1', r'1'],
    3 : [r'1', r'0', r'0'],
    4 : [r'1', r'1', r'1'],
  };

  Map iffXY = {
    0 : [r'x',r'y', r'x \leftrightarrow y'],
    1 : [r'0', r'0', r'1'],
    2 : [r'0', r'1', r'0'],
    3 : [r'1', r'0', r'0'],
    4 : [r'1', r'1', r'1'],
  };

  Map annulment = {
    0 : r'x.0 = 0',
    1 : r'x + 1 = 1',
  };

  Map identity = {
    0 : r'x + 0 = x',
    1 : r'x.1 = x',
  };

  Map idempotent = {
    0 : r'x + x = x',
    1 : r'x.x = x',
  };

  Map complement = {
    0 : r'x.(\tilde x) = 0',
    1 : r'x + \tilde x = 1',
  };

  Map commutative = {
    0 : r'x.y = y.x',
    1 : r'x + y = y + x',
  };

  Map negation = {
    0 : r'\tilde(\tilde x) = x',
  };

  Map deMorgan = {
    0 : r'\tilde(x.y) = \tilde x + \tilde y',
    1 : r'\tilde(x+y) = (\tilde x).(\tilde y)',
  };

  Map distributive = {
    0 : r'x.(y+z) = x.y + x.z',
    1 : r'x + yz = (x+y)(x+z)',
  };

  Map absorptive = {
    0 : r'x + xy = x',
    1 : r'x(x+y) = x',
    2 : r'x.y + y.z + \tilde x.z = x.y + \tilde x.z',
    3 : r'(x+y).(y+z).(\tilde x+z) = (x+y)(\tilde x + z)',
  };

  Map associative = {
    0 : r'x + (y + z) = (x+y) + z',
    1 : r'x.(y.z) = (x.y).z',
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("BOOLEAN ALGEBRA"),
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
                      Navigator.pushNamed(context, '/booleanAlgebra');
                    },
                    child: FittedBox(
                      child: Text(
                        "GO TO BOOLEAN ALGEBRA CALCULATOR",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                myFormulaHeading("NOT X", bigGap: 0),
                Container(
                  height: 240,
                  child: ListView.builder(
                    itemCount: notX.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Row(
                        children: [
                          myFormulaTableBlock(notX[index][0]),
                          myFormulaTableBlock(notX[index][1]),
                        ],
                      );
                    },
                  ),
                ),
                myFormulaHeading("X OR Y", bigGap: 0),
                Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: orXY.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Row(
                        children: [
                          myFormulaTableBlock(orXY[index][0]),
                          myFormulaTableBlock(orXY[index][1]),
                          myFormulaTableBlock(orXY[index][2]),
                        ],
                      );
                    },
                  ),
                ),
                myFormulaHeading("X AND Y", bigGap: 0),
                Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: andXY.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Row(
                        children: [
                          myFormulaTableBlock(andXY[index][0]),
                          myFormulaTableBlock(andXY[index][1]),
                          myFormulaTableBlock(andXY[index][2]),
                        ],
                      );
                    },
                  ),
                ),
                myFormulaHeading("X NOR Y", bigGap: 0),
                Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: norXY.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Row(
                        children: [
                          myFormulaTableBlock(norXY[index][0]),
                          myFormulaTableBlock(norXY[index][1]),
                          myFormulaTableBlock(norXY[index][2]),
                        ],
                      );
                    },
                  ),
                ),
                myFormulaHeading("X NAND Y", bigGap: 0),
                Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: nandXY.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Row(
                        children: [
                          myFormulaTableBlock(nandXY[index][0]),
                          myFormulaTableBlock(nandXY[index][1]),
                          myFormulaTableBlock(nandXY[index][2]),
                        ],
                      );
                    },
                  ),
                ),
                myFormulaHeading("X XOR Y", bigGap: 0),
                Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: xorXY.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Row(
                        children: [
                          myFormulaTableBlock(xorXY[index][0]),
                          myFormulaTableBlock(xorXY[index][1]),
                          myFormulaTableBlock(xorXY[index][2]),
                        ],
                      );
                    },
                  ),
                ),
                myFormulaHeading("X XNOR Y", bigGap: 0),
                Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: xnorXY.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Row(
                        children: [
                          myFormulaTableBlock(xnorXY[index][0]),
                          myFormulaTableBlock(xnorXY[index][1]),
                          myFormulaTableBlock(xnorXY[index][2]),
                        ],
                      );
                    },
                  ),
                ),
                myFormulaHeading("X IMPLIES Y", bigGap: 0),
                Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: ifXY.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Row(
                        children: [
                          myFormulaTableBlock(ifXY[index][0]),
                          myFormulaTableBlock(ifXY[index][1]),
                          myFormulaTableBlock(ifXY[index][2]),
                        ],
                      );
                    },
                  ),
                ),
                myFormulaHeading("X IFF Y", bigGap: 0),
                Container(
                  height: 400,
                  child: ListView.builder(
                    itemCount: iffXY.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Row(
                        children: [
                          myFormulaTableBlock(iffXY[index][0]),
                          myFormulaTableBlock(iffXY[index][1]),
                          myFormulaTableBlock(iffXY[index][2]),
                        ],
                      );
                    },
                  ),
                ),
                myFormulaHeading("ANNULMENT"),
                myFormula(annulment[0]),
                myFormula(annulment[1]),
                myFormulaHeading("IDENTITY"),
                myFormula(identity[0]),
                myFormula(identity[1]),
                myFormulaHeading("IDEMPOTENT"),
                myFormula(idempotent[0]),
                myFormula(idempotent[1]),
                myFormulaHeading("COMPLEMENT"),
                myFormula(complement[0]),
                myFormula(complement[1]),
                myFormulaHeading("COMMUTATIVE"),
                myFormula(commutative[0]),
                myFormula(commutative[1]),
                myFormulaHeading("NEGATION"),
                myFormula(negation[0]),
                myFormulaHeading("deMORGAN"),
                myFormula(deMorgan[0]),
                myFormula(deMorgan[1]),
                myFormulaHeading("DISTRIBUTIVE"),
                myFormula(distributive[0]),
                myFormula(distributive[1]),
                myFormulaHeading("ABSORPTIVE"),
                myFormula(absorptive[0]),
                myFormula(absorptive[1]),
                myFormula(absorptive[2]),
                myFormula(absorptive[3]),
                myFormulaHeading("ASSOCIATIVE"),
                myFormula(associative[0]),
                myFormula(associative[1]),
                SizedBox(height: 50,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}