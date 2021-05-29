import 'package:dream_calc/calcs/linearCalc.dart';
import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/screens/linearScreens/linearThreeScreen.dart';

class linearOne extends StatefulWidget {
  const linearOne({Key key}) : super(key: key);

  @override
  _linearOneState createState() => _linearOneState();
}

class _linearOneState extends State<linearOne> {

  String result = " ";
  TextEditingController a = new TextEditingController();
  TextEditingController b = new TextEditingController();

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
                    myLinearExpandedTextField(a),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          '   x   + ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    myLinearExpandedTextField(b),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          ' =   0 ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                  style: myButtonStyle,
                  onPressed: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {
                      result = calcx(a.text, b.text);
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
                result ==  " " ? Container() :
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
