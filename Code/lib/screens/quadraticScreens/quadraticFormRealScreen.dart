import 'package:catex/catex.dart';
import 'package:dream_calc/calcs/quadraticCalcs/quadraticFormRealCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class quadraticFormReal extends StatefulWidget {
  const quadraticFormReal({Key key}) : super(key: key);

  @override
  _quadraticFormRealState createState() => _quadraticFormRealState();
}

class _quadraticFormRealState extends State<quadraticFormReal> {

  Widget myQuadraticTextField(TextEditingController cont,{Key key, lastBox = false}){
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
          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
        ],
        decoration: myInputDecoration(),
      ),
    );
  }

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

  String result = " ";
  TextEditingController userInput1 = new TextEditingController();
  TextEditingController userInput2 = new TextEditingController();

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
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myQuadraticText("Root 1 : "),
                    myQuadraticTextField(userInput1),
                    SizedBox(width: 10,),
                    myQuadraticText("Root 2 : "),
                    myQuadraticTextField(userInput2, lastBox: true),
                  ],
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: myButtonStyle,
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {
                      result = equation(userInput1.text, userInput2.text);
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
                SizedBox(height: 10,),
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
          ),
        ),
      ),
    );
  }
}
