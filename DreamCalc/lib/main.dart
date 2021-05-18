import 'package:dream_calc/screens/complexScreen.dart';
import 'package:dream_calc/screens/currencyScreen.dart';
import 'package:dream_calc/screens/linearChoiceScreen.dart';
import 'package:dream_calc/screens/linearThreeScreen.dart';
import 'package:dream_calc/screens/linearTwoScreen.dart';
import 'package:dream_calc/screens/loadingScreen.dart';
import 'package:dream_calc/screens/matrixChoiceScreen.dart';
import 'package:dream_calc/screens/matrixThreeScreen.dart';
import 'package:dream_calc/screens/matrixTwoScreen.dart';
import 'package:dream_calc/screens/quadraticScreen.dart';
import 'package:dream_calc/screens/trigScreen.dart';
import 'package:dream_calc/screens/unitScreen.dart';
import 'package:dream_calc/screens/vectorScreen.dart';
import 'package:flutter/material.dart';
import 'package:dream_calc/screens/genScreen.dart';
import 'package:dream_calc/screens/lcmhcfScreen.dart';
import 'package:dream_calc/screens/centTendScreen.dart';
import 'package:dream_calc/screens/areaScreen.dart';
import 'package:dream_calc/screens/volumeScreen.dart';
import 'package:dream_calc/screens/settings.dart';
import 'package:dream_calc/screens/percentScreen.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/screens/cubicScreen.dart';
import 'package:dream_calc/screens/linearOneScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => loading(),
        '/genScreen' : (context) => home(),
        '/lcmhcf' : (context) => lcmhcfCalc(),
        '/centTend' : (context) => centTendCalc(),
        '/area' : (context) => areaCalc(),
        '/volume' : (context) => volumeCalc(),
        '/settings' : (context) => settings(),
        '/unitConversion' : (context) => unitconversion(),
        '/percentage' : (context) => percentCalc(),
        '/currency' : (context) => currency(),
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
      },
    ));
  }
  );
}


