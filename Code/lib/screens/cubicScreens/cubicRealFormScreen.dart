import 'package:catex/catex.dart';
import 'package:dream_calc/calcs/cubicCalcs/cubicFormRealCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class cubicFormReal extends StatefulWidget {
  const cubicFormReal({Key key}) : super(key: key);

  @override
  _cubicFormRealState createState() => _cubicFormRealState();
}

class _cubicFormRealState extends State<cubicFormReal> {

  Widget myCubicText(String text, {double fontSize = 20}){
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

  Widget myCubicTextField(TextEditingController cont,{Key key}){
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

  String result = " ";
  GlobalKey keyA = new GlobalKey();
  double width = 80;
  TextEditingController userInput1 = new TextEditingController();
  TextEditingController userInput2 = new TextEditingController();
  TextEditingController userInput3 = new TextEditingController();

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
        appBar: myAppBar("CUBIC EQUATION"),
        //drawer: myDrawer(),
        body: SingleChildScrollView(
            child : Container(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Column(
                children : [
                  Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          myCubicText('Root 1 : '),
                          SizedBox(width: 20,),
                          myCubicTextField(userInput1, key: keyA),
                          SizedBox(width: 20,),
                          myCubicText('Root 2 : '),
                          SizedBox(width: 20,),
                          myCubicTextField(userInput2),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          myCubicText('Root 3 : '),
                          SizedBox(width: 20,),
                          Container(
                            width: width,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: userInput3,
                              keyboardType: TextInputType.number,
                              enableInteractiveSelection: true,
                              style: TextStyle(fontWeight: FontWeight.bold),
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
                                  result = equation(userInput1.text, userInput2.text, userInput3.text);
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
                  SizedBox(height: 30,),
                  result == " " ? Container() :
                  myResultCard(
                    child: Container(
                      width: MediaQuery.of(context).size.width - 30,
                      height: 200,
                      child: Center(
                        child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DefaultTextStyle(
                              child: result == "CHECK INPUT" ? Text(result) : CaTeX(result),
                              style: TextStyle(
                                color: result == "CHECK INPUT" ? Colors.red : Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
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
