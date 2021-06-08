import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

const eulaURL = "https://shyam-sundar-bharathi.github.io/LearnerCalc/";
String dropDownColor = colorTheme;
int sliderValue =  precision;
int messageValue = 0;
List<String> colorsAvailable = ['GRAYSCALE','BLUE','GREEN','PINK','ORANGE', 'PURPLE','RED'];
Map alertMessage = {
  0 : " ",
  1 : " Don't ask us if you lose marks though 😐 ",
  2 : " Good enough ",
  3 : " Good enough ",
  4 : " Alright. Precise results on the way ",
  5 : " Alright. Precise results on the way ",
  6 : " Alright. Precise results on the way. ",
  7 : " Woah. So you're a scientist ",
  8 : " Woah. So you're a scientist ",
  9 : " Mr. Perfectionist ",
  10 : " Mr. Perfectionist ",
};

class _settingsState extends State<settings> {

  void initState(){
    messageValue = 0;
  }
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
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        Slider(
                          value: sliderValue.toDouble(),
                          onChanged: (double newValue){
                            setState(() {
                              sliderValue = newValue.round();
                              messageValue = sliderValue;
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
                          alertMessage[messageValue],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5,),
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Color Theme",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            fontWeight: FontWeight.w500
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
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context, {
                        'precision': sliderValue,
                        'colorTheme' : dropDownColor,
                      }
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("APPLY"),
                    ),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(20),
                    shape: MaterialStateProperty.all<StadiumBorder>(StadiumBorder()),
                    backgroundColor: MaterialStateProperty.resolveWith((states) => colors[colorTheme][9]),
                    minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
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
                        Navigator.pushNamed(context, '/contactUs');
                      },
                      icon: Icon(
                        Icons.contact_support_outlined,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Contact Us",
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
                  elevation: 20,
                  color: Colors.grey[200],
                  child: Container(
                    width: MediaQuery. of(context). size. width - 30,
                    padding: EdgeInsets.all(15),
                    child: TextButton.icon(
                      onPressed: (){
                        Navigator.pushNamed(context, '/didYouKnow');
                      },
                      icon: Icon(
                        Icons.info_outline,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Did you know ?",
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
                  elevation: 20,
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
                        label: Text(
                          "License Agreement",
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
                SizedBox(height: 30,),
                Column(
                  children: [
                    Text(
                        "LearnerCalc",
                      style: TextStyle(
                        color: Colors.grey[700]
                      ),
                    ),
                    SizedBox(height: 2,),
                    FittedBox(
                        child: Text(
                            "The Learner's Daily - June 2021 - Version 1.0.0+1",
                          style: TextStyle(
                              color: Colors.grey[700]
                          ),
                        )
                    ),
                    SizedBox(height: 5,),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
