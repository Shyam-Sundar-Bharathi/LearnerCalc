import 'package:catex/catex.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const pi = 3.1415926536;
const e = 2.7182818284;
const phi = 1.6180339887;
const r =  8.3144598000;
const roottwo = 1.4142135624;
const rootthree = 1.7320508076;
const rootfive = 2.2360679775;
const rootten = 3.1622776602;
const logtwo = 0.3010299957;
const logthree = 0.4771212547;
const logfive = 0.6989700043;
const loge = 0.434294481;
const lntwo = 0.6931471805;
const lnthree = 1.0986122886;
const lnfive = 1.6094379124;
const lnten = 2.3025850929;


//STYLING FOR EVERY IN-SCREEN BUTTON
ButtonStyle myButtonStyle = ButtonStyle(
  elevation: MaterialStateProperty.all(10),
  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
      )
  ),
  backgroundColor: MaterialStateProperty.resolveWith((states) => colors[colorTheme][9]),
  minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
);

//CLEAR ALL TEXT FIELDS ON SCREEN
Widget myClearButton(onPressed()){
  return ElevatedButton(
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(10),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          )
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.red),
      minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
    ),
    onPressed: onPressed,
    child: FittedBox(
      child: Text(
        "CLEAR ALL",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}

//STYLING FOR TEXT FIELDS
InputDecoration myInputDecoration({String labelText, Color color = Colors.white}){
  return InputDecoration(
    fillColor: color,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colors[colorTheme][9], width: 1.5),
      borderRadius: BorderRadius.circular(10.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: colors[colorTheme][9], width: 2.5),
      borderRadius: BorderRadius.circular(10.0),
    ),
    labelText: labelText,
    labelStyle: TextStyle(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.w500
    ),
  );
}

//APP BAR FOR EVERY SCREEN
Widget myAppBar(String heading, {contactUs = 0, Key key}){
  return AppBar(
    key: key,
    title: FittedBox(
      child: Text(
        heading,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
          color: contactUs == 1? Colors.white : colors[colorTheme][1],
        ),
      ),
    ),
    backgroundColor: contactUs == 1? Color(0xFF545a62) : colors[colorTheme][9],
  );
}

// DROP-DOWN BOX, DOESN'T APPLY TO SETTINGS DROP-DOWN.
Widget myDropDownBox(context,{Widget child}){
  return Container(
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      border: Border.all(),
      borderRadius:  BorderRadius.all(Radius.circular(10.0)),
      color: colors[colorTheme][1],
    ),
    child: Theme(
      data: Theme.of(context).copyWith(
        canvasColor: colors[colorTheme][1],
      ),
      child: child
    ),
  );
}

//FORMULA SCREENS - HEADING STYLE
Widget myFormulaHeading(String text, {int mainHeading = 0, int bigGap = 1}){
  return Column(
    children: [
      bigGap == 1? SizedBox(height: 40,) : SizedBox(height: 20,),
      FittedBox(
        child: Text(
          text,
          style: TextStyle(
              fontSize: mainHeading == 1 ? 30 : 20,
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      SizedBox(height: 15,)
    ],
  );
}

//FORMULA SCREENS - FORMULA STYLE
Widget myFormula(String text){
  return Column(
    children: [
      FittedBox(
        child: DefaultTextStyle(
          child: CaTeX(text),
          style: TextStyle(
              fontSize: 25,
              color: Colors.black
          ),
        ),
      ),
      SizedBox(height: 10,),
    ],
  );
}

Widget myResultCard({Widget child}){
  return Card(
    elevation: 5,
    color: Colors.white,
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 2),
      borderRadius: BorderRadius.circular(20),
    ),
    child: child,
  );
}

//FORMULA SCREENS - FORMULA TABLE
Widget myFormulaTableBlock(String formula, {int flex : 1}){
  return Expanded(
    flex: flex,
    child: Container(
      height: 80,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Center(
        child: FittedBox(
            child: DefaultTextStyle(
              child: CaTeX(formula),
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black
              ),
            )
        ),
      ),
    ),
  );
}

Widget myFormulaTableBlockNormalText(String formula, {int flex : 1}){
  return Expanded(
    flex: flex,
    child: Container(
      height: 80,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Center(
        child: FittedBox(
            child: DefaultTextStyle(
              child: Text(formula),
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black
              ),
            )
        ),
      ),
    ),
  );
}

//CONTACT US SCREEN - SETTINGS - LINKS TO SOCIALS
Widget myContactUsButton({String text, IconData icon, String launcher }){
  return ElevatedButton(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(child: Icon(icon)),
        SizedBox(width: 10,),
        FittedBox(child: Text(text)),
      ],
    ),
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(10),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          )
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) => Color(0xFF545a62) ),
      minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),

    ),
    onPressed: (){
      launch(launcher,
      forceWebView: false);
    },
  );
}

Widget myDisplayCard(String text, {double fontSize = 30}){
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 1.5),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: EdgeInsets.all(10),
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}

Widget myCatexDisplayCard(String text, {double fontSize = 20}){
  return Card(
    elevation: 2,
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 1.5),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Padding(
      padding: EdgeInsets.all(10),
      child: FittedBox(
        child: DefaultTextStyle(
          child: CaTeX(text),
          style: TextStyle(
            color: Colors.black,
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}