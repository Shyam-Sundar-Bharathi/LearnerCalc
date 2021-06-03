import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

const eulaURL = "https://shyam-sundar-bharathi.github.io/LearnerCalc/";
String dropDownColor = colorTheme;
int sliderValue =  precision;
String alertMessage = "";
List<String> colorsAvailable = ['GRAYSCALE','BLUE','GREEN','PINK','YELLOW', 'PURPLE','RED'];

class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        setState(() {
          dropDownColor = colorTheme;
          sliderValue = precision;
        });
        Navigator.pop(context);
        return;
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("SETTINGS"),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15),
            child: Column(
              children: [
                Card(
                  elevation: 40,
                  color: Colors.grey[200],
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FittedBox(
                          child: Text(
                            "Set precision for decimal values",
                            style: TextStyle(
                              fontSize: 25.0,
                            ),
                          ),
                        ),
                        Slider(
                          value: sliderValue.toDouble(),
                          onChanged: (double newValue){
                            setState(() {
                              sliderValue = newValue.round();
                              if (sliderValue <= 2){
                                alertMessage = " (Not recommended)";
                              }
                              else if(sliderValue >= 9){
                                alertMessage = " (Oh! You're a scientist.)";
                              }
                              else if(sliderValue >=6)
                                alertMessage = " (Precise results on the way!)";
                              else{
                                alertMessage = " (Good enough)";
                              }
                            });
                          },
                          min: 1.0,
                          max: 10.0,
                          divisions: 10,
                          label: "Precision",
                          activeColor: colors[colorTheme][9],
                          inactiveColor: colors[colorTheme][7],
                        ),
                        Text(
                          sliderValue.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          alertMessage,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Higher precision means more numbers after the decimal point and greater accuracy of the answer."
                              "However, Learner automatically adjusts precision, if necessary, to avoid a zero answer.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        )
                      ],
                    ),
                  )
                ),
                SizedBox(height: 20,),
                Card(
                  elevation: 40,
                  color: Colors.grey[200],
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Color Theme",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        DropdownButton<String>(
                          isExpanded: true,
                          value: dropDownColor,
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 72,
                          elevation: 16,
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 20,
                          ),
                          underline: Container(
                            height: 2,
                          ),
                          onChanged: (String newColor) {
                            setState(() {
                              dropDownColor = newColor;
                            });
                          },
                          items: colorsAvailable.map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                  value,
                                style: TextStyle(
                                  color: colors[colorTheme][9]
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  )
                ),
                SizedBox(height: 20,),
                Card(
                  elevation: 40,
                  color: Colors.grey[200],
                  child: Container(
                    width: MediaQuery. of(context). size. width - 30,
                    padding: EdgeInsets.all(15),
                    child: TextButton.icon(
                      onPressed: (){
                        Navigator.pushNamed(context, '/contactUs');
                      },
                      icon: Icon(
                        Icons.contact_support_outlined,
                        color: Colors.black,
                      ),
                      label: Text(
                        "CONTACT US",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Card(
                  elevation: 40,
                  color: Colors.grey[200],
                  child: Container(
                    width: MediaQuery. of(context). size. width - 30,
                    padding: EdgeInsets.all(15),
                      child: TextButton.icon(
                        onPressed: (){
                          launch(eulaURL,
                              forceWebView: false);
                        },
                        icon: Icon(
                            Icons.policy_outlined,
                          color: Colors.black,
                        ),
                        label: Expanded(
                          child: Text(
                            "LICENSE AGREEMENT\nVersion 1.0.0+1",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black
                            ),
                          ),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
                        ),
                      ),
                  ),
                ),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ),
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton.extended(
            backgroundColor: colors[colorTheme][9],
            shape: StadiumBorder(),
            label : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("APPLY"),
            ),
            onPressed: (){
                Navigator.pop(context, {
                  'precision': sliderValue,
                  'colorTheme' : dropDownColor,
                }
                );
            },
          ),
        ),
      ),
    );
  }
}
