import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

String dropDownColor = colorTheme;
int sliderValue =  precision;
String alertMessage = "";
class _settingsState extends State<settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[colorTheme][2],
      appBar: AppBar(
        title: Text(
            "SETTINGS",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: colors[colorTheme][1],
            ),
        ),
        backgroundColor: colors[colorTheme][9],
      ),
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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        sliderValue.toString() + alertMessage,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Higher precision means more numbers after the decimal point and greater accuracy of the answer",
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
                        items: <String>['GRAYSCALE','BLUE','GREEN','PINK','YELLOW', 'PURPLE','RED'].map<DropdownMenuItem<String>>((String value) {
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
                    child: ElevatedButton.icon(
                      icon: Icon(
                          Icons.info_outline,
                        color: Colors.black,
                      ),
                      label: Text(
                          "ABOUT",
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
                  child: ElevatedButton.icon(
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
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colors[colorTheme][8],
        shape: RoundedRectangleBorder(),
        child: Text("APPLY"),
        onPressed: (){
            Navigator.pop(context, {
              'precision': sliderValue,
              'colorTheme' : dropDownColor,
            }
            );
        },
      ),
    );
  }
}
