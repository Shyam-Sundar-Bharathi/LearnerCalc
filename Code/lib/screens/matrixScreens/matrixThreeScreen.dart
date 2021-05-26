import 'package:dream_calc/calcs/matrixCalcs/matrixThreeCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/screens/menu.dart';

class matrixThree extends StatefulWidget {
  const matrixThree({Key key}) : super(key: key);

  @override
  _matrixThreeState createState() => _matrixThreeState();
}

class _matrixThreeState extends State<matrixThree> {

  String choice =  " ";
  Widget result = Container();
  TextEditingController a1 = new TextEditingController();
  TextEditingController b1 = new TextEditingController();
  TextEditingController c1 = new TextEditingController();
  TextEditingController a2 = new TextEditingController();
  TextEditingController b2 = new TextEditingController();
  TextEditingController c2 = new TextEditingController();
  TextEditingController a3 = new TextEditingController();
  TextEditingController b3 = new TextEditingController();
  TextEditingController c3 = new TextEditingController();

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
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.zero,
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
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
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.zero,
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
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
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.zero,
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
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
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.zero,
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
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
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.zero,
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
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
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.zero,
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: a3,
                              keyboardType: TextInputType.number,
                              enableInteractiveSelection: true,
                              onSubmitted: (text){},
                              inputFormatters: [
                                FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                              ],
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.zero,
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: b3,
                              keyboardType: TextInputType.number,
                              enableInteractiveSelection: true,
                              onSubmitted: (text){},
                              inputFormatters: [
                                FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                              ],
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.zero,
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: c3,
                              keyboardType: TextInputType.number,
                              enableInteractiveSelection: true,
                              onSubmitted: (text){},
                              inputFormatters: [
                                FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                              ],
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border:OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.black, width: 2.0),
                                  borderRadius: BorderRadius.zero,
                                ),
                                labelStyle: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                                minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                              ),
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  choice = "TRANSPOSE";
                                  result = transposeThree(a1.text, b1.text, c1.text, a2.text, b2.text, c2.text,a3.text, b3.text, c3.text);
                                });
                              },
                              child: Text(
                                "TRANSPOSE",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                                minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                              ),
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  choice = "DETERMINANT";
                                  result = detThree(a1.text, b1.text, c1.text, a2.text, b2.text, c2.text,a3.text, b3.text, c3.text);
                                });
                              },
                              child: Text(
                                "DETERMINANT",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                                minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                              ),
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  choice = "TRACE";
                                  result = traceThree(a1.text, b1.text, c1.text, a2.text, b2.text, c2.text,a3.text, b3.text, c3.text);
                                });
                              },
                              child: Text(
                                "TRACE",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                                minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                              ),
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  choice = "INVERSE";
                                  result = inverseThree(a1.text, b1.text, c1.text, a2.text, b2.text, c2.text,a3.text, b3.text, c3.text);
                                });
                              },
                              child: Text(
                                "INVERSE",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
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