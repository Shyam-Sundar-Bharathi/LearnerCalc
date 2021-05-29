import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
class formulaChoice extends StatefulWidget {
  const formulaChoice({Key key}) : super(key: key);

  @override
  _formulaChoiceState createState() => _formulaChoiceState();
}

class _formulaChoiceState extends State<formulaChoice> {

  Map choices = {
    0 : ['COMING SOON', '/comingSoon'],
    1 : ['TRIANGLES', '/trianglesFormulae'],
    2 : ['QUADRATIC EQUATION','/quadraticFormulae'],
    3 : ['TRIGONOMETRY', '/trigonometryFormulae'],
    4 : ['INVERSE TRIGONOMETRY', '/inverseTrigonometryFormulae'],
    5 : ['DIFFERENTIAL', '/differentialFormulae'],
    6 : ['INTEGRAL', '/integralFormulae'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[colorTheme][2],
      appBar: AppBar(
        backgroundColor: colors[colorTheme][9],
        title: Text(
          'FORMULAE SHEET',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: colors[colorTheme][1],
          ),
        ),
      ),
      body: Center(
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
                                  maxLines: 1,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize:30
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
                  SizedBox(height: 10,),
                ],
              );
          }
        ),
      )
    );
  }
}