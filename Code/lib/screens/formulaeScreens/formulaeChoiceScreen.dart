import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class formulaChoice extends StatefulWidget {
  const formulaChoice({Key key}) : super(key: key);

  @override
  _formulaChoiceState createState() => _formulaChoiceState();
}

class _formulaChoiceState extends State<formulaChoice> {

  Map choices = {
    0 : ['COMING SOON', '/comingSoon'],
    1 : ['POWERS OF TEN','/powersOfTenFormulae'],
    2 : ['ALGEBRA', '/algebraFormulae'],
    3 : ['PROGRESSION', '/progressionFormulae'],
    4 : ['CENTRAL TENDENCY', '/centTendFormulae'],
    5 : ['QUADRATIC EQUATION','/quadraticFormulae'],
    6 : ['TRIGONOMETRY', '/trigonometryFormulae'],
    7 : ['INVERSE TRIGONOMETRY', '/inverseTrigonometryFormulae'],
    8 : ['DIFFERENTIATION', '/differentialFormulae'],
    9 : ['INTEGRATION', '/integralFormulae'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[colorTheme][2],
      appBar: myAppBar("FORMULAE SHEET"),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
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
                            width: MediaQuery. of(context). size. width - 50,
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
                              style: myButtonStyle,
                              onPressed: (){
                                Navigator.pushNamed(context, choices[index][1]);
                              },
                            ),
                          ),
                        ],
                    ),
                    SizedBox(height: 20,),
                  ],
                );
            }
          ),
        ),
      )
    );
  }
}