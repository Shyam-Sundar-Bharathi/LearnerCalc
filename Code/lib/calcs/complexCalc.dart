import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

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
  if(a == "" || b == ""){
    return "CHECK INPUT";
  }
  final c = Complex(re: double.parse(a), im: double.parse(b));
  return formatNumber(c.module.toDouble().toStringAsFixedNoZero(precision));
}

String add(String a1, String b1, String a2, String b2){
  if(a1 == "" || b1 == "" || a2 == "" || b2 == ""){
    return "CHECK INPUT";
  }
  double A1 = double.parse(a1);
  double B1 = double.parse(b1);
  double A2 = double.parse(a2);
  double B2 = double.parse(b2);
  String sign = B1 + B2 > 0 ? '+' : '';
  return formatNumber((A1+A2).toStringAsFixedNoZero(precision)) + ' ' + sign + ' ' + formatNumber((B1+B2).toStringAsFixedNoZero(precision)) + 'i';
}

String sub(String a1, String b1, String a2, String b2){
  if(a1 == "" || b1 == "" || a2 == "" || b2 == ""){
    return "CHECK INPUT";
  }
  double A1 = double.parse(a1);
  double B1 = double.parse(b1);
  double A2 = double.parse(a2);
  double B2 = double.parse(b2);
  String sign = B1 - B2 > 0 ? '+' : '';
  return formatNumber((A1-A2).toStringAsFixedNoZero(precision)) + ' ' + sign + ' ' + formatNumber((B1-B2).toStringAsFixedNoZero(precision)) + 'i';
}

String power(String a, String b, int power){
  if(a == "" || b == ""){
    return "CHECK INPUT";
  }
  final c = Complex(re: double.parse(a), im: double.parse(b));
  return formatComplex(c.pow(power).toString());
}

String arg(String a, String b){
  if(a == "" || b == ""){
    return "CHECK INPUT";
  }
  final c = Complex(re: double.parse(a), im: double.parse(b));
  return c.argument.toDouble().toStringAsFixedNoZero(precision);
}

String roots(String a, String b, int power){
  if(a == "" || b == ""){
    return "CHECK INPUT";
  }
  final c = Complex(re: double.parse(a), im: double.parse(b));
  List roots = c.rootsOf(power);
  if(power == 2){
    return "√A = ${formatComplex(roots[0].toString())}\n√A = ${formatComplex(roots[1].toString())}";
  }
  if(power == 3){
    return "∛A = ${formatComplex(roots[0].toString())}\n∛A = ${formatComplex(roots[1].toString())}\n∛A = ${formatComplex(roots[2].toString())}";
  }
  return " ";
}

String mul(String a1, String b1, String a2, String b2) {
  if(a1 == "" || b1 == "" || a2 == "" || b2 == ""){
    return "CHECK INPUT";
  }
  double A1 = double.parse(a1);
  double B1 = double.parse(b1);
  double A2 = double.parse(a2);
  double B2 = double.parse(b2);
  final c1 = Complex(re: A1, im: B1);
  final c2 = Complex(re: A2, im: B2);
  return formatComplex((c1*c2).toString());
}


String div(String a1, String b1, String a2, String b2) {
  if(a1 == "" || b1 == "" || a2 == "" || b2 == ""){
    return "CHECK INPUT";
  }
  double A1 = double.parse(a1);
  double B1 = double.parse(b1);
  double A2 = double.parse(a2);
  double B2 = double.parse(b2);
  final c1 = Complex(re: A1, im: B1);
  final c2 = Complex(re: A2, im: B2);
  return formatComplex((c1/c2).toString());
}