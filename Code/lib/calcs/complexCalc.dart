import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

String complexChoice(String a1, String b1, String a2, String b2, int fn){

  //Automating zero for empty input.
  if(fn == 2 || fn == 3 || fn == 10 || fn == 11){
    if(a1 == "" && b1 == ""){
      return "CHECK INPUT";
    }
    if(a2 == "" && b2 == ""){
      return "CHECK INPUT";
    }
    if(a1 == ""){
      a1 = '0';
    }
    if(b1 == ""){
      b1 = '0';
    }
    if(a2 == ""){
      a2 = '0';
    }if(b2 == ""){
      b2 = '0';
    }
  }

  else if(fn == 0 || fn == 4 || fn == 5 || fn == 6 || fn == 8 || fn == 9){
    if(a1 == "" && b1 == ""){
      return "CHECK INPUT";
    }
    if (a1 == ""){
      a1 = '0';
    }
    if (b1 == ""){
      b1 = '0';
    }
  }

  else if(fn == 1 || fn == 7){
    if(a2 == "" && b2 == ""){
      return "CHECK INPUT";
    }
    if (a2 == ""){
      a2 = '0';
    }
    if (b2 == ""){
      b2 = '0';
    }
  }
  String result;
  switch(fn){
    case 0: result = mod(a1, b1);
    break;
    case 1: result = mod(a2, b2);
    break;
    case 2: result = add(a1, b1, a2, b2);
    break;
    case 3: result = sub(a1, b1, a2, b2);
    break;
    case 4: result = power(a1, b1, 2);
    break;
    case 5: result = power(a1, b1, 3);
    break;
    case 6: result = arg(a1, b1);
    break;
    case 7: result = arg(a2, b2);
    break;
    case 8: result = roots(a1, b1, 2);
    break;
    case 9: result = roots(a1, b1, 3);
    break;
    case 10: result = mul(a1, b1, a2, b2);
    break;
    case 11: result = div(a1, b1, a2, b2);
    break;
  }
  return result;
}

String formatComplex(String ans){
  int length = ans.length;
  List signs = ['',''];
  signs[0] = ans[0]=='-'? '-' : '';
  ans = ans[0]=='-'? ans.substring(1,length-1) : ans.substring(0,length-1);
  ans = ans.contains('-') && ans.contains('+')? ans.replaceAll('+', '') : ans;
  signs[1] = ans.contains('-')? ' - ' : ' + ';
  List<String> sNumbers = ans.contains('-') ? ans.split('-') : ans.split('+');
  sNumbers[0] = sNumbers[0].toStringAsFixedNoZero(precision);
  sNumbers[1] = sNumbers[1].toStringAsFixedNoZero(precision);
  return signs[0] + sNumbers[0] + signs[1] + sNumbers[1] + ' i';
}

String mod(String a, String b){

  final c = Complex(re: double.parse(a), im: double.parse(b));
  return formatNumber(c.module.toDouble().toStringAsFixedNoZero(precision));
}

String add(String a1, String b1, String a2, String b2){

  double A1 = double.parse(a1);
  double B1 = double.parse(b1);
  double A2 = double.parse(a2);
  double B2 = double.parse(b2);
  String sign = B1 + B2 >= 0 ? '+' : '-';
  double secondElement = B1 + B2 >= 0 ? B1 + B2 : -(B1+B2);
  return formatNumber((A1+A2).toStringAsFixedNoZero(precision)) + ' ' + sign + ' ' + formatNumber(secondElement.toStringAsFixedNoZero(precision)) + 'i';
}

String sub(String a1, String b1, String a2, String b2){

  double A1 = double.parse(a1);
  double B1 = double.parse(b1);
  double A2 = double.parse(a2);
  double B2 = double.parse(b2);
  String sign = B1 - B2 >= 0 ? '+' : '-';
  double secondElement = B1 - B2 >= 0 ? B1 - B2 : B2-B1;
  return formatNumber((A1-A2).toStringAsFixedNoZero(precision)) + " " + sign + " " + formatNumber(secondElement.toStringAsFixedNoZero(precision)) + 'i';
}

String power(String a, String b, int power){

  final c = Complex(re: double.parse(a), im: double.parse(b));
  return formatComplex(c.pow(power).toString());
}

String arg(String a, String b){

  final c = Complex(re: double.parse(a), im: double.parse(b));
  return c.argument.toDouble().toStringAsFixedNoZero(precision);
}

String roots(String a, String b, int power){

  if(double.parse(b) == 0 && double.parse(a)<=0 && power == 2){
    double root = pow(-double.parse(a),0.5);
    return "√A = 0 + ${root}i\n√A = 0 - ${root}i";
  }
  final c = Complex(re: double.parse(a), im: double.parse(b));
  List roots = c.rootsOf(power);
  print(roots);
  if(power == 2){
    return "√A = ${formatComplex(roots[0].toString())}\n√A = ${formatComplex(roots[1].toString())}";
  }
  if(power == 3){
    return "∛A = ${formatComplex(roots[0].toString())}\n∛A = ${formatComplex(roots[1].toString())}\n∛A = ${formatComplex(roots[2].toString())}";
  }
  return " ";
}

String mul(String a1, String b1, String a2, String b2) {

  double A1 = double.parse(a1);
  double B1 = double.parse(b1);
  double A2 = double.parse(a2);
  double B2 = double.parse(b2);
  final c1 = Complex(re: A1, im: B1);
  final c2 = Complex(re: A2, im: B2);
  return formatComplex((c1*c2).toString());
}


String div(String a1, String b1, String a2, String b2) {

  double A1 = double.parse(a1);
  double B1 = double.parse(b1);
  double A2 = double.parse(a2);
  double B2 = double.parse(b2);
  final c1 = Complex(re: A1, im: B1);
  final c2 = Complex(re: A2, im: B2);
  return formatComplex((c1/c2).toString());
}