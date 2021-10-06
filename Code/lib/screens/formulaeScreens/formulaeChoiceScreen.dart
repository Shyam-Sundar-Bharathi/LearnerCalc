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
    1 : ['PHYSICAL CONSTANTS', '/constantsFormulae'],
    2 : ['ASCII CHART',''],
    3 : ['GEOMETRIC AREA','/areaFormulae'],
    4 : ['GEOMETRIC VOLUME','/volumeFormulae'],
    5 : ['ALGEBRA', '/algebraFormulae'],
    6 : ['PROGRESSION', '/progressionFormulae'],
    7 : ['CENTRAL TENDENCY', '/centTendFormulae'],
    8 : ['LINEAR EQUATIONS', '/linearFormulae'],
    9 : ['QUADRATIC EQUATION','/quadraticFormulae'],
    10 : ['CO-ORDINATE GEOMETRY','/coordinateGeoFormulae'],
    11 : ['TRIGONOMETRY', '/trigonometryFormulae'],
    12 : ['INVERSE TRIGONOMETRY', '/inverseTrigonometryFormulae'],
    13 : ['DIFFERENTIATION', '/differentialFormulae'],
    14 : ['INTEGRATION', '/integralFormulae'],

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