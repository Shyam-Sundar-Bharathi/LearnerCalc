import 'package:dream_calc/calcs/quadraticCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class quadraticCalc extends StatefulWidget {
  const quadraticCalc({Key key}) : super(key: key);

  @override
  _quadraticCalcState createState() => _quadraticCalcState();
}

class _quadraticCalcState extends State<quadraticCalc> {

  Widget myQuadraticText(String text, {double fontSize = 20}){
    return FittedBox(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget myQuadraticTextField(TextEditingController cont,{Key key}){
    return Expanded(
        flex: 1,
        child: TextField(
          key: key,
          textAlign: TextAlign.center,
          controller: cont,
          keyboardType: TextInputType.number,
          enableInteractiveSelection: true,
          inputFormatters: [
            FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
          ],
          decoration: myInputDecoration(),
        ),
      );
  }

  Widget myQuadraticAnswerRow(String item, String answer,{topBlock = 0, bottomBlock = 0}){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            height: 70,
            decoration: BoxDecoration(
              border: Border.all(),
              color: Colors.white,
              borderRadius:  topBlock == 1 ? BorderRadius.only(topLeft: Radius.circular(10)) :
                             bottomBlock == 1 ? BorderRadius.only(bottomLeft: Radius.circular(10)) : BorderRadius.zero,
            ),
            child: FittedBox(
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 20,
                ),
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
              borderRadius:  topBlock == 1 ? BorderRadius.only(topRight: Radius.circular(10)) :
                             bottomBlock == 1 ? BorderRadius.only(bottomRight: Radius.circular(10)) : BorderRadius.zero,
            ),
            child: Center(
              child: FittedBox(
                child: Text(
                  answer,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
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
        appBar: myAppBar("QUADRATIC EQUATION"),
        //drawer: myDrawer(),
        body: SingleChildScrollView(
          child : Container(
            padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              children : [
              Center(
                child: myQuadraticText('ax² + bx + c = 0',fontSize: 30),
              ),
              SizedBox(height: 30,),
              Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myQuadraticText('a : '),
                      SizedBox(width: 20,),
                      myQuadraticTextField(userInputA, key: keyA),
                      SizedBox(width: 20,),
                      myQuadraticText('b : '),
                      SizedBox(width: 20,),
                      myQuadraticTextField(userInputB),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      myQuadraticText('c : '),
                      SizedBox(width: 20,),
                      Container(
                        width: width,
                        child: myQuadraticTextField(userInputC),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Container(
                          width: width,
                          child: ElevatedButton(
                            style: myButtonStyle,
                            onPressed: () {
                              FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  answers =  quadCalc(userInputA.text, userInputB.text, userInputC.text);
                                });
                            },
                            child: FittedBox(
                              child: Text(
                                "CALCULATE",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
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
                answers[0] == ''? Container() :
                Column(
                  children: [
                    myQuadraticAnswerRow('Root 1 : ', answers[0],topBlock: 1),
                    myQuadraticAnswerRow('Root 2 : ', answers[1]),
                    myQuadraticAnswerRow('Disc : ', answers[2],bottomBlock: 1),
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
