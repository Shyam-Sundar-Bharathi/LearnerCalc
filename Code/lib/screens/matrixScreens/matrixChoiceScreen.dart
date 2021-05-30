import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class matrixChoice extends StatefulWidget {
  const matrixChoice({Key key}) : super(key: key);

  @override
  _matrixChoiceState createState() => _matrixChoiceState();
}

class _matrixChoiceState extends State<matrixChoice> {

  Map choices = {
    0 : ['2 x 2', '/matrixTwo'],
    1 : ['3 x 3', '/matrixThree'],
    2 : ['4 x 4', '/matrixFour']
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[colorTheme][2],
      appBar: myAppBar("MATRIX"),
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
                        width: MediaQuery. of(context). size. width - 100,
                        child: ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              choices[index][0],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:30
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
