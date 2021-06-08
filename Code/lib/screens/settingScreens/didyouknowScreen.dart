import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/screens/settingScreens/contactUsScreen.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class didYouKnow extends StatefulWidget {
  const didYouKnow({Key key}) : super(key: key);

  @override
  _didYouKnowState createState() => _didYouKnowState();
}


class _didYouKnowState extends State<didYouKnow> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("DID YOU KNOW ?"),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Card(
                  elevation: 20,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                        "The number pad in the General Calculator is scrollable. Scroll up on the pad to reveal more functions such as square root, logarithm and various constants.",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Card(
                  elevation: 20,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      "All the white boxes in the Trigonometry screen support input, therefore finding both ratios and their inverses. Enter a value into any of the eight boxes to get relevant output.",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Card(
                  elevation: 20,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "I also answer to all student-related queries, specially on mathematics, examinations and high-school. Visit our Quora by ",
                            style: TextStyle(
                              color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          TextSpan(
                            text: "clicking here.",
                          recognizer: new TapGestureRecognizer()
                          ..onTap = () { launch(quoraURL);},
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                        ]
                      ),
                    )
                  ),
                ),
                SizedBox(height: 20,),
                Card(
                  elevation: 20,
                  child: Container(
                      padding: EdgeInsets.all(10),
                      child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                text: "There's also a high-school blog by the name of The Learner's Daily where I write about everything high-school. I mean, everything. Visit our blog by ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                              TextSpan(
                                text: "clicking here.",
                                recognizer: new TapGestureRecognizer()
                                  ..onTap = () { launch(blogURL);},
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ]
                        ),
                      )
                  ),
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
