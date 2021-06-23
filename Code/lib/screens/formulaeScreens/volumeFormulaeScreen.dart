import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/rendering.dart';

class volumeFormula extends StatefulWidget {
  const volumeFormula({Key key}) : super(key: key);

  @override
  _volumeFormulaState createState() => _volumeFormulaState();
}

class _volumeFormulaState extends State<volumeFormula> {

  Map volume = {
    0 : ['SHAPE', 'VOLUME'],
    1 : ['CUBE', 'a^3'],
    2 : ['CUBOID', r'lbh'],
    3 : ['SPHERE', r'\frac{4}{3} \pi r^3'],
    4 : ['CYLINDER', r'\pi r^2h'],
    5 : ['CONE', r'\frac{1}{3} \pi r^2h'],
    6 : ['HEMISPHERE', r'\frac{2}{3} \pi r^3'],
    7 : ['TETRAHEDRON', r'\frac{a^3}{6 \sqrt{2}}'],

  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("VOLUME"),
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
                      Navigator.pushNamed(context, '/volume');
                    },
                    child: FittedBox(
                      child: Text(
                        "GO TO VOLUME CALCULATOR",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 640,
                  child: ListView.builder(
                    itemCount: volume.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      return Row(
                        children: [
                          myFormulaTableBlock(volume[index][0]),
                          myFormulaTableBlock(volume[index][1]),
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