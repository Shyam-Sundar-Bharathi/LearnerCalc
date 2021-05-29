import 'package:dream_calc/calcs/matrixCalcs/matrixTwoCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/screens/matrixScreens/matrixFourScreen.dart';

class matrixTwo extends StatefulWidget {
  const matrixTwo({Key key}) : super(key: key);

  @override
  _matrixTwoState createState() => _matrixTwoState();
}


class _matrixTwoState extends State<matrixTwo> {

  String choice = " ";
  Widget result = Container();
  TextEditingController a1 = new TextEditingController();
  TextEditingController b1 = new TextEditingController();
  TextEditingController a2 = new TextEditingController();
  TextEditingController b2 = new TextEditingController();


  Widget myMatrixButton(String text, pressed()){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: pressed,
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
            'MATRIX',
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
                    myExpandedTextField(a1),
                    myExpandedTextField(b1),
                  ],
                ),
                Row(
                  children: [
                    myExpandedTextField(a2),
                    myExpandedTextField(b2),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    myMatrixButton("TRANSPOSE",
                          () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          choice = "TRANSPOSE";
                          result = transposeTwo(a1.text, b1.text, a2.text, b2.text);
                        });
                      },
                    ),
                    SizedBox(width: 20,),
                    myMatrixButton("DETERMINANT",() {
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        choice = "DETERMINANT";
                        result = detTwo(a1.text, b1.text, a2.text, b2.text);
                      });
                    },
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    myMatrixButton("TRACE",() {
                      FocusScope.of(context).requestFocus(FocusNode());
                      setState(() {
                        choice = "TRACE";
                        result = traceTwo(a1.text, b1.text, a2.text, b2.text);
                      });
                    },),
                    SizedBox(width: 20,),
                    myMatrixButton("INVERSE",() {
                    FocusScope.of(context).requestFocus(FocusNode());
                    setState(() {
                    choice = "INVERSE";
                    result = inverseTwo(a1.text, b1.text, a2.text, b2.text);
                    });
                    },),
                  ],
                ),
                SizedBox(height: 40,),
                choice == " "?
                Container() : Container(
                  width: MediaQuery.of(context).size.width - 30,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        FittedBox(
                          child: Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              choice,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        result,
                      ],
                    ),
                  ),
                ),
            ]
        ),
      ),
    )
    ));
  }
}
