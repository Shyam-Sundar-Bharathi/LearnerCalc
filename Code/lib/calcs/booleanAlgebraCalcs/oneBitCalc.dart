import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

String oneBitBooleanChoice(String x, String y, int fn){
  if((fn == 0 && x == "") || (fn == 1 && y == "")) return "CHECK INPUT";
  else if(x == "" || y == "") return "CHECK INPUT";
  String result = "1";
  return result;
}
