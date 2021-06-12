import 'package:dream_calc/calcs/linearCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';

Widget myLinearExpandedTextField(TextEditingController a){
  return Expanded(
    flex: 1,
    child: TextField(
      textAlign: TextAlign.center,
      controller: a,
      keyboardType: TextInputType.number,
      enableInteractiveSelection: true,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
      ],
      decoration: myInputDecoration(),
    ),
  );
}

Widget myLinearText(String text){
  return Expanded(
    child: FittedBox(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

Widget myLinearResult(String result){
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
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
        appBar: myAppBar("LINEAR EQUATION"),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    myLinearExpandedTextField(a1),
                    myLinearText(' x + '),
                    myLinearExpandedTextField(b1),
                    myLinearText(' y + '),
                    myLinearExpandedTextField(c1),
                    myLinearText(' z =  '),
                    myLinearExpandedTextField(d1),
                  ],
                ),
                SizedBox(height: 10,),

                Row(
                  children: [
                    myLinearExpandedTextField(a2),
                    myLinearText(' x + '),
                    myLinearExpandedTextField(b2),
                    myLinearText(' y + '),
                    myLinearExpandedTextField(c2),
                    myLinearText(' z =  '),
                    myLinearExpandedTextField(d2),
                  ],
                ),
                SizedBox(height: 10,),

                Row(
                  children: [
                    myLinearExpandedTextField(a3),
                    myLinearText(' x + '),
                    myLinearExpandedTextField(b3),
                    myLinearText(' y + '),
                    myLinearExpandedTextField(c3),
                    myLinearText(' z =  '),
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
                  child: FittedBox(
                    child: Text(
                      "CALCULATE",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                result == " "? Container() :
                myResultCard(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 200,
                    child: myLinearResult(result)
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
