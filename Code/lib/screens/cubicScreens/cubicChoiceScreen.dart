import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/services.dart';
class cubicChoice extends StatefulWidget {
  const cubicChoice({Key key}) : super(key: key);

  @override
  _cubicChoiceState createState() => _cubicChoiceState();
}

class _cubicChoiceState extends State<cubicChoice> {

  Map choices = {
    0 : ['SOLVE', '/cubic'],
    1 : ['FORM - REAL', '/cubicFormReal'],
    2 : ['FORM - COMPLEX', '/cubicFormImaginary'],
  };


  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("CUBIC EQUATION"),
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
                    SizedBox(height: 20,),
                  ],
                );
              }
          ),
        )
    );
  }
}
