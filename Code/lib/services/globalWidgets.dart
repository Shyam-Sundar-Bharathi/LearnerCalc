import 'package:catex/catex.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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


//STYLING FOR TEXT FIELDS
InputDecoration myInputDecoration({String labelText}){
  return InputDecoration(
    fillColor: Colors.white,
    filled: true,
    border:OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black, width: 2.0),
      borderRadius: BorderRadius.circular(10),
    ),
    labelText: labelText,
    labelStyle: TextStyle(
      fontSize: 20.0,
    ),
  );
}

//APP BAR FOR EVERY SCREEN
Widget myAppBar(String heading, {contactUs = 0}){
  return AppBar(
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

//IN-SCREEN RESULT CONTAINERS DECORATION
BoxDecoration myResultContainerDecoration = BoxDecoration(
  border: Border.all(),
  color: Colors.white,
  borderRadius: BorderRadius.all(Radius.circular(10)),
);

//FORMULA SCREENS - FORMULA TABLE
Widget myFormulaTableBlock(String formula){
  return Expanded(
    child: Container(
      height: 80,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Center(
        child: FittedBox(
            child: DefaultTextStyle(
              child: CaTeX(formula),
              style: TextStyle(
                  fontSize: 30,
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
        Icon(icon),
        SizedBox(width: 10,),
        Text(text),
      ],
    ),
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(10),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          )
      ),
      backgroundColor: MaterialStateProperty.resolveWith((states) => Color(0xFF545a62)),
      minimumSize: MaterialStateProperty.resolveWith((states) => Size(70, 50)),
    ),
    onPressed: (){
      launch(launcher,
      forceWebView: false);
    },
  );
}