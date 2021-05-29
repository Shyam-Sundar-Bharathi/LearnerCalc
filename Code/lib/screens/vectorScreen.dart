import 'package:dream_calc/calcs/vectorCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/screens/menu.dart';

class vector extends StatefulWidget {
  const vector({Key key}) : super(key: key);

  @override
  _vectorState createState() => _vectorState();
}

class _vectorState extends State<vector> {


  Widget myVectorButton(String ch, String text, int fn){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            choice = ch;
            result = vectorChoice(a1.text, b1.text, c1.text, a2.text, b2.text, c2.text, fn);
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
  TextEditingController c1 = new TextEditingController();
  TextEditingController a2 = new TextEditingController();
  TextEditingController b2 = new TextEditingController();
  TextEditingController c2 = new TextEditingController();

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
            'VECTOR',
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
                        decoration: myInputDecoration
                      ),
                    ),
                    Expanded(
                      child: Text(
                          ' i +',
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
                        ' j +',
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
                        controller: c1,
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
                      child: Text(
                        ' k',
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
                        decoration: myInputDecoration,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ' i +',
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
                        decoration: myInputDecoration,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        ' j +',
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
                        controller: c2,
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
                      child: Text(
                        ' k',
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myVectorButton("| A |", "| A |", 0),
                    SizedBox(width: 20),
                    myVectorButton("| B |", "| B |", 1),
                    SizedBox(width: 20),
                    myVectorButton("A + B", "A + B", 2),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myVectorButton("A - B", "A - B", 3),
                    SizedBox(width: 20),
                    myVectorButton("A.B", "A . B", 4),
                    SizedBox(width: 20),
                    myVectorButton("A x B", "A x B", 5),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    myVectorButton("B x A", "B x A", 6),
                    SizedBox(width: 20),
                    myVectorButton("A * B", "A * B", 7),
                    SizedBox(width: 20),
                    myVectorButton("Angle", "∠", 8),
                  ],
                ),
                SizedBox(height: 30,),
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
                          result == "CHECK INPUT" ? result : "$choice = $result",
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
