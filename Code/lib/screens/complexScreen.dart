import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/calcs/complexCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class complex extends StatefulWidget {
  const complex({Key key}) : super(key: key);

  @override
  _complexState createState() => _complexState();
}

class _complexState extends State<complex> {


  Widget myComplexButton(String ch, String res, String text){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            choice = ch;
            result = res;
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
        appBar: AppBar(
          backgroundColor: colors[colorTheme][9],
          title: Text(
            'COMPLEX',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: colors[colorTheme][1],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'A : ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: a1,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: myInputDecoration,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(
                        ' +',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: b1,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: myInputDecoration
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ' i',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        'B : ',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: a2,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: myInputDecoration
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ' +',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: b2,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: myInputDecoration
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ' i',
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  //mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myComplexButton("| A |", mod(a1.text,b1.text), "| A |"),
                    SizedBox(width: 20,),
                    myComplexButton("| B |", mod(a2.text,b2.text), "| B |"),
                    SizedBox(width: 20,),
                    myComplexButton("A + B", add(a1.text,b1.text,a2.text,b2.text), "A + B"),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myComplexButton("A * B", mul(a1.text,b1.text,a2.text,b2.text), "A * B"),
                    SizedBox(width: 20,),
                    myComplexButton( "A / B", div(a1.text,b1.text,a2.text,b2.text), "A / B"),
                    SizedBox(width: 20,),
                    myComplexButton("A - B", sub(a1.text,b1.text,a2.text,b2.text), "A - B"),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myComplexButton("A^2", power(a1.text,b1.text,2), "A^2"),
                    SizedBox(width: 20,),
                    myComplexButton("A^3", power(a1.text,b1.text,3), "A^3"),
                    SizedBox(width: 20,),
                    myComplexButton("arg(A)", arg(a1.text,b1.text), "arg(A)"),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myComplexButton( " ", roots(a1.text,b1.text,2), "√A"),
                    SizedBox(width: 20,),
                    myComplexButton(" ", roots(a1.text,b1.text,3), "∛A"),
                    SizedBox(width: 20,),
                    myComplexButton("arg(B)", arg(a2.text,b2.text), "arg(B)"),
                  ],
                ),
                SizedBox(height: 20,),
                result == " " ? Container() :
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white,
                  ),
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
