import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

String mod(String a, String b, String c){
  if( a == "" ||  b == "" ||  c == ""){
    return "CHECK INPUT";
  }
  List vectors = <num>[double.parse(a),double.parse(b),double.parse(c)];
  final v = Vector(vectors);
  return formatNumber(v.length.toDouble().toStringAsFixedNoZero(precision));
}

String add(String a1, String b1, String c1, String a2, String b2, String c2){
  if( a1 == "" ||  b1 == "" ||  c1 == "" || a2 == "" ||  b2 == "" ||  c2 == ""){
    return "CHECK INPUT";
  }
  double A1 = double.parse(a1);
  double B1 = double.parse(b1);
  double C1 = double.parse(c1);
  double A2 = double.parse(a2);
  double B2 = double.parse(b2);
  double C2 = double.parse(c2);
  List signs = ['',''];
  signs[0] = B1 + B2 >= 0 ? '+' : '';
  signs[1] = C1 + C2 >= 0 ? '+' : '';
  return formatNumber((A1+A2).toStringAsFixedNoZero(precision)) + 'i ' + signs[0] + formatNumber((B1+B2).toStringAsFixedNoZero(precision)) + 'j ' + signs[1] + formatNumber((C1+C2).toStringAsFixedNoZero(precision)) + 'k';
}

String sub(String a1, String b1, String c1, String a2, String b2, String c2){
  if( a1 == "" ||  b1 == "" ||  c1 == "" || a2 == "" ||  b2 == "" ||  c2 == ""){
    return "CHECK INPUT";
  }
  double A1 = double.parse(a1);
  double B1 = double.parse(b1);
  double C1 = double.parse(c1);
  double A2 = double.parse(a2);
  double B2 = double.parse(b2);
  double C2 = double.parse(c2);
  List signs = ['',''];
  signs[0] = B1 - B2 >= 0 ? '+' : '';
  signs[1] = C1 - C2 >= 0 ? '+' : '';
  return formatNumber((A1-A2).toStringAsFixedNoZero(precision)) + 'i ' + signs[0] + formatNumber((B1-B2).toStringAsFixedNoZero(precision)) + 'j ' + signs[1] + formatNumber((C1-C2).toStringAsFixedNoZero(precision)) + 'k';
}

String dot(String a1, String b1, String c1, String a2, String b2, String c2){
  if( a1 == "" ||  b1 == "" ||  c1 == "" || a2 == "" ||  b2 == "" ||  c2 == ""){
    return "CHECK INPUT";
  }
  final v1 = Vector(<num>[double.parse(a1),double.parse(b1),double.parse(c1)]);
  final v2 = Vector(<num>[double.parse(a2),double.parse(b2),double.parse(c2)]);
  return formatNumber(v1.dot(v2).toDouble().toStringAsFixedNoZero(precision));
}

String cross(String a1, String b1, String c1, String a2, String b2, String c2){
  if( a1 == "" ||  b1 == "" ||  c1 == "" || a2 == "" ||  b2 == "" ||  c2 == ""){
    return "CHECK INPUT";
  }
  final v1 = Vector(<num>[double.parse(a1),double.parse(b1),double.parse(c1)]);
  final v2 = Vector(<num>[double.parse(a2),double.parse(b2),double.parse(c2)]);
  Vector ls = v1.cross(v2);
  List signs = ['',''];
  signs[0] = ls[1].toString()[0] == '-' ? '' : '+';
  signs[1] = ls[2].toString()[0] == '-' ? '' : '+';
  return formatNumber(ls[0].toDouble().toStringAsFixedNoZero(precision)) + 'i ' + signs[0] + formatNumber(ls[1].toDouble().toStringAsFixedNoZero(precision)) + 'j ' + signs[1] + formatNumber(ls[2].toDouble().toStringAsFixedNoZero(precision)) + 'k';
}

String star(String a1, String b1, String c1, String a2, String b2, String c2){
  if( a1 == "" ||  b1 == "" ||  c1 == "" || a2 == "" ||  b2 == "" ||  c2 == ""){
    return "CHECK INPUT";
  }
  final v1 = Vector(<num>[double.parse(a1),double.parse(b1),double.parse(c1)]);
  final v2 = Vector(<num>[double.parse(a2),double.parse(b2),double.parse(c2)]);
  Vector ls = v1.hadamard(v2);
  List signs = ['',''];
  signs[0] = ls[1].toString()[0] == '-' ? '' : '+';
  signs[1] = ls[2].toString()[0] == '-' ? '' : '+';
  return formatNumber(ls[0].toDouble().toStringAsFixedNoZero(precision)) + 'i ' + signs[0] + formatNumber(ls[1].toDouble().toStringAsFixedNoZero(precision)) + 'j ' + signs[1] + formatNumber(ls[2].toDouble().toStringAsFixedNoZero(precision)) + 'k';
}

String angle(String a1, String b1, String c1, String a2, String b2, String c2){
  if( a1 == "" ||  b1 == "" ||  c1 == "" || a2 == "" ||  b2 == "" ||  c2 == ""){
    return "CHECK INPUT";
  }
  final v1 = Vector(<num>[double.parse(a1),double.parse(b1),double.parse(c1)]);
  final v2 = Vector(<num>[double.parse(a2),double.parse(b2),double.parse(c2)]);
  double angle = double.parse(v1.angleBetween(v2, degrees: true).toStringAsFixedNoZero(precision));
  return angle.toStringAsFixedNoZero(precision) + '°';
}