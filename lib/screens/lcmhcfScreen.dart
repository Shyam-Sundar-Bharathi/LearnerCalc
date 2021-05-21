import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/calcs/lcmhcfCalc.dart';
import 'package:dream_calc/screens/menu.dart';

class lcmhcfCalc extends StatefulWidget {
  @override
  _lcmhcfCalcState createState() => _lcmhcfCalcState();
}

class _lcmhcfCalcState extends State<lcmhcfCalc> {

  var choice = " ";
  var result = " ";
  TextEditingController userInput = new TextEditingController();
  TextEditingController userInputf = new TextEditingController();

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
            "LCM HCF",
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w900,
              color: colors[colorTheme][1],
            ),
          ),
          backgroundColor: colors[colorTheme][9],
        ),
        //drawer: myDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextField(
                  controller: userInput,
                  keyboardType: TextInputType.number,
                  enableInteractiveSelection: true,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp('[0-9,]'), allow: true),
                  ],
                  decoration: InputDecoration(
                    labelText: "Enter comma separated numbers",
                    labelStyle: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                        minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          choice = "LCM";
                          result = lcm(userInput.text);
                        });
                      },
                      child: Text(
                        "LCM",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                        minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                      ),
                      onPressed: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          choice = "HCF";
                          result = hcf(userInput.text);
                        });
                      },
                      child: Text(
                          "HCF",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                TextField(
                  controller: userInputf,
                  keyboardType: TextInputType.number,
                  enableInteractiveSelection: true,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp('[0-9]'), allow: true),
                  ],
                  decoration: InputDecoration(
                    labelText: "Enter number",
                    labelStyle: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
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
                           choice = "FACTORS";
                           result = factors(userInputf.text);
                         });
                       },
                       child: FittedBox(
                         child: Text(
                           "FACTORS",
                           style: TextStyle(
                             color: Colors.black,
                           ),
                         ),
                       )
                     ),
                   ),
                   SizedBox(width: 20),
                   Expanded(
                     child: ElevatedButton(
                       style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                         minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                       ),
                       onPressed: () {
                         FocusScope.of(context).requestFocus(FocusNode());
                         setState(() {
                           choice = "PRIME FACTORS";
                           result = primeFactors(userInputf.text);
                         });
                       },
                       child: FittedBox(
                         child: Text(
                           "PRIME FACTORS",
                           style: TextStyle(
                             color: Colors.black,
                           ),
                         ),
                       ),
                     ),
                   ),
                   SizedBox(width: 20),
                   Expanded(
                     child: ElevatedButton(
                       style: ButtonStyle(
                         backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                         minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                       ),
                       onPressed: () {
                         FocusScope.of(context).requestFocus(FocusNode());
                         setState(() {
                           choice = " ";
                           result = isPrime(userInputf.text);
                         });
                       },
                       child: FittedBox(
                         child: Text(
                           "IS PRIME ?",
                           style: TextStyle(
                             color: Colors.black,
                           ),
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
                SizedBox(height: 40),
                Container(
                  width: 300,
                  height: 150,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          choice,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      FittedBox(
                        child: Text(
                          result,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
