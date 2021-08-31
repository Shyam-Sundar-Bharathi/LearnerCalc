import 'package:dream_calc/calcs/quadraticCalcs/quadraticCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/cupertino.dart';
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
          cursorColor: colors[colorTheme][9],
          style: TextStyle(fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          textInputAction: TextInputAction.next,
          enableInteractiveSelection: true,
          inputFormatters: [
            FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
          ],
          decoration: myInputDecoration(),
        ),
      );
  }

  Widget myQuadraticAnswerRow(String item, String answer,{topBlock = 0, bottomBlock = 0, isDisc = 0}){
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.center,
            height: 70,
            child: FittedBox(
              child: Text(
                item,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 70,
            child: Center(
              child: FittedBox(
                child: Text(
                  answer,
                  style: TextStyle(
                    color: answer == "CHECK INPUT" || answer == "a CAN'T BE 0" ? Colors.red :
                    answer.contains("i") || isDisc == 1? Colors.black : Colors.green,
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
    SystemChrome.setEnabledSystemUIOverlays([]);
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
            padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              children : [
              myCatexDisplayCard("ax^2 + bx + c = 0"),
              SizedBox(height: 10,),
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
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: userInputC,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontWeight: FontWeight.bold),
                            enableInteractiveSelection: true,
                            inputFormatters: [
                              FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                            ],
                            decoration: myInputDecoration(),
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
                    ],
                  ),
                  SizedBox(height: 20,),
                ],
              ),
                SizedBox(height: 20,),
                answers[0] == ''? Container() :
                myResultCard(
                  child: Column(
                    children: [
                      myQuadraticAnswerRow(' Root 1 : ', answers[0],topBlock: 1),
                      myQuadraticAnswerRow(' Root 2 : ', answers[1]),
                      myQuadraticAnswerRow(' Disc : ', answers[2],bottomBlock: 1, isDisc: 1),
                    ],
                  ),
                )
              ],
            ),

          )
        ),
      ),
    );
  }
}
