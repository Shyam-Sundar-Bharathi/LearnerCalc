import 'package:dream_calc/calcs/matrixCalcs/matrixFourCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/screens/menu.dart';

class matrixFour extends StatefulWidget {
  const matrixFour({Key key}) : super(key: key);

  @override
  _matrixFourState createState() => _matrixFourState();
}

class _matrixFourState extends State<matrixFour> {

  String choice = " ";
  Widget result = Container();
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
  TextEditingController a4 = new TextEditingController();
  TextEditingController b4 = new TextEditingController();
  TextEditingController c4 = new TextEditingController();
  TextEditingController d4 = new TextEditingController();

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
                          Expanded(
                            flex: 1,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: d1,
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
                          Expanded(
                            flex: 1,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: d2,
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
                          Expanded(
                            flex: 1,
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: d3,
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
                              controller: a4,
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
                              controller: b4,
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
                              controller: c4,
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
                              controller: d4,
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
                              style: myButtonStyle,
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  choice = "TRANSPOSE";
                                  result = transposeFour(a1.text, b1.text, c1.text, d1.text, a2.text, b2.text, c2.text, d2.text, a3.text, b3.text, c3.text, d3.text, a4.text, b4.text, c4.text, d4.text);
                                });
                              },
                              child: Text(
                                "TRANSPOSE",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: ElevatedButton(
                              style: myButtonStyle,
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  choice = "DETERMINANT";
                                  result = detFour(a1.text, b1.text, c1.text, d1.text, a2.text, b2.text, c2.text, d2.text, a3.text, b3.text, c3.text, d3.text, a4.text, b4.text, c4.text, d4.text);
                                });
                              },
                              child: Text(
                                "DETERMINANT",
                                style: TextStyle(
                                  color: Colors.white,
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
                              style: myButtonStyle,
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  choice = "TRACE";
                                  result = traceFour(a1.text, b1.text, c1.text, d1.text, a2.text, b2.text, c2.text, d2.text, a3.text, b3.text, c3.text, d3.text, a4.text, b4.text, c4.text, d4.text);
                                });
                              },
                              child: Text(
                                "TRACE",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: ElevatedButton(
                              style: myButtonStyle,
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  choice = "INVERSE";
                                  result = inverseFour(a1.text, b1.text, c1.text, d1.text, a2.text, b2.text, c2.text, d2.text, a3.text, b3.text, c3.text, d3.text, a4.text, b4.text, c4.text, d4.text);
                                });
                              },
                              child: Text(
                                "INVERSE",
                                style: TextStyle(
                                  color: Colors.white,
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
