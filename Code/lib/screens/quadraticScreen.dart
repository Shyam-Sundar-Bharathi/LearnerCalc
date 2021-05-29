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

  Widget myQuadraticAnswerRow(String item, String answer){
    return Row(
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
              item,
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
                answer,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  GlobalKey keyA = new GlobalKey();
  double width = 80;
  TextEditingController userInputA = new TextEditingController();
  TextEditingController userInputB = new TextEditingController();
  TextEditingController userInputC = new TextEditingController();
  List<String> answers = ['','',''];

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        width = keyA.currentContext.size.width;
      });
    });

  }

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
                          key: keyA,
                          textAlign: TextAlign.center,
                          controller: userInputA,
                          keyboardType: TextInputType.number,
                          enableInteractiveSelection: true,
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
                      SizedBox(width: 20,),
                      Expanded(
                        flex: 1,
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: userInputB,
                          keyboardType: TextInputType.number,
                          enableInteractiveSelection: true,
                          inputFormatters: [
                            FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                          ],
                          decoration: myInputDecoration,
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
                      Container(
                        width: width,
                        child: TextField(
                          textAlign: TextAlign.center,
                          controller: userInputC,
                          keyboardType: TextInputType.number,
                          enableInteractiveSelection: true,
                          inputFormatters: [
                            FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                          ],
                          decoration: myInputDecoration,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                          child: ElevatedButton(
                            style: myButtonStyle,
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  answers =  quadCalc(userInputA.text, userInputB.text, userInputC.text);
                                });
                            },
                            child: Text(
                              "CALCULATE",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: 20,),
                ],
              ),
                SizedBox(height: 20,),
                Column(
                  children: [
                    myQuadraticAnswerRow('Root 1 : ', answers[0]),
                    myQuadraticAnswerRow('Root 2 : ', answers[1]),
                    myQuadraticAnswerRow('Disc : ', answers[2]),
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
