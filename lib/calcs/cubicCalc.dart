import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

List<String> cubeCalc(String A, String B, String C, String D){
  if(A == "" || B == "" || C == "" || D == ""){
    return ["CHECK INPUT", "CHECK INPUT", "CHECK INPUT","CHECK INPUT"];
  }
  final equation = CubicEquation(a: double.parse(A),b: double.parse(B),c: double.parse(C),d: int.parse(D));
  List rootsRaw = [equation.calculate()['x1'].toString(), equation.calculate()['x2'].toString(), equation.calculate()['x3'].toString()];

  if(rootsRaw[1].toString() == "null"){
      rootsRaw[1] = rootsRaw[0];
    }
    if(rootsRaw[2].toString() == "null"){
      rootsRaw[2] = rootsRaw[1];
    }

    print(rootsRaw);
    List<String> rootsFinal = ['','',''];
    List<String> rootOne = rootsRaw[0].split('+');
    List<String> rootTwo = rootsRaw[1].split('+');
    List<String> rootThree = rootsRaw[2].split('+');
    List sign = ['+','+','+'];
    if(rootOne[1].toString()[1] == '-'){
      sign[0] = '-';
      rootOne[1] = rootOne[1].toString().substring(2,);
    }
    if(rootTwo[1].toString()[1] == '-'){
      sign[1] = '-';
      rootTwo[1] = rootTwo[1].toString().substring(2,);
    }
    if(rootThree[1].toString()[1] == '-'){
      sign[1] = '-';
      rootThree[1] = rootThree[1].toString().substring(2,);
    }

    if(rootOne[1] == ' 0i'){
      rootOne[1] = '';
      sign[0] = '';
    }
    if(rootTwo[1] == ' 0i'){
      rootTwo[1] = '';
      sign[1] = '';
    }
    if(rootThree[1] == ' 0i'){
      rootThree[1] = '';
      sign[2] = '';
    }

    rootOne[0] = formatNumber(rootOne[0].toStringAsFixedNoZero(precision));
    rootTwo[0] = formatNumber(rootTwo[0].toStringAsFixedNoZero(precision));
    rootThree[0] = formatNumber(rootThree[0].toStringAsFixedNoZero(precision));

    if(rootOne[1]!=''){
      rootOne[1] = formatNumber(rootOne[1].toString().replaceAll('i', '').toStringAsFixedNoZero(precision)) + ' i';
    }
    if(rootTwo[1]!=''){
      rootTwo[1] = formatNumber(rootTwo[1].toString().replaceAll('i', '').toStringAsFixedNoZero(precision)) + ' i';
    }
    if(rootThree[1]!=''){
      rootThree[1] = formatNumber(rootThree[1].toString().replaceAll('i', '').toStringAsFixedNoZero(precision)) + ' i';
    }


    rootsFinal[0] = rootOne[0] + ' ' + sign[0] + ' ' + rootOne[1];
    rootsFinal[1] = rootTwo[0] + ' ' + sign[1] + ' ' + rootTwo[1];
    rootsFinal[2] = rootThree[0] + ' ' + sign[2] + ' ' + rootThree[1];
    return [rootsFinal[0],rootsFinal[1],rootsFinal[2],formatNumber(equation.discriminant().toDouble().toStringAsFixedNoZero(precision))];
}