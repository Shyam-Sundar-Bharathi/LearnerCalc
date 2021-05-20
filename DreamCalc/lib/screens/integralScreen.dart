import 'package:flutter/material.dart';
import 'package:dream_calc/screens/genScreen.dart';
import 'package:catex/catex.dart';

class integral extends StatefulWidget {
  const integral({Key key}) : super(key: key);

  @override
  _integralState createState() => _integralState();
}

class _integralState extends State<integral> {

  Map ints = {
    0 : ["f '(x)", "f(x)"],
    1 : ['cos x', 'sin x']
  };

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: AppBar(
          title: Text(
            "INTEGRAL FORMULAE",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              color: colors[colorTheme][1],
            ),
          ),
          backgroundColor: colors[colorTheme][9],
        ),
        body: Container(
          padding: EdgeInsets.all(5),
          child: ListView.builder(
            itemCount: ints.length,
            itemBuilder: (context, index) {
              if(index == 0){
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              ints[index][0],
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              ints[index][1],
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              else
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              ints[index][0],
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Text(
                              ints[index][1],
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
            },
          ),
        ),
      ),
    );
  }
}

