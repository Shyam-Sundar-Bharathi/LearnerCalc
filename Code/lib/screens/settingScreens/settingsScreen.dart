import 'dart:async';
import 'dart:math';

import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';

class settings extends StatefulWidget {
  @override
  _settingsState createState() => _settingsState();
}

const eulaURL = "https://shyam-sundar-bharathi.github.io/LearnerCalc/";
const playStoreURL = "https://play.google.com/store/apps/details?id=thelearnersdaily.wordpress.dream_calc";
String dropDownColor = colorTheme;
int sliderValue =  precision;
int messageValue = 0;
bool hiddenFeatureActivated = false;

List<String> colorsAvailable = ['GRAYSCALE', 'CHOCOLATE', 'ROSE', 'SKY BLUE', 'LAVENDER', 'TURQUOISE', 'EMERALD', 'SAFFRON', 'CHERRY','BLUEGRAY'];

Map alertMessage = {
  0 : " ",
  1 : " You like to take risks. ",
  2 : " Good enough. ",
  3 : " Yes. This is ideal. ",
  4 : " Alright. Precise results on the way. ",
  5 : " Alright. Precise results on the way. ",
  6 : " Alright. Precise results on the way. ",
  7 : " Woah. So you're a scientist. ",
  8 : " Woah. So you're a scientist. ",
  9 : " NASA wants to know your location. ",
  10 : " NASA wants to know your location. ",
};

//Developer touch, for fun. On long pressing the "did you know"
//button, the card colours change to red and the button reads
//"how did you know ?"

String myDidYouKnowText = "Did you know ?";
Color mySettingsCardColor = Colors.grey[200];
Timer timer;

Widget mySettingsCard({Widget child}){
  return Card(
    elevation: 10,
    color: mySettingsCardColor,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
    ),
    child: child,
  );
}

class _settingsState extends State<settings> {

  void initState(){
    messageValue = 0;
    myDidYouKnowText = "Did you know ?";
    mySettingsCardColor = Colors.grey[200];
    hiddenFeatureActivated = false;
    userNameController.text = userName;
  }

  //Did you know long press, changes the colors of cards. Just for fun.
  void changeCardColor(){
    hiddenFeatureActivated = true;
    timer = Timer.periodic(Duration(milliseconds: 500), (Timer t){
      setState(() {
        mySettingsCardColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      });
    });
  }

  void stopChangeCardColor(){
    timer.cancel();
    setState(() {
      mySettingsCardColor = Colors.grey[200];
      hiddenFeatureActivated = false;
    });
  }

  TextEditingController userNameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return WillPopScope(
      onWillPop: (){
        setState(() {
          dropDownColor = colorTheme;
          sliderValue = precision;
        });

        if(hiddenFeatureActivated){
          setState(() {
            hiddenFeatureActivated = false;
          });
          timer.cancel();
        }

        Navigator.pop(context);
        return;
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("SETTINGS"),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                mySettingsCard(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        FittedBox(
                          child: Text(
                            "Give LearnerCalc your good name",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          textAlign: TextAlign.center,
                          autocorrect: false,
                          controller: userNameController,
                          cursorColor: colors[colorTheme][11],
                          onSubmitted: (text){
                            setState(() {
                              userNameController.text = userNameController.text.toUpperCase();
                            });
                          },
                          keyboardType: TextInputType.visiblePassword,
                          maxLength: 10,
                          enableInteractiveSelection: true,
                          inputFormatters: [
                            FilteringTextInputFormatter(RegExp('[a-zA-Z]'), allow: true),
                          ],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colors[colorTheme][9],
                            decoration: TextDecoration.none
                          ),

                          decoration: InputDecoration(
                            counterText: "",
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2.0, color: colors[colorTheme][5]),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 3.0, color: colors[colorTheme][5]),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ),
                SizedBox(height: 20,),
                mySettingsCard(
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
                      SizedBox(height: 20,),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackShape: RoundedRectSliderTrackShape(),
                          trackHeight: 20.0,
                          activeTrackColor: colors[colorTheme][9],
                          inactiveTrackColor: colors[colorTheme][3],
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14.0, disabledThumbRadius: 0.0, elevation: 0),
                          thumbColor: colors[colorTheme][11],
                          overlayColor: colors[colorTheme][1],
                          valueIndicatorColor: colors[colorTheme][11],
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 10.0),
                          tickMarkShape: RoundSliderTickMarkShape(),
                          activeTickMarkColor: colors[colorTheme][9],
                          inactiveTickMarkColor: colors[colorTheme][3],
                          valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                          valueIndicatorTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        child: Slider(
                          value: sliderValue.toDouble(),
                          onChanged: (double newValue){
                            setState(() {
                              sliderValue = newValue.round();
                              messageValue = sliderValue;
                            });
                          },
                          min: 1.0,
                          max: 10.0,
                          divisions: 9,
                          label: sliderValue.toString(),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Text(
                        sliderValue.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: colors[colorTheme][9]
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
                    ],
                  ),
                    ),
                ),
                SizedBox(height: 20,),
                mySettingsCard(
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
                    ),
                ),
                SizedBox(height: 20,),
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context, {
                        'precision': sliderValue,
                        'colorTheme' : dropDownColor,
                        'userName' : userNameController.text.toUpperCase()
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
                mySettingsCard(
                  child: Container(
                    width: MediaQuery. of(context). size. width - 30,
                    padding: EdgeInsets.all(15),
                    child: TextButton.icon(
                      onPressed: (){
                        Navigator.pushNamed(context, '/contactUs');
                      },
                      icon: Icon(
                        Icons.phone,
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
                mySettingsCard(
                  child: Container(
                    width: MediaQuery. of(context). size. width - 30,
                    padding: EdgeInsets.all(15),
                    child: TextButton.icon(
                      onPressed: (){
                        Share.share('Check out LearnerCalc - The ultimate and the only mathematics app you need: https://play.google.com/store/apps/details?id=thelearnersdaily.wordpress.dream_calc', subject: 'Share LearnerCalc on Google Play');
                      },
                      icon: Icon(
                        Icons.share,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Share LearnerCalc with friends",
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
                mySettingsCard(
                  child: Container(
                    width: MediaQuery. of(context). size. width - 30,
                    padding: EdgeInsets.all(15),
                    child: TextButton.icon(
                      onPressed: (){
                          launch(playStoreURL,
                              forceWebView: false);
                          },
                      icon: Icon(
                        Icons.star_half,
                        color: Colors.black,
                      ),
                      label: Text(
                        "Give us 5-stars on the Play Store",
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
                mySettingsCard(
                  child: Container(
                      width: MediaQuery. of(context). size. width - 30,
                      padding: EdgeInsets.all(15),
                      child: TextButton.icon(
                        onLongPress: (){
                          hiddenFeatureActivated ? stopChangeCardColor() : changeCardColor();
                          setState(() {
                            myDidYouKnowText = hiddenFeatureActivated? "How did you know ?" : "Did you know ?";
                            // hiddenFeatureActivated = true;
                          });
                        },
                        onPressed: (){
                          Navigator.pushNamed(context, '/didYouKnow');
                        },
                        icon: Icon(
                          Icons.info_rounded,
                          color: Colors.black,
                        ),
                        label: Text(
                          myDidYouKnowText,
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
                mySettingsCard(
                  child: Container(
                      width: MediaQuery. of(context). size. width - 30,
                      padding: EdgeInsets.all(15),
                        child: TextButton.icon(
                          onPressed: (){
                            launch(eulaURL,
                                forceWebView: false);
                          },
                          icon: Icon(
                              Icons.policy_sharp,
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
                SizedBox(height: 50,),
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
                            "The Learner's Daily - June 2021 - Version 1.3.0",
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
