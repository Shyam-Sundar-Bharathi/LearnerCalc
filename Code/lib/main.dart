import 'package:dream_calc/screens/complexScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/differentialScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/formulaeChoiceScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/quadraticFormulaeScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/trigFormulaeScreen.dart';
import 'package:dream_calc/screens/genCalcScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/integralScreen.dart';
import 'package:dream_calc/screens/linearScreens/linearChoiceScreen.dart';
import 'package:dream_calc/screens/linearScreens/linearThreeScreen.dart';
import 'package:dream_calc/screens/linearScreens/linearTwoScreen.dart';
import 'package:dream_calc/screens/loadingScreen.dart';
import 'package:dream_calc/screens/matrixScreens/matrixChoiceScreen.dart';
import 'package:dream_calc/screens/matrixScreens/matrixFourScreen.dart';
import 'package:dream_calc/screens/matrixScreens/matrixThreeScreen.dart';
import 'package:dream_calc/screens/matrixScreens/matrixTwoScreen.dart';
import 'package:dream_calc/screens/quadraticScreen.dart';
import 'package:dream_calc/screens/settingScreens/aboutUsScreen.dart';
import 'package:dream_calc/screens/settingScreens/contactUsScreen.dart';
import 'package:dream_calc/screens/trigScreen.dart';
import 'package:dream_calc/screens/unitScreen.dart';
import 'package:dream_calc/screens/vectorScreen.dart';
import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/screens/lcmhcfScreen.dart';
import 'package:dream_calc/screens/centTendScreen.dart';
import 'package:dream_calc/screens/areaScreen.dart';
import 'package:dream_calc/screens/volumeScreen.dart';
import 'package:dream_calc/screens/settingScreens/settingsScreen.dart';
import 'package:dream_calc/screens/percentScreen.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/screens/cubicScreen.dart';
import 'package:dream_calc/screens/linearScreens/linearOneScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => loading(),
        '/genScreen' : (context) => home(),
        '/genCalc' : (context) => genCalc(),
        '/lcmhcf' : (context) => lcmhcfCalc(),
        '/centTend' : (context) => centTendCalc(),
        '/area' : (context) => areaCalc(),
        '/volume' : (context) => volumeCalc(),
        '/settings' : (context) => settings(),
        '/unitConversion' : (context) => unitconversion(),
        '/percentage' : (context) => percentCalc(),
        '/quadratic' : (context) => quadraticCalc(),
        '/cubic' : (context) => cubicCalc(),
        '/vector' : (context) => vector(),
        '/complex' : (context) => complex(),
        '/linearChoice' : (context) => linearChoice(),
        '/linearTwo' : (context) => linearTwo(),
        '/linearThree' : (context) => linearThree(),
        '/linearOne' : (context) => linearOne(),
        '/trigonometry' : (context) => trigonometry(),
        '/matrixChoice' : (context) => matrixChoice(),
        '/matrixTwo' : (context) => matrixTwo(),
        '/matrixThree' : (context) => matrixThree(),
        '/matrixFour' : (context) => matrixFour(),
        '/formulaChoice' : (context) => formulaChoice(),
        '/quadraticFormulae' : (context) => quadraticFormula(),
        '/trigonometryFormulae' : (context) => trigonometryFormula(),
        '/differentialFormulae' : (context) => differentialFormula(),
        '/integralFormulae' : (context) => integralFormula(),
        '/aboutUs' : (context) => aboutUs(),
        '/contactUs' : (context) => contactUs(),
      },
    ));
  }
  );
}


