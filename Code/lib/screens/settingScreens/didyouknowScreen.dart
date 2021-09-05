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

  Widget myDidYouKnowCard({Widget child}){
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
        color: colors[colorTheme][8],
        elevation: 20,
        child: Container(
        padding: EdgeInsets.all(15),
          child: child,
      )
    );
  }
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
                myDidYouKnowCard(
                  child: Text(
                      "The number pad in the General Calculator is scrollable. Scroll up on the pad to reveal more functions such as square root, logarithm and various constants.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                myDidYouKnowCard(
                  child: Text(
                    "All the white boxes in the Trigonometry screen support input, therefore enabling you to find both ratios and their inverses. Enter a value into any of the eight boxes to get relevant output.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                myDidYouKnowCard(
                  child: Text(
                    "In Linear Equations, Quadratic Equations, Cubic Equations, Vectors, and Complex Numbers, you can leave the input boxes empty if the input is zero. LearnerCalc will assume empty inputs as zeroes and do the math for you.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                myDidYouKnowCard(
                  child: Text(
                    "Higher precision means more numbers after the decimal point and hence greater accuracy of the answer. However, LearnerCalc supersedes your setting and automatically adjusts precision when necessary to avoid null answers.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                myDidYouKnowCard(
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "I answer to all student-related queries, specially on mathematics, examinations, high-school and universities. Visit my Quora by  ",
                          style: TextStyle(
                              color: Colors.white,
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
