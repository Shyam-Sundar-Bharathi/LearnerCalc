import 'package:dream_calc/calcs/matrixFourCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/screens/menu.dart';

class matrixFour extends StatefulWidget {
  const matrixFour({Key key}) : super(key: key);

  @override
  _matrixFourState createState() => _matrixFourState();
}

class _matrixFourState extends State<matrixFour> {

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
                              textAlign: TextAlign.end,
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
                              textAlign: TextAlign.end,
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
                              textAlign: TextAlign.end,
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
                              textAlign: TextAlign.end,
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
                              textAlign: TextAlign.end,
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
                              textAlign: TextAlign.end,
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
                              textAlign: TextAlign.end,
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
                              textAlign: TextAlign.end,
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
                              textAlign: TextAlign.end,
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
                              textAlign: TextAlign.end,
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
                              textAlign: TextAlign.end,
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
                              textAlign: TextAlign.end,
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
                              textAlign: TextAlign.end,
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
                              textAlign: TextAlign.end,
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
                              textAlign: TextAlign.end,
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
                              textAlign: TextAlign.end,
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
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                                minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                              ),
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                setState(() {
                                  result = transposeFour(a1.text, b1.text, c1.text, d1.text, a2.text, b2.text, c2.text, d2.text, a3.text, b3.text, c3.text, d3.text, a4.text, b4.text, c4.text, d4.text);
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
                                  result = detFour(a1.text, b1.text, c1.text, d1.text, a2.text, b2.text, c2.text, d2.text, a3.text, b3.text, c3.text, d3.text, a4.text, b4.text, c4.text, d4.text);
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
                                  result = traceFour(a1.text, b1.text, c1.text, d1.text, a2.text, b2.text, c2.text, d2.text, a3.text, b3.text, c3.text, d3.text, a4.text, b4.text, c4.text, d4.text);
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
                                  result = inverseFour(a1.text, b1.text, c1.text, d1.text, a2.text, b2.text, c2.text, d2.text, a3.text, b3.text, c3.text, d3.text, a4.text, b4.text, c4.text, d4.text);
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
                      Center(child: result)
                    ]
                ),
              ),
            )
        ));
  }
}
