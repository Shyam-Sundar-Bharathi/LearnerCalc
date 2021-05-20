import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/calcs/lcmhcfCalc.dart';
import 'package:dream_calc/screens/genScreen.dart';

class lcmhcfCalc extends StatefulWidget {
  @override
  _lcmhcfCalcState createState() => _lcmhcfCalcState();
}

class _lcmhcfCalcState extends State<lcmhcfCalc> {

  var choice = " ";
  var result = " ";
  TextEditingController userInput = new TextEditingController();
  TextEditingController userInputpf = new TextEditingController();

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
                  controller: userInputpf,
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
                   ElevatedButton(
                     style: ButtonStyle(
                       backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                       minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                     ),
                     onPressed: () {
                       FocusScope.of(context).requestFocus(FocusNode());
                       setState(() {
                         choice = "PRIME FACTORS";
                         result = primeFactors(userInputpf.text);
                       });
                     },
                     child: Text(
                       "PRIME FACTORS",
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
                         choice = " ";
                         result = isPrime(userInputpf.text);
                       });
                     },
                     child: Text(
                       "IS PRIME ?",
                       style: TextStyle(
                         color: Colors.black,
                       ),
                     ),
                   ),
                 ],
               ),
                SizedBox(height: 40),
                Text(
                  "$choice",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                    border: Border.all(),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
