import 'package:dream_calc/calcs/linearCalc.dart';
import 'package:flutter/material.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/screens/linearScreens/threeScreen.dart';
class linearTwo extends StatefulWidget {
  const linearTwo({Key key}) : super(key: key);

  @override
  _linearTwoState createState() => _linearTwoState();
}

class _linearTwoState extends State<linearTwo> {

  String result = " ";
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
        appBar: myAppBar("LINEAR EQUATIONS"),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    myLinearExpandedTextField(a1),
                    myLinearText(' x   + '),
                    myLinearExpandedTextField(b1),
                    myLinearText(' y = '),
                    myLinearExpandedTextField(c1),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    myLinearExpandedTextField(a2),
                    myLinearText(' x   + '),
                    myLinearExpandedTextField(b2),
                    myLinearText(' y = '),
                    myLinearExpandedTextField(c2, lastBox: true),
                  ],
                ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                      style: myButtonStyle,
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          result = calcxy(a1.text, b1.text, c1.text, a2.text, b2.text, c2.text);
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
                      SizedBox(width: 20,),
                      myClearButton((){
                        setState(() {
                          a1.text = "";
                          b1.text = "";
                          c1.text = "";
                          a2.text = "";
                          b2.text = "";
                          c2.text = "";
                          result = " ";
                         });
                      })
                    ],
                  ),
                SizedBox(height: 20,),
                result == " " ? Container() :
                myResultCard(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 30,
                    height: 200,
                    child: myLinearResult(result),
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
