import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

String oneBitBooleanChoice(String X, String Y, int fn, String ch){
  if((fn == 0 && X == "") || (fn == 1 && Y == "")) return "CHECK INPUT";
  else if((fn > 1) && (X == "" && Y == "")) return "CHECK INPUT";
  if (X == "") return oneBitInTermsOfXBooleanChoice(Y, fn, ch);
  else if (Y == "") return oneBitInTermsOfYBooleanChoice(X, fn, ch);
  int x = int.parse(X);
  int y = int.parse(Y);
  int result = 0;

  switch(fn){
    case 0 : result = notX(x);
    break;
    case 1 : result = notX(y);
    break;
    case 2: result = orXY(x, y);
    break;
    case 3: result = norXY(x, y);
    break;
    case 4: result = andXY(x, y);
    break;
    case 5: result = nandXY(x, y);
    break;
    case 6: result = xorXY(x, y);
    break;
    case 7: result = xnorXY(x, y);
    break;
    case 8: result = ifXY(x, y);
    break;
    case 9: result = iffXY(x, y);
    break;
    case 10: result = x + notX(y);
    break;
    case 11: result = x * notX(y);
  }
  if(result > 1) result = 1;
  String rs = ch.replaceAll("x", x.toString()).replaceAll("y", y.toString());
  return rs + " = " + result.toString();
}

String oneBitInTermsOfXBooleanChoice(String Y, int fn, String ch){
  int y = int.parse(Y);
  String result = "";
  switch(fn){
    case 1 : return ch.replaceAll('y', y.toString()) + "=" + notX(y).toString();
    break;
    case 2: result = y == 0? "x" : "1";
    break;
    case 3: result = y == 0? r"\tilde x" : "0";
    break;
    case 4: result = y == 0? "0" : "x";
    break;
    case 5: result = y == 0? "1" : r"\tilde x";
    break;
    case 6: result = y == 0? "x" : r"\tilde x";
    break;
    case 7: result = y == 0? r"\tilde x" : "x";
    break;
    case 8: result = y == 0? r"\tilde x" : "1";
    break;
    case 9: result = y == 0? r"\tilde x" : "x";
    break;
    case 10: result = y == 0? "1" : "x";
    break;
    case 11: result = y == 0? "x" : "0";
  }

  String rs = ch.replaceAll("y", y.toString());
  return rs + " = " + result;
}

String oneBitInTermsOfYBooleanChoice(String X, int fn, String ch){
  int x = int.parse(X);
  String result = "";
  switch(fn){
    case 0 : return ch.replaceAll('x', x.toString()) + "=" + notX(x).toString();
    break;
    case 2: result = x == 0? "y" : "1";
    break;
    case 3: result = x == 0? r"\tilde y" : "0";
    break;
    case 4: result = x == 0? "0" : "y";
    break;
    case 5: result = x == 0? "1" : r"\tilde y";
    break;
    case 6: result = x == 0? "y" : r"\tilde y";
    break;
    case 7: result = x == 0? r"\tilde y" : "y";
    break;
    case 8: result = x == 0? "1" : "y";
    break;
    case 9: result = x == 0? r"\tilde y" : "y";
    break;
    case 10: result = x == 0? r"\tilde y" : "1";
    break;
    case 11: result = x == 0? "0" : r"\tilde y";
  }

  String rs = ch.replaceAll("x", x.toString());
  return rs + " = " + result;
}

int notX(int x){
  return 1 - x;
}

int orXY(int x, int y){
  return x + y;
}

int norXY(int x, int y){
  return notX(orXY(x, y));
}

int andXY(int x, int y){
  return x * y;
}

int nandXY(int x, int y){
  return notX(andXY(x, y));
}

int xorXY(int x, int y){
  return (x * notX(y)) + (y * notX(x));
}

int xnorXY(int x, int y){
  return notX(xorXY(x, y));
}

int ifXY(int x, int y){
  return notX(x) + y;
}

int iffXY(int x, int y){
  return notX(xorXY(x, y));
}


