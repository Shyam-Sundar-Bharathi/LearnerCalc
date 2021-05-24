import 'package:dream_calc/services/formatNumber.dart';
import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/screens/menu.dart';

String calcx(String A, String B){
  double a = double.parse(A);
  double b = double.parse(B);
  if(a == 0){
    return "NO SOLUTION";
  }
  return "x = " + formatNumber((-b/a).toStringAsFixedNoZero(precision));
}

String calcxy(String a1, String b1, String c1, String a2, String b2, String c2){
  double A1 = double.parse(a1);
  double B1 = double.parse(b1);
  double C1 = double.parse(c1);
  double A2 = double.parse(a2);
  double B2 = double.parse(b2);
  double C2 = double.parse(c2);
  double x,y;
  if(A1*B2 == A2*B1){
    if(A1*C2 == A2*C1){
      return "INFINITE SOLUTIONS";
    }
    else{
      return "NO SOLUTION";
    }
  }
  else{
    final dx = SquareMatrix([[C1,B1],[C2,B2]]);
    final dy = SquareMatrix([[A1,C1],[A2,C2]]);
    final d = SquareMatrix([[A1,B1],[A2,B2]]);
    x = (dx.determinant())/(d.determinant());
    y = (dy.determinant())/(d.determinant());

  }
  return "x = " + formatNumber(x.toStringAsFixedNoZero(precision)) + "\ny = " + formatNumber(y.toStringAsFixedNoZero(precision));
}


String calcxyz(String A1, String B1, String C1, String D1, String A2, String B2, String C2, String D2,String A3, String B3, String C3, String D3){
  double a1 = double.parse(A1);
  double b1 = double.parse(B1);
  double c1 = double.parse(C1);
  double d1 = double.parse(D1);
  double a2 = double.parse(A2);
  double b2 = double.parse(B2);
  double c2 = double.parse(C2);
  double d2 = double.parse(D2);
  double a3 = double.parse(A3);
  double b3 = double.parse(B3);
  double c3 = double.parse(C3);
  double d3 = double.parse(D3);
  double x=0,y=0,z=0;
  final d = SquareMatrix([[a1,b1,c1],[a2,b2,c2],[a3,b3,c3]]);
  final dx = SquareMatrix([[d1,b1,c1],[d2,b2,c2],[d3,b3,c3]]);
  final dy = SquareMatrix([[a1,d1,c1],[a2,d2,c2],[a3,d3,c3]]);
  final dz = SquareMatrix([[a1,b1,d1],[a2,b2,d2],[a3,b3,d3]]);
  if(d.determinant() == 0){
    if(dx.determinant() == 0 && dy.determinant() == 0 && dz.determinant() == 0 ){
      return "INFINITE SOLUTIONS";
    }
    else
      return "NO SOLUTION";
  }

  x = dx.determinant()/d.determinant();
  y = dy.determinant()/d.determinant();
  z = dz.determinant()/d.determinant();
  return "x = " + formatNumber(x.toStringAsFixedNoZero(precision)) + "\ny = " + formatNumber(y.toStringAsFixedNoZero(precision))+ "\nz = " + formatNumber(z.toStringAsFixedNoZero(precision));


}