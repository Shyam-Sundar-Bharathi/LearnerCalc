import 'package:dream_calc/screens/circleScreens/centerPointScreen.dart';
import 'package:dream_calc/screens/circleScreens/centerRadiusScreen.dart';
import 'package:dream_calc/screens/circleScreens/choiceScreen.dart';
import 'package:dream_calc/screens/circleScreens/equationScreen.dart';
import 'package:dream_calc/screens/complexScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/algebraFormulaeScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/areaFormualeScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/centTendFormulaeScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/constantsFormulaeScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/coordinateFormulaeScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/differentialFormulaeScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/formulaeChoiceScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/inverseTrigFormulaeScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/linearFormulaeScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/powersOfTenScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/progressionFormulaeScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/quadraticFormulaeScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/trigFormulaeScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/volumeFormulaeScreen.dart';
import 'package:dream_calc/screens/genCalcScreen.dart';
import 'package:dream_calc/screens/formulaeScreens/integralFormulaeScreen.dart';
import 'package:dream_calc/screens/linearScreens/choiceScreen.dart';
import 'package:dream_calc/screens/linearScreens/threeScreen.dart';
import 'package:dream_calc/screens/linearScreens/twoScreen.dart';
import 'package:dream_calc/screens/loadingScreen.dart';
import 'package:dream_calc/screens/matrixScreens/choiceScreen.dart';
import 'package:dream_calc/screens/matrixScreens/fourScreen.dart';
import 'package:dream_calc/screens/matrixScreens/threeScreen.dart';
import 'package:dream_calc/screens/matrixScreens/twoScreen.dart';
import 'package:dream_calc/screens/progressionsScreens/arithmeticScreen.dart';
import 'package:dream_calc/screens/progressionsScreens/choiceScreen.dart';
import 'package:dream_calc/screens/progressionsScreens/geometricScreen.dart';
import 'package:dream_calc/screens/progressionsScreens/harmonicScreen.dart';
import 'package:dream_calc/screens/quadraticScreen.dart';
import 'package:dream_calc/screens/settingScreens/contactUsScreen.dart';
import 'package:dream_calc/screens/settingScreens/didyouknowScreen.dart';
import 'package:dream_calc/screens/straightLineScreens/choiceScreen.dart';
import 'package:dream_calc/screens/straightLineScreens/equationScreen.dart';
import 'package:dream_calc/screens/straightLineScreens/normalScreen.dart';
import 'package:dream_calc/screens/straightLineScreens/pointSlopeScreen.dart';
import 'package:dream_calc/screens/straightLineScreens/twoPointScreen.dart';
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
import 'package:dream_calc/screens/linearScreens/oneScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
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
        '/powersOfTenFormulae' : (context) => powersOfTen(),
        '/algebraFormulae' : (context) => algebraicFormula(),
        '/progressionFormulae' : (context) => progressionFormula(),
        '/centTendFormulae' : (context) => centTendFormula(),
        '/quadraticFormulae' : (context) => quadraticFormula(),
        '/coordinateGeoFormulae' : (context) => coordinateFormula(),
        '/trigonometryFormulae' : (context) => trigonometryFormula(),
        '/inverseTrigonometryFormulae' : (context) => inverseTrigonometryFormula() ,
        '/differentialFormulae' : (context) => differentialFormula(),
        '/integralFormulae' : (context) => integralFormula(),
        '/linearFormulae' : (context) => linearFormula(),
        '/constantsFormulae' : (context) => constantsFormula(),
        '/areaFormulae' : (context) => areaFormula(),
        '/volumeFormulae' : (context) => volumeFormula(),
        '/contactUs' : (context) => contactUs(),
        '/didYouKnow' : (context) => didYouKnow(),
        '/straightLineChoice' : (context) => straightLineChoice(),
        '/straightLineTwoPoint' : (context) => straightLineTwoPoint(),
        '/straightLinePointSlope' : (context) => straightLinePointSlope(),
        '/straightLineEquation' : (context) => straightLineEquation(),
        '/straightLineNormal' : (context) => straightLineNormal(),
        '/circleChoice' : (context) => circleChoice(),
        '/circleCenterRadius' : (context) => circleCenterRadius(),
        '/circleCenterPoint' : (context) => circleCenterPoint(),
        '/circleEquation' : (context) => circleEquation(),
        '/progressionsChoice' : (context) => progressionsChoice(),
        '/arithmeticProgression' : (context) => arithmeticProgression(),
        '/geometricProgression' : (context) => geometricProgression(),
        '/harmonicProgression' : (context) => harmonicProgression(),
      },
    ));
  }
  );
}


