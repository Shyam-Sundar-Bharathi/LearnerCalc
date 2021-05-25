import 'package:dream_calc/calcs/quadraticCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class quadraticCalc extends StatefulWidget {
  const quadraticCalc({Key key}) : super(key: key);

  @override
  _quadraticCalcState createState() => _quadraticCalcState();
}

class _quadraticCalcState extends State<quadraticCalc> {

  TextEditingController userInputA = new TextEditingController();
  TextEditingController userInputB = new TextEditingController();
  TextEditingController userInputC = new TextEditingController();
  List<String> answers = ['','',''];
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
            'QUADRATIC EQUATION',
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
                  'ax² + bx + c = 0',
                  style: TextStyle(
                    fontSize: 25,
                  ),
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
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          textAlign: TextAlign.end,
                          controller: userInputA,
                          keyboardType: TextInputType.number,
                          enableInteractiveSelection: true,
                          onSubmitted: (text){
                            FocusScope.of(context).requestFocus(FocusNode());
                            setState(() {
                              answers = (userInputA.text == '' || userInputB.text == '' || userInputC.text == '')? null : quadCalc(userInputA.text, userInputB.text, userInputC.text);
                            });
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                          ],
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border:OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.zero,
                            ),
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Text(
                        'b : ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          textAlign: TextAlign.end,
                          controller: userInputB,
                          keyboardType: TextInputType.number,
                          enableInteractiveSelection: true,
                          onSubmitted: (text){
                            FocusScope.of(context).requestFocus(FocusNode());
                            setState(() {
                              answers = (userInputA.text == '' || userInputB.text == '' || userInputC.text == '')? null : quadCalc(userInputA.text, userInputB.text, userInputC.text);
                            });
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                          ],
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border:OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.zero,
                            ),
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
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
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          textAlign: TextAlign.end,
                          controller: userInputC,
                          keyboardType: TextInputType.number,
                          enableInteractiveSelection: true,
                          onSubmitted: (text){
                            FocusScope.of(context).requestFocus(FocusNode());
                            setState(() {
                              answers = (userInputA.text == '' || userInputB.text == '' || userInputC.text == '')? null : quadCalc(userInputA.text, userInputB.text, userInputC.text);
                            });
                          },
                          inputFormatters: [
                            FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                          ],
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border:OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.black, width: 2.0),
                              borderRadius: BorderRadius.zero,
                            ),
                            labelStyle: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                            minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                          ),
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            if(!(userInputA.text == '' || userInputB.text == '' || userInputC.text == '')){
                              setState(() {
                                answers =  quadCalc(userInputA.text, userInputB.text, userInputC.text);
                              });
                            }

                          },
                          child: Text(
                            "CALCULATE",
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
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
