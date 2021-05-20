import 'package:dream_calc/calcs/trigCalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/services/formatNumber.dart';

import 'genScreen.dart';
class trigonometry extends StatefulWidget {
  const trigonometry({Key key}) : super(key: key);

  @override
  _trigonometryState createState() => _trigonometryState();
}


bool inFocusDegree = false;


class _trigonometryState extends State<trigonometry> {

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
      return answer.toStringAsFixedNoZero(precision);
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
  void initState() {
    super.initState();
    degree.addListener((){
      if(inFocusDegree){
        degree.text ==''? clear() : setAnswersDegree(double.parse(degree.text));
      }
    });

    radian.addListener((){
   if(!inFocusDegree){
     radian.text == ''? clear() : setAnswersRadian(double.parse(radian.text));
   }
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
          appBar: AppBar(
            backgroundColor: colors[colorTheme][9],
            title: Text(
              'TRIGONOMETRY',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: colors[colorTheme][1],
              ),
            ),
          ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          'degree : ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        onTap: (){
                          setState(() {
                            inFocusDegree = true;
                          });
                        },
                        // onChanged: (text){},
                        textAlign: TextAlign.end,
                        controller: degree,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      child: FittedBox(
                        child: Text(
                          'radian : ',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextField(
                        onTap: (){
                          setState(() {
                            inFocusDegree = false;
                          });
                        },
                        // onChanged: (text){},
                        textAlign: TextAlign.end,
                        controller: radian,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: FittedBox(
                        child: Text(
                          '   sin',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        textAlign: TextAlign.end,
                        controller: inFocusDegree? degree : radian,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FittedBox(
                        child: Text(
                          '=',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        textAlign: TextAlign.end,
                        controller: Sin,
                        onChanged: (text){
                         if(Sin.text != ''){
                           setState(() {
                             inFocusDegree = false;
                             radian.text = Asin(Sin.text).toStringAsFixedNoZero(precision);
                             setAnswersRadian(Asin(Sin.text));
                           });
                         }
                         else
                           clear();
                        },
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: FittedBox(
                        child: Text(
                          '   cos',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        textAlign: TextAlign.end,
                        controller: inFocusDegree? degree : radian,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FittedBox(
                        child: Text(
                          '=',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        textAlign: TextAlign.end,
                        controller: Cos,
                        onChanged: (text){
                          if(Cos.text != ''){
                            setState(() {
                              inFocusDegree = false;
                              radian.text = Acos(Cos.text).toStringAsFixedNoZero(precision);
                              setAnswersRadian(Acos(Cos.text));
                            });
                          }
                          else
                            clear();
                        },
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: FittedBox(
                        child: Text(
                          '   tan',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        textAlign: TextAlign.end,
                        controller: inFocusDegree? degree : radian,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FittedBox(
                        child: Text(
                          '=',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        textAlign: TextAlign.end,
                        controller: Tan,
                        onChanged: (text){
                          if(Tan.text != ""){
                            setState(() {
                              inFocusDegree = false;
                              radian.text = Atan(Tan.text).toStringAsFixedNoZero(precision);
                              setAnswersRadian(Atan(Tan.text));
                            });
                          }
                          else
                            clear();
                        },
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: FittedBox(
                        child: Text(
                          '   cot',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        textAlign: TextAlign.end,
                        controller: inFocusDegree? degree : radian,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FittedBox(
                        child: Text(
                          '=',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        textAlign: TextAlign.end,
                        controller: Cot,
                        onChanged: (text){
                          if(Cot.text != ""){
                            setState(() {
                              radian.text = Acot(Cot.text).toStringAsFixedNoZero(precision);
                              inFocusDegree = false;
                              setAnswersRadian(Acot(Cot.text));
                            });
                          }
                          else
                            clear();
                        },
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: FittedBox(
                        child: Text(
                          '   sec',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        textAlign: TextAlign.end,
                        controller: inFocusDegree? degree : radian,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FittedBox(
                        child: Text(
                          '=',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        textAlign: TextAlign.end,
                        controller: Sec,
                        onChanged: (text){
                          if(Sec.text!=""){
                            setState(() {
                              radian.text = Asec(Sec.text).toStringAsFixedNoZero(precision);
                              inFocusDegree = false;
                              setAnswersRadian(Asec(Sec.text));
                            });
                          }
                          else
                            clear();
                        },
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: FittedBox(
                        child: Text(
                          'cosec',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        textAlign: TextAlign.end,
                        controller: inFocusDegree? degree : radian,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: FittedBox(
                        child: Text(
                          '=',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: TextField(
                        textAlign: TextAlign.end,
                        controller: Cosec,
                        onChanged: (text){
                          if(Cosec.text != ""){
                            setState(() {
                              radian.text = Acosec(Cosec.text).toStringAsFixedNoZero(precision);;
                              inFocusDegree = false;
                              setAnswersRadian(Acosec(Cosec.text));
                            });
                          }
                          else
                            clear();
                        },
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        onSubmitted: (text){},
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.-]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelStyle: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.grey[300]),
                    minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
                  ),
                  onPressed: clear,
                  child: Text(
                    "Clear",
                    style: TextStyle(
                      color: Colors.black,
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
