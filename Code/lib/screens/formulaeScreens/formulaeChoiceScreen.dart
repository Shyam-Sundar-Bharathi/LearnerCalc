import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/services.dart';
class formulaChoice extends StatefulWidget {
  const formulaChoice({Key key}) : super(key: key);

  @override
  _formulaChoiceState createState() => _formulaChoiceState();
}

class _formulaChoiceState extends State<formulaChoice> {

  Map choices = {
    0 : ['POWERS OF TEN','/powersOfTenFormulae'],
    1 : ['GEOMETRIC AREA','/areaFormulae'],
    2 : ['GEOMETRIC VOLUME','/volumeFormulae'],
    3 : ['ALGEBRA', '/algebraFormulae'],
    4 : ['PROGRESSION', '/progressionFormulae'],
    5 : ['CENTRAL TENDENCY', '/centTendFormulae'],
    6 : ['LINEAR EQUATIONS', '/linearFormulae'],
    7 : ['QUADRATIC EQUATION','/quadraticFormulae'],
    8 : ['CO-ORDINATE GEOMETRY','/coordinateGeoFormulae'],
    9 : ['TRIGONOMETRY', '/trigonometryFormulae'],
    10 : ['INVERSE TRIGONOMETRY', '/inverseTrigonometryFormulae'],
    11 : ['DIFFERENTIATION', '/differentialFormulae'],
    12 : ['INTEGRATION', '/integralFormulae'],

  };

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: colors[colorTheme][2],
      appBar: myAppBar("FORMULAE SHEET"),
      body: Container(
        padding: EdgeInsets.fromLTRB(2, 8, 2, 0),
        child: Center(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: choices.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery. of(context). size. width - 10,
                            child: ElevatedButton(
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: FittedBox(
                                  child: Text(
                                    choices[index][0],
                                    maxLines: 2,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25
                                    ),
                                  ),
                                ),
                              ),
                              style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(10),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                   RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(0)),
                                      )
                                    ),
                                  backgroundColor: MaterialStateProperty.resolveWith((states) => colors[colorTheme][9]),
                                  minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                              ),
                              onPressed: (){
                                Navigator.pushNamed(context, choices[index][1]);
                              },
                            ),
                          ),
                        ],
                    ),
                    SizedBox(height: 10,),
                  ],
                );
            }
          ),
        ),
      )
    );
  }
}