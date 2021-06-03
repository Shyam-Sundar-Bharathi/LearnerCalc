import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/calcs/complexCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class complex extends StatefulWidget {
  const complex({Key key}) : super(key: key);

  @override
  _complexState createState() => _complexState();
}

class _complexState extends State<complex> {

  Widget myComplexText(String text, {double fontSize = 25}){
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

  Widget myComplexTextField(TextEditingController cont){
    return Expanded(
      flex: 2,
      child: TextField(
        textAlign: TextAlign.center,
        controller: cont,
        keyboardType: TextInputType.number,
        enableInteractiveSelection: true,
        onSubmitted: (text){},
        inputFormatters: [
          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
        ],
        decoration: myInputDecoration(),
      ),
    );
  }

  Widget myComplexButton(String ch, String text, int fn){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            choice = ch;
            result = complexChoice(a1.text, b1.text, a2.text, b2.text, fn);
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
  TextEditingController a1 = new TextEditingController();
  TextEditingController b1 = new TextEditingController();
  TextEditingController a2 = new TextEditingController();
  TextEditingController b2 = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("COMPLEX"),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    myComplexText('A : ',fontSize: 30),
                    myComplexTextField(a1),
                    myComplexText(' +'),
                    myComplexTextField(b1),
                    myComplexText(' i'),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    myComplexText('B : ', fontSize: 30),
                    myComplexTextField(a2),
                    myComplexText(' +'),
                    myComplexTextField(b2),
                    myComplexText(' i'),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myComplexButton("| A |", "| A |", 0),
                    SizedBox(width: 20,),
                    myComplexButton("| B |", "| B |",1),
                    SizedBox(width: 20,),
                    myComplexButton("A + B", "A + B", 2),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myComplexButton("A * B", "A * B", 10),
                    SizedBox(width: 20,),
                    myComplexButton( "A / B", "A / B", 11),
                    SizedBox(width: 20,),
                    myComplexButton("A - B", "A - B", 3),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myComplexButton("A^2", "A^2", 4),
                    SizedBox(width: 20,),
                    myComplexButton("A^3", "A^3", 5),
                    SizedBox(width: 20,),
                    myComplexButton("arg(A)", "arg(A)", 6),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myComplexButton( " ",  "√A", 8),
                    SizedBox(width: 20,),
                    myComplexButton(" ", "∛A", 9),
                    SizedBox(width: 20,),
                    myComplexButton("arg(B)", "arg(B)", 7),
                  ],
                ),
                SizedBox(height: 20,),
                result == " " ? Container() :
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 200,
                  decoration: myResultContainerDecoration,
                  child: Center(
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          result == "CHECK INPUT" ? result :
                          choice == " " ? result :
                          "$choice = $result",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
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
