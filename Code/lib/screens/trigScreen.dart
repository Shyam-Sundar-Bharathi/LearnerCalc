import 'package:dream_calc/calcs/trigCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'menu.dart';
class trigonometry extends StatefulWidget {
  const trigonometry({Key key}) : super(key: key);

  @override
  _trigonometryState createState() => _trigonometryState();
}


bool inFocusDegree = true;
int trigPrecision = 4;


class _trigonometryState extends State<trigonometry> {

  Widget myTrigText(String text, {flex = 4}){
    return Expanded(
      flex: flex,
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }

  Widget myEqualTo(){
    return Expanded(
      flex: 2,
      child: FittedBox(
        child: Text(
          '=',
          style: TextStyle(
            fontSize: 10,
          ),
        ),
      ),
    );
  }

  Widget myTextField(TextEditingController cont,{onTap(), onChanged(String text), flex = 9, readOnly = false, input = 0}){
    return Expanded(
      flex: flex,
      child: TextField(
        onTap: onTap,
        onChanged: onChanged,
        readOnly: readOnly,
        textAlign: TextAlign.center,
        controller: cont,
        keyboardType: TextInputType.number,
        enableInteractiveSelection: true,
        onSubmitted: (text){},
        inputFormatters: [
          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
        ],
        decoration: myInputDecoration(color: input == 1? Colors.white : Colors.grey[100]),
      ),
    );
  }

  TextEditingController degree = new TextEditingController();
  TextEditingController radian = new TextEditingController();
  TextEditingController Sin = new TextEditingController();
  TextEditingController Cos = new TextEditingController();
  TextEditingController Tan = new TextEditingController();
  TextEditingController Sec = new TextEditingController();
  TextEditingController Cosec = new TextEditingController();
  TextEditingController Cot = new TextEditingController();

  List<double> answers;

  void clear(){
    setState(() {
      degree.text = ' ';
      radian.text = ' ';
      Sin.text = ' ';
      Cos.text = ' ';
      Tan.text = ' ';
      Cot.text = ' ';
      Sec.text = ' ';
      Cosec.text = ' ';
    });
  }

  String checkAnswer(double answer){
    if(answer == 1248){
      return "Infinity";
    }
    else if(answer == -1248){
      return "- Infinity";
    }
    else
      return answer.toStringAsFixedNoZero(trigPrecision);
  }

  void setAnswersDegree(double degrees){
    setState(() {
      answers = trigoCalc(degrees);
      radian.text = checkAnswer(answers[0]);
      Sin.text = checkAnswer(answers[1]);
      Cos.text = checkAnswer(answers[2]);
      Tan.text = checkAnswer(answers[3]);
      Cot.text = checkAnswer(answers[4]);
      Sec.text = checkAnswer(answers[5]);
      Cosec.text = checkAnswer(answers[6]);
    });
  }

  void setAnswersRadian(double radians){
    setState(() {
      answers = trigoCalc(radians);
      degree.text = checkAnswer(answers[0]);
      Sin.text = checkAnswer(answers[1]);
      Cos.text = checkAnswer(answers[2]);
      Tan.text = checkAnswer(answers[3]);
      Cot.text = checkAnswer(answers[4]);
      Sec.text = checkAnswer(answers[5]);
      Cosec.text = checkAnswer(answers[6]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("TRIGONOMETRY"),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 50,),
                    myTrigText("DEGREE : ",flex: 1),
                    myTextField(degree,flex: 1, input: 1, onTap: (){
                      setState(() {
                        inFocusDegree = true;
                      });
                    },
                        onChanged: (text){
                          degree.text == '' ? clear() : setAnswersDegree(double.parse(degree.text));
                        }
                    ),
                    SizedBox(width: 50,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 50,),
                    myTrigText("RADIAN : ",flex: 1),
                    myTextField(radian,flex: 1, input: 1, onTap: (){
                      setState(() {
                        inFocusDegree = false;
                      });
                    },
                        onChanged: (text){
                          radian.text == ''? clear() : setAnswersRadian(double.parse(radian.text));
                        }
                    ),
                    SizedBox(width: 50,),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: 50,),
                    myTrigText("sin"),
                    myTextField(degree ,readOnly: true),
                    myEqualTo(),
                    myTextField(Sin,
                        input: 1,
                        onTap: clear,
                        onChanged: (text) {
                          if(Sin.text != ''){
                            setState(() {
                              inFocusDegree = false;
                              radian.text = Asin(Sin.text).toStringAsFixedNoZero(trigPrecision);
                              degree.text = toDegree(checkRadian(double.parse(radian.text))).toStringAsFixedNoZero(trigPrecision);
                            });
                          }
                          else
                            clear();
                        }),
                    SizedBox(width: 50,)
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 50,),
                    myTrigText("cos"),
                    myTextField(degree, readOnly: true),
                    myEqualTo(),
                    myTextField(Cos,
                      input: 1,
                      onTap: clear,
                      onChanged: (text) {
                        if(Cos.text != ''){
                          setState(() {
                            inFocusDegree = false;
                            radian.text = Acos(Cos.text).toStringAsFixedNoZero(trigPrecision);
                            degree.text = toDegree(checkRadian(double.parse(radian.text))).toStringAsFixedNoZero(trigPrecision);
                          });
                        }
                        else
                          clear();
                      },

                    ),
                    SizedBox(width: 50,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 50,),
                    myTrigText("tan"),
                    myTextField(degree ,readOnly: true),
                    myEqualTo(),
                    myTextField(Tan,
                        input: 1,
                        onTap: clear,
                        onChanged: (text) {
                          if(Tan.text != ""){
                            setState(() {
                              inFocusDegree = false;
                              radian.text = Atan(Tan.text).toStringAsFixedNoZero(trigPrecision);
                              degree.text = toDegree(checkRadian(double.parse(radian.text))).toStringAsFixedNoZero(trigPrecision);
                            });
                          }
                          else
                            clear();
                        }),
                    SizedBox(width: 50,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 50,),
                    myTrigText("cot"),
                    myTextField(degree ,readOnly: true),
                    myEqualTo(),
                    myTextField(Cot,
                        input: 1,
                        onTap: clear,
                        onChanged: (text) {
                          if(Cot.text != ""){
                            setState(() {
                              inFocusDegree = false;
                              radian.text = Acot(Cot.text).toStringAsFixedNoZero(trigPrecision);
                              degree.text = toDegree(checkRadian(double.parse(radian.text))).toStringAsFixedNoZero(trigPrecision);
                            });
                          }
                          else
                            clear();
                        }),
                    SizedBox(width: 50,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 50,),
                    myTrigText("sec"),
                    myTextField(degree ,readOnly: true),
                    myEqualTo(),
                    myTextField(Sec,
                        input: 1,
                        onTap: clear,
                        onChanged: (text) {
                          if(Sec.text!=""){
                            setState(() {
                              inFocusDegree = false;
                              radian.text = Asec(Sec.text).toStringAsFixedNoZero(trigPrecision);
                              degree.text = toDegree(checkRadian(double.parse(radian.text))).toStringAsFixedNoZero(trigPrecision);
                            });
                          }
                          else
                            clear();
                        }),
                    SizedBox(width: 50,),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 50,),
                    myTrigText("csc"),
                    myTextField(degree ,readOnly: true),
                    myEqualTo(),
                    myTextField(Cosec,
                        input: 1,
                        onTap: clear,
                        onChanged: (text) {
                          if(Cosec.text != ""){
                            setState(() {
                              inFocusDegree = false;
                              radian.text = Acosec(Cosec.text).toStringAsFixedNoZero(trigPrecision);
                              degree.text = toDegree(checkRadian(double.parse(radian.text))).toStringAsFixedNoZero(trigPrecision);
                            });
                          }
                          else
                            clear();
                        }),
                    SizedBox(width: 50,),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 20,),
                    ElevatedButton(
                      style: myButtonStyle,
                      onPressed: clear,
                      child: Text(
                        "Clear",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
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