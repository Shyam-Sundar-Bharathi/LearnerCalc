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
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget myBooleanTextField(TextEditingController cont,{bool lastBox = false}){
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
        decoration: myInputDecoration(),
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
            result = oneBitBooleanChoice(X.text, Y.text, fn);
          });
        },
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
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
                    myBooleanText('X : ',fontSize: 30),
                    myBooleanTextField(X),
                    SizedBox(width: 20,),
                    myBooleanText('Y : ',fontSize: 30),
                    myBooleanTextField(Y),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myBooleanButton("X", "X", 0),
                    SizedBox(width: 20,),
                    myBooleanButton("~Y", "~Y",1),
                    SizedBox(width: 20,),
                    myBooleanButton("X+Y", "X+Y", 2),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myBooleanButton("X.Y", "X.Y", 10),
                    SizedBox(width: 20,),
                    myBooleanButton( "X^Y", "X^Y", 11),
                    SizedBox(width: 20,),
                    myBooleanButton("A - B", "A - B", 3),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myBooleanButton("A^2", "A^2", 4),
                    SizedBox(width: 20,),
                    myBooleanButton("A^3", "A^3", 5),
                    SizedBox(width: 20,),
                    myBooleanButton("arg(A)", "arg(A)", 6),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myBooleanButton( " ",  "√A", 8),
                    SizedBox(width: 20,),
                    myBooleanButton(" ", "∛A", 9),
                    SizedBox(width: 20,),
                    myBooleanButton("arg(B)", "arg(B)", 7),
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
                          child: Text(
                            result == "CHECK INPUT" ? result :
                            choice == " " ? result :
                            "$choice = $result",
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
