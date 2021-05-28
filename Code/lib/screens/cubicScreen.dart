import 'package:dream_calc/calcs/cubicCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class cubicCalc extends StatefulWidget {
  const cubicCalc({Key key}) : super(key: key);

  @override
  _cubicCalcState createState() => _cubicCalcState();
}

class _cubicCalcState extends State<cubicCalc> {

  TextEditingController userInputA = new TextEditingController();
  TextEditingController userInputB = new TextEditingController();
  TextEditingController userInputC = new TextEditingController();
  TextEditingController userInputD = new TextEditingController();
  List<String> answers = ['','','',''];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: AppBar(
          backgroundColor: colors[colorTheme][9],
          title: Text(
            'CUBIC EQUATION',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: colors[colorTheme][1],
            ),
          ),
        ),
        //drawer: myDrawer(),
        body: SingleChildScrollView(
            child : Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              child: Column(
                children : [
                  Center(
                    child: Text(
                      'ax³ + bx² + cx + d = 0',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  SizedBox(height: 2,),
                  Text(
                    'Please note that d is an integer',
                    style: TextStyle(
                      fontSize: 15
                    ),
                  ),
                  SizedBox(height: 30,),
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'a : ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: userInputA,
                              keyboardType: TextInputType.number,
                              enableInteractiveSelection: true,
                              onSubmitted: (text){
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  answers = (userInputA.text == '' || userInputB.text == '' || userInputC.text == '' || userInputD.text == '')? null : cubeCalc(userInputA.text, userInputB.text, userInputC.text, userInputD.text);
                                });
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                              ],
                              decoration: myInputDecoration,
                            ),
                          ),
                          SizedBox(width: 20,),
                          Text(
                            'b : ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: userInputB,
                              keyboardType: TextInputType.number,
                              enableInteractiveSelection: true,
                              onSubmitted: (text){
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  answers = (userInputA.text == '' || userInputB.text == '' || userInputC.text == '' || userInputD.text == '')? null : cubeCalc(userInputA.text, userInputB.text, userInputC.text, userInputD.text);
                                });
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                              ],
                              decoration: myInputDecoration,
                            ),
                          ),
                          SizedBox(width: 5,)
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'c : ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: userInputC,
                              keyboardType: TextInputType.number,
                              enableInteractiveSelection: true,
                              onSubmitted: (text){
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  answers = (userInputA.text == '' || userInputB.text == '' || userInputC.text == '' || userInputD.text == '')? null : cubeCalc(userInputA.text, userInputB.text, userInputC.text, userInputD.text);
                                });
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                              ],
                              decoration: myInputDecoration,
                            ),
                          ),
                          SizedBox(width: 20,),
                          Text(
                            'd : ',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(width: 5,),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: userInputD,
                              keyboardType: TextInputType.number,
                              enableInteractiveSelection: true,
                              onSubmitted: (text){
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  answers = (userInputA.text == '' || userInputB.text == '' || userInputC.text == '' || userInputD.text == '')? null : cubeCalc(userInputA.text, userInputB.text, userInputC.text, userInputD.text);
                                });
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter(RegExp('[0-9-]'), allow: true),
                              ],
                              decoration: myInputDecoration,
                            ),
                          ),
                          SizedBox(width: 5,)
                        ],
                      ),
                      SizedBox(height: 20,),
                      ElevatedButton(
                        style: myButtonStyle,
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          setState(() {
                            answers = cubeCalc(userInputA.text, userInputB.text, userInputC.text, userInputD.text);
                          });
                        },
                        child: Text(
                          "CALCULATE",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.white,
                              ),
                              child: Text(
                                'Root 1 : ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  answers[0],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.white,
                              ),
                              child: Text(
                                'Root 2 : ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  answers[1],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.white,
                              ),
                              child: Text(
                                'Root 3 : ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  answers[2],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.white,
                              ),
                              child: Text(
                                'Disc : ',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  answers[3],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),

            )
        ),
      ),
    );
  }
}
