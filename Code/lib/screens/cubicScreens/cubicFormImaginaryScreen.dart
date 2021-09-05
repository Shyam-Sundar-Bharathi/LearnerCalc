import 'package:catex/catex.dart';
import 'package:dream_calc/calcs/cubicCalcs/cubicFormImaginaryCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class cubicFormImaginary extends StatefulWidget {
  const cubicFormImaginary({Key key}) : super(key: key);

  @override
  _cubicFormImaginaryState createState() => _cubicFormImaginaryState();
}

class _cubicFormImaginaryState extends State<cubicFormImaginary> {

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

  Widget myCubicCatexText(String text, {double fontSize = 20}){
    return FittedBox(
      child: DefaultTextStyle(
        child: CaTeX(text),
        style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget myCubicTextField(TextEditingController cont,{Key key, complex = false, lastBox = false}){
    return Expanded(
      flex: 1,
      child: TextField(
        key: key,
        textAlign: TextAlign.center,
        controller: cont,
        cursorColor: colors[colorTheme][9],
        style: TextStyle(fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        textInputAction: lastBox ? TextInputAction.done : TextInputAction.next,
        enableInteractiveSelection: true,
        inputFormatters: [
          complex ? FilteringTextInputFormatter(RegExp('[0-9.]'), allow: true) : FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
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
                      myCatexDisplayCard(r"Real\ Root => x"),
                      myCatexDisplayCard(r"Complex\ Root\ 1 = > \alpha + i\beta"),
                      myCatexDisplayCard(r"Complex\ Root\ 2 = > \alpha - i\beta"),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          myCubicCatexText(r'x : '),
                          SizedBox(width: 20,),
                          myCubicTextField(userInput1, key: keyA),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          myCubicCatexText(r'\alpha : '),
                          SizedBox(width: 20,),
                          myCubicTextField(userInput2),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          myCubicCatexText(r'\beta : '),
                          SizedBox(width: 20,),
                          myCubicTextField(userInput3, complex: true, lastBox: true),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
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
                          SizedBox(width: 20,),
                          myClearButton((){
                            setState(() {
                              userInput1.text = "";
                              userInput2.text = "";
                              userInput3.text = "";
                              result = " ";
                            });
                          })
                        ],
                      )
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
