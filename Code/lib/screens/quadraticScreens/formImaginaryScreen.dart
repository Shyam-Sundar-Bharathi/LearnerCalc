import 'package:catex/catex.dart';
import 'package:dream_calc/calcs/quadraticCalcs/quadraticFormImaginaryCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class quadraticFormImaginary extends StatefulWidget {
  const quadraticFormImaginary({Key key}) : super(key: key);

  @override
  _quadraticFormImaginaryState createState() => _quadraticFormImaginaryState();
}

class _quadraticFormImaginaryState extends State<quadraticFormImaginary> {

  Widget myQuadraticTextField(TextEditingController cont,{Key key, lastBox = false, imaginary = false}){
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
          imaginary ? FilteringTextInputFormatter(RegExp('[0-9.]'), allow: true) : FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
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

  Widget myQuadraticCatexText(String text, {double fontSize = 20}){
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

  String result = " ";
  TextEditingController real = new TextEditingController();
  TextEditingController imaginary = new TextEditingController();

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
              //crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                myCatexDisplayCard(r"Roots=> \alpha + i\beta\ ,\ \alpha - i\beta"),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    myQuadraticCatexText(r"\alpha :"),
                    SizedBox(width: 20,),
                    myQuadraticTextField(real),
                    SizedBox(width: 20,),
                    myQuadraticCatexText(r"\beta :"),
                    SizedBox(width: 20,),
                    myQuadraticTextField(imaginary, lastBox: true, imaginary: true),
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
                            result = equation(real.text, imaginary.text);
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
                        real.text = "";
                        imaginary.text = "";
                        result = " ";
                      });
                    })
                  ],
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
