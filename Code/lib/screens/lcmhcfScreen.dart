import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/calcs/lcmhcfCalc.dart';
import 'package:dream_calc/screens/menu.dart';

class lcmhcfCalc extends StatefulWidget {
  @override
  _lcmhcfCalcState createState() => _lcmhcfCalcState();
}

class _lcmhcfCalcState extends State<lcmhcfCalc> {


  Widget mylcmhcfButton(String ch, String res, String text){
    return Expanded(
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            choice = ch;
            result = res;
          });
        },
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
          title: FittedBox(
            child: Text(
              "NUMBER THEORY",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                color: colors[colorTheme][1],
              ),
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
                  keyboardType: TextInputType.text,
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
                    mylcmhcfButton("LCM", lcm(userInput.text), "LCM"),
                    SizedBox(width: 20),
                    mylcmhcfButton("HCF", hcf(userInput.text), "HCF"),
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
                   mylcmhcfButton(" ", factors(userInputf.text), "FACTORS"),
                   SizedBox(width: 20),
                   mylcmhcfButton(" ", primeFactors(userInputf.text), "   PRIME\nFACTORS"),
                   SizedBox(width: 20),
                   mylcmhcfButton(" ", isPrime(userInputf.text), "IS PRIME ?"),
                 ],
               ),
                SizedBox(height: 40),
                result == " " ? Container() :
                Container(
                  width: MediaQuery.of(context).size.width - 30,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: FittedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          result == "CHECK INPUT" ? result :
                          choice == " " ? result :
                          "$choice = $result",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
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
