import 'package:dream_calc/calcs/linearCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/screens/menu.dart';

Widget myLinearExpandedTextField(TextEditingController a){
  return Expanded(
    flex: 1,
    child: TextField(
      textAlign: TextAlign.center,
      controller: a,
      keyboardType: TextInputType.number,
      enableInteractiveSelection: true,
      onSubmitted: (text){},
      inputFormatters: [
        FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
      ],
      decoration: myInputDecoration,
    ),
  );
}
class linearThree extends StatefulWidget {
  const linearThree({Key key}) : super(key: key);

  @override
  _linearThreeState createState() => _linearThreeState();
}

class _linearThreeState extends State<linearThree> {

  String result = " ";
  TextEditingController a1 = new TextEditingController();
  TextEditingController b1 = new TextEditingController();
  TextEditingController c1 = new TextEditingController();
  TextEditingController d1 = new TextEditingController();
  TextEditingController a2 = new TextEditingController();
  TextEditingController b2 = new TextEditingController();
  TextEditingController c2 = new TextEditingController();
  TextEditingController d2 = new TextEditingController();
  TextEditingController a3 = new TextEditingController();
  TextEditingController b3 = new TextEditingController();
  TextEditingController c3 = new TextEditingController();
  TextEditingController d3 = new TextEditingController();

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
            'LINEAR EQUATION',
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
                    myLinearExpandedTextField(a1),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          ' x + ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    myLinearExpandedTextField(b1),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          ' y + ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    myLinearExpandedTextField(c1),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          ' z =  ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    myLinearExpandedTextField(d1),
                  ],
                ),
                SizedBox(height: 10,),

                Row(
                  children: [
                    myLinearExpandedTextField(a2),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          ' x + ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    myLinearExpandedTextField(b2),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          ' y + ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    myLinearExpandedTextField(c2),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          ' z =  ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    myLinearExpandedTextField(d2),
                  ],
                ),
                SizedBox(height: 10,),

                Row(
                  children: [
                    myLinearExpandedTextField(a3),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          ' x + ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    myLinearExpandedTextField(b3),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          ' y + ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    myLinearExpandedTextField(c3),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          ' z =  ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    myLinearExpandedTextField(d3),
                  ],
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: myButtonStyle,
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {
                      result = calcxyz(a1.text, b1.text, c1.text, d1.text, a2.text, b2.text, c2.text, d2.text, a3.text, b3.text, c3.text, d3.text);
                    });
                  },
                  child: Text(
                    "CALCULATE",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                result == " "? Container() :
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Text(
                        result,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
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
