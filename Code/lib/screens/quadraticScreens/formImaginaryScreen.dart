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

  String result = " ";
  double width;
  TextEditingController real = new TextEditingController();
  TextEditingController imaginary = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    GlobalKey keyImaginary = new GlobalKey();
    void initState() {
      super.initState();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          width = keyImaginary.currentContext.size.width;
        });
        print(width);
      });
    }

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
                myCatexDisplayCard(r"Roots=> \alpha + i\beta\ ,\ \alpha - i\beta"),
                myCatexDisplayCard(r"Real\ \ part=> \alpha"),
                myCatexDisplayCard(r"Imaginary\ \ part=> \beta"),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    myQuadraticText("Real part: "),
                    myQuadraticTextField(real),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myQuadraticText("Imaginary part: "),
                    myQuadraticTextField(imaginary, lastBox: true, imaginary: true),
                  ],
                ),
                SizedBox(height: 20,),
                ElevatedButton(
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
