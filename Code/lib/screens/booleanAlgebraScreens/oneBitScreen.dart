import 'package:catex/catex.dart';
import 'package:dream_calc/calcs/booleanAlgebraCalcs/oneBitCalc.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class oneBitBooleanAlgebra extends StatefulWidget {
  const oneBitBooleanAlgebra({Key key}) : super(key: key);

  @override
  _oneBitBooleanAlgebraState createState() => _oneBitBooleanAlgebraState();
}

class _oneBitBooleanAlgebraState extends State<oneBitBooleanAlgebra> {

  Widget myBooleanText(String text, {double fontSize = 20}){
    return Expanded(
      child: DefaultTextStyle(
        child: CaTeX(text),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: fontSize,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget myBooleanTextField(TextEditingController cont,{bool lastBox = false, String labelText, Color labelColor = Colors.grey, bool alignLabel = true}){
    return Expanded(
      flex: 2,
      child: TextField(
        textAlign: TextAlign.center,
        controller: cont,
        cursorColor: colors[colorTheme][9],
        style: TextStyle(fontWeight: FontWeight.bold),
        keyboardType: TextInputType.number,
        textInputAction: lastBox ? TextInputAction.done : TextInputAction.next,
        enableInteractiveSelection: true,
        onSubmitted: (text){},
        inputFormatters: [
          FilteringTextInputFormatter(RegExp('[0-1]'), allow: true),
          LengthLimitingTextInputFormatter(1),
        ],
        decoration: myInputDecoration(labelText : labelText, labelColor: labelColor, alignLabel: alignLabel),
      ),
    );
  }

  Widget myBooleanButton(String ch, String text, int fn){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            choice = ch;
            result = oneBitBooleanChoice(X.text, Y.text, fn, ch);
          });
        },
        child: FittedBox(
          child: DefaultTextStyle(
            child: CaTeX(text),
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
  String choice = " " , result = " ";
  TextEditingController X = new TextEditingController();
  TextEditingController Y = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("BOOLEAN ALGEBRA"),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    myBooleanTextField(X, labelText: "x"),
                    SizedBox(width: 20,),
                    myBooleanTextField(Y, labelText: "y")
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myBooleanButton(r"\tilde x", r"\tilde x", 0),
                    SizedBox(width: 20,),
                    myBooleanButton(r"\tilde y", r"\tilde y",1),
                    SizedBox(width: 20,),
                    myBooleanButton("x+y", "x+y", 2),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myBooleanButton(r"\tilde(x+y)", r"\tilde(x+y)", 3),
                    SizedBox(width: 20,),
                    myBooleanButton( r"x.y", r"x.y", 4),
                    SizedBox(width: 20,),
                    myBooleanButton(r"\tilde(x.y)", r"\tilde(x.y)", 5),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myBooleanButton(r"x \oplus y", r"x \oplus y", 6),
                    SizedBox(width: 20,),
                    myBooleanButton(r"\tilde(x \oplus y)", r"\tilde(x \oplus y)", 7),
                    SizedBox(width: 20,),
                    myBooleanButton(r"x \rightarrow y", r"x \rightarrow y", 8),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myBooleanButton(r"x \leftrightarrow y",  r"x \leftrightarrow y", 9),
                    SizedBox(width: 20,),
                    myBooleanButton(r"x+ \tilde y", r"x+ \tilde y", 10),
                    SizedBox(width: 20,),
                    myBooleanButton(r"x. (\tilde y)", r"x. (\tilde y)", 11),
                  ],
                ),
                SizedBox(height: 20,),
                myClearButton((){
                  setState(() {
                    X.text = "";
                    Y.text = "";
                    result = " ";
                  });
                }),
                SizedBox(height: 20,),
                result == " " ? Container() :
                myResultCard(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 200,
                    child: Center(
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: result == "CHECK INPUT" ? Text(
                            result,
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ) : DefaultTextStyle(
                            child: CaTeX(result),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
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
