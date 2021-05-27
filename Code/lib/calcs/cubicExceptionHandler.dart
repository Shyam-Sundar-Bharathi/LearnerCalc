import 'package:equations/equations.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

List<String> cubeTestCalc(String A, String B, String C, String D){
  final equation = Cubic(a: Complex(double.parse(A), 0),b: Complex(double.parse(B), 0),c: Complex(double.parse(C), 0),d: Complex(double.parse(D), 0));
  List<String> rootsRaw = [equation.solutions()[0].toString(),equation.solutions()[1].toString(), equation.solutions()[2].toString() ];
  List<String> rootSigns = ['+','+','+'];
  for(int i=0; i<3; i++){
    if(rootsRaw[i][0] == '-'){
      rootSigns[i] = '-';
      rootsRaw[i] = rootsRaw[i].substring(1, rootsRaw[i].length);
    }
    if(rootsRaw[i].contains('-')){
      rootsRaw[i] = rootsRaw[i].replaceAll('-',"+ -");
    }
    if(rootSigns[i] == '-'){
      rootsRaw[i] = '-' + rootsRaw[i];
    }
  }
  return rootsRaw;
}