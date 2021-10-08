import 'dart:math';

import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';

String convert(String unitElement, String unitChoiceOne, String unitChoiceTwo, String userInput, {int display = 0}){
  if(userInput == "")
    return "";
  if(unitElement.toLowerCase() == "computer"){
    String answer = computerConvert(unitChoiceOne, unitChoiceTwo, userInput);
    return answer;
  }
  if(unitElement.toLowerCase() == "ascii"){
    String answer = asciiConvert(unitChoiceOne, unitChoiceTwo, userInput);
    return answer;
  }
  userInput = userInput.replaceAll(',', '');
  double input = 0;
  double answer = 0;
  int unitPrecision = display == 0 ? 5 : 10;
  input = double.parse(userInput);
  if(unitElement.toLowerCase() == "temperature")
    return temperature(unitChoiceOne, unitChoiceTwo, userInput);

  if(unitElement.toLowerCase() == "time")
    answer = fromsecond(tosecond(unitChoiceOne, input), unitChoiceTwo);

  if(unitElement.toLowerCase() == 'length'){
    answer = frommeter(tometer(unitChoiceOne, input), unitChoiceTwo);
  }

  if(unitElement.toLowerCase() == 'mass')
    answer = fromgram(togram(unitChoiceOne, input), unitChoiceTwo);

  if(unitElement.toLowerCase() == 'plane angle')
    answer = fromdegree(todegree(unitChoiceOne, input), unitChoiceTwo);

  if(unitElement.toLowerCase() == 'speed')
    answer = frommps(tomps(unitChoiceOne, input), unitChoiceTwo);

  if(unitElement.toLowerCase() == 'energy')
    answer = fromjoule(tojoule(unitChoiceOne, input), unitChoiceTwo);

  if(unitElement.toLowerCase() == 'area')
    answer =  fromsqmeter(tosqmeter(unitChoiceOne, input), unitChoiceTwo);

  if(unitElement.toLowerCase() == 'volume')
    answer = fromcumeter(tocumeter(unitChoiceOne, input), unitChoiceTwo);

  return answer > 1 ? formatNumber(answer.toStringAsFixedNoZero(precision)) : formatNumber(answer.toStringAsFixedNoZero(unitPrecision));
}

double tosecond(String unitChoiceOne, double userInput){
  if(unitChoiceOne == 'second')
    return userInput;
  if(unitChoiceOne == 'minute')
    return userInput*60;
  if(unitChoiceOne == 'hour')
    return userInput*3600;
  if(unitChoiceOne == 'day')
    return userInput*86400;
}

double fromsecond(double ans1, String unitChoiceTwo){
  if(unitChoiceTwo == 'second')
    return ans1;
  if(unitChoiceTwo == 'minute')
    return ans1/60;
  if(unitChoiceTwo == 'hour')
    return ans1/3600;
  if(unitChoiceTwo == 'day')
    return ans1/86400;
}

double tocumeter(String unitChoiceOne, double userInput){
  if(unitChoiceOne == 'cubic meter')
    return userInput;
  if(unitChoiceOne == 'liter')
    return userInput/1000;
  if(unitChoiceOne == 'cubic centimeter')
    return userInput/1000000;
  if(unitChoiceOne == 'milliliter')
    return userInput/1000000;
  if(unitChoiceOne == 'cubic foot')
    return userInput*0.0283168;
  if(unitChoiceOne == 'cubic inch')
    return userInput/61024;
  return 0;
}

double fromcumeter(double ans1, String unitChoiceTwo){
  if(unitChoiceTwo == 'cubic meter')
    return ans1;
  if(unitChoiceTwo == 'liter')
    return ans1*1000;
  if(unitChoiceTwo == 'cubic centimeter')
    return ans1*1000000;
  if(unitChoiceTwo == 'milliliter')
    return ans1*1000000;
  if(unitChoiceTwo == 'cubic foot')
    return ans1/0.0283168;
  if(unitChoiceTwo == 'cubic inch')
    return ans1*61024;
  return 0;
}

double tosqmeter(String unitChoiceOne, double userInput){
  if(unitChoiceOne == 'sq. meter')
    return userInput;
  if(unitChoiceOne == 'sq. foot')
    return userInput/10.764;
  if(unitChoiceOne == 'sq. kilometer')
    return userInput*1000000;
  if(unitChoiceOne == 'sq. centimeter')
    return userInput/10000;
  if(unitChoiceOne == 'sq. mile')
    return userInput*2590000;
  if(unitChoiceOne == 'sq. inch')
    return userInput*0.00064516;
  if(unitChoiceOne == 'sq. yard')
    return userInput/1.1959900463011;
  if(unitChoiceOne == 'ground')
    return userInput*222.9654403567;
  if(unitChoiceOne == 'cent')
    return userInput/0.024710538146717;
  if(unitChoiceOne == 'acre')
    return userInput/0.0002471053815;
  if(unitChoiceOne == 'hectare')
    return userInput*10000;
  return 0;
}

double fromsqmeter(double ans1, String unitChoiceTwo){
  if(unitChoiceTwo == 'sq. meter')
    return ans1;
  if(unitChoiceTwo == 'sq. foot')
    return ans1*10.764;
  if(unitChoiceTwo == 'sq. kilometer')
    return ans1/1000000;
  if(unitChoiceTwo == 'sq. centimeter')
    return ans1*10000;
  if(unitChoiceTwo == 'sq. mile')
    return ans1/2590000;
  if(unitChoiceTwo == 'sq. inch')
    return ans1/0.00064516;
  if(unitChoiceTwo == 'sq. yard')
    return ans1*1.1959900463011;
  if(unitChoiceTwo == 'ground')
    return ans1/222.9654403567;
  if(unitChoiceTwo == 'cent')
    return ans1*0.024710538146717;
  if(unitChoiceTwo == 'acre')
    return ans1*0.0002471053815;
  if(unitChoiceTwo == 'hectare')
    return ans1/10000;
  return 0;
}

double tojoule(String unitChoiceOne, double userInput){
  if(unitChoiceOne == 'joule')
    return userInput;
  if(unitChoiceOne == 'calorie')
    return userInput*4.184;
  if(unitChoiceOne == 'kilojoule')
    return userInput*1000;
  if(unitChoiceOne == 'kilocalorie')
    return userInput*4184;
  if(unitChoiceOne == 'watt hour')
    return userInput*3600;
  if(unitChoiceOne == 'kilowatt hour')
    return userInput*3600000;
  if(unitChoiceOne == 'foot-pound')
    return userInput*1.35582;
  return 0;
}

double fromjoule(double ans1, String unitChoiceTwo){
  if(unitChoiceTwo == 'joule')
    return ans1;
  if(unitChoiceTwo == 'calorie')
    return ans1/4.184;
  if(unitChoiceTwo == 'kilojoule')
    return ans1/1000;
  if(unitChoiceTwo == 'kilocalorie')
    return ans1/4184;
  if(unitChoiceTwo == 'watt hour')
    return ans1/3600;
  if(unitChoiceTwo == 'kilowatt hour')
    return ans1/3600000;
  if(unitChoiceTwo == 'foot-pound')
    return ans1/1.35582;
  return 0;
}

double tomps (String unitChoiceOne, double userInput){
  if(unitChoiceOne == 'meter per second')
    return userInput;
  if(unitChoiceOne == 'kilometer per hour')
    return userInput/3.6;
  if(unitChoiceOne == 'mile per hour')
    return userInput/2.237;
  if(unitChoiceOne == 'foot per second')
    return userInput*0.3048;
  return 0;
}

double frommps (double ans1, String unitChoiceTwo){
  if(unitChoiceTwo == 'meter per second')
    return ans1;
  if(unitChoiceTwo == 'kilometer per hour')
    return ans1*3.6;
  if(unitChoiceTwo == 'mile per hour')
    return ans1*2.237;
  if(unitChoiceTwo == 'foot per second')
    return ans1/0.3048;
  return 0;
}

double todegree(String unitChoiceOne, double userInput){
  if(unitChoiceOne == 'degree')
    return userInput;
  if(unitChoiceOne == 'radian')
    return userInput*57.295779513;
  if(unitChoiceOne == 'gradian')
    return userInput*0.9;
  if(unitChoiceOne == 'minute')
    return userInput/60;
  if(unitChoiceOne == 'second')
    return userInput/3600;
  return 0;
}

double fromdegree (double ans1, String unitChoiceTwo){
  if(unitChoiceTwo == 'degree')
    return ans1;
  if(unitChoiceTwo == 'radian')
    return ans1/57.295779513;
  if(unitChoiceTwo == 'gradian')
    return ans1/0.9;
  if(unitChoiceTwo == 'minute')
    return ans1*60;
  if(unitChoiceTwo == 'second')
    return ans1*3600;
  return 0;
}

double togram (String unitChoiceOne, double userInput){
  if(unitChoiceOne == 'gram')
    return userInput;
  if (unitChoiceOne == 'tonne')
    return userInput*1000000;
  if (unitChoiceOne == 'kilogram')
    return userInput*1000;
  if (unitChoiceOne == 'milligram')
    return userInput/1000;
  if (unitChoiceOne == 'pound')
    return userInput*453.592;
  if (unitChoiceOne == 'ounce')
    return userInput*28.3495;
  if(unitChoiceOne == 'us ton')
    return userInput*907185;
  return 0;
}

double fromgram (double ans1, String unitChoiceTwo){
  if(unitChoiceTwo == 'gram')
    return ans1;
  if (unitChoiceTwo == 'tonne')
    return ans1/1000000;
  if (unitChoiceTwo == 'kilogram')
    return ans1/1000;
  if (unitChoiceTwo == 'milligram')
    return ans1*1000;
  if (unitChoiceTwo == 'pound')
    return ans1/453.592;
  if (unitChoiceTwo == 'ounce')
    return ans1/28.3495;
  if(unitChoiceTwo == 'us ton')
    return ans1/907185;
  return 0;
}

double tometer(String unitChoiceOne, double userInput){
  if(unitChoiceOne == 'meter')
    return userInput;
  if (unitChoiceOne == 'centimeter')
    return userInput/100;
  if (unitChoiceOne == 'kilometer')
    return userInput*1000;
  if (unitChoiceOne == 'inch')
    return userInput*0.0254;
  if (unitChoiceOne == 'mile')
    return userInput*1609.34;
  if (unitChoiceOne == 'millimeter')
    return userInput/1000;
  if (unitChoiceOne == 'foot')
    return userInput*0.3048;
  if (unitChoiceOne == 'yard')
    return userInput/1.09361;
  return 0;
}

double frommeter(double ans1, String unitChoiceTwo){
  if(unitChoiceTwo == 'meter')
    return ans1;
  if (unitChoiceTwo == 'centimeter')
    return (ans1)*100;
  if (unitChoiceTwo == 'kilometer')
    return ans1/1000;
  if (unitChoiceTwo == 'inch')
    return ans1/0.0254;
  if (unitChoiceTwo == 'mile')
    return ans1/1609.34;
  if (unitChoiceTwo == 'millimeter')
    return ans1*1000;
  if (unitChoiceTwo == 'foot')
    return ans1/0.3048;
  if (unitChoiceTwo == 'yard')
    return ans1*1.09361;
  return 0;
}

String temperature (String unitChoiceOne, String unitChoiceTwo, String userInput){
  if(unitChoiceOne == 'celcius' && unitChoiceTwo == 'kelvin')
    return (double.parse(userInput) + 273.15).toStringAsFixedNoZero(precision);
  if(unitChoiceOne == 'kelvin' && unitChoiceTwo == 'celcius')
    return (double.parse(userInput) - 273.15).toStringAsFixedNoZero(precision);
  if(unitChoiceOne == 'celcius' && unitChoiceTwo == 'farenheit')
    return (1.8*double.parse(userInput)+32).toStringAsFixedNoZero(precision);
  if(unitChoiceOne == 'farenheit' && unitChoiceTwo == 'celcius')
    return ((double.parse(userInput)-32)/1.8).toStringAsFixedNoZero(precision);
  if (unitChoiceOne == 'farenheit' && unitChoiceTwo == 'kelvin')
    return (temperature('celcius','kelvin',temperature('farenheit', 'celcius', userInput)));
  if (unitChoiceOne == 'kelvin' && unitChoiceTwo == 'farenheit')
    return (temperature('celcius','farenheit',temperature('kelvin', 'celcius', userInput)));
  return "";
}

String computerConvert(String unitChoiceOne, String unitChoiceTwo, String userInput){
  if(unitChoiceOne == "binary" && unitChoiceTwo == "decimal")
    return binaryToDecimal(userInput);
  if(unitChoiceOne == "octal" && unitChoiceTwo == "decimal")
    return octalToDecimal(userInput);
  if(unitChoiceOne == "hexadecimal" && unitChoiceTwo == "decimal")
    return hexadecimalToDecimal(userInput);
  if(unitChoiceOne == "decimal" && unitChoiceTwo == "binary")
    return decimalToBinary(userInput);
  if(unitChoiceOne == "decimal" && unitChoiceTwo == "octal")
    return decimalToOctal(userInput);
  if(unitChoiceOne == "decimal" && unitChoiceTwo == "hexadecimal")
    return decimalToHexadecimal(userInput);
  if(unitChoiceOne == "binary" && unitChoiceTwo == "octal")
    return decimalToOctal(binaryToDecimal(userInput));
  if(unitChoiceOne == "octal" && unitChoiceTwo == "binary")
    return decimalToBinary(octalToDecimal(userInput));
  if(unitChoiceOne == "binary" && unitChoiceTwo == "hexadecimal")
    return decimalToHexadecimal(binaryToDecimal(userInput));
  if(unitChoiceOne == "hexadecimal" && unitChoiceTwo == "binary")
    return decimalToBinary(hexadecimalToDecimal(userInput));
  if(unitChoiceOne == "octal" && unitChoiceTwo == "hexadecimal")
    return decimalToHexadecimal(octalToDecimal(userInput));
  if(unitChoiceOne == "hexadecimal" && unitChoiceTwo == "octal")
    return decimalToOctal(hexadecimalToDecimal(userInput));
}

String binaryToDecimal(String userInput){
  double answer = 0;
  double number = double.parse(userInput);
  int i = 0;
  while(number > 0){
    answer += pow(2,i)*(number%10);
    i++;
    number /= 10;
    number = number.truncateToDouble();
  }
  return answer.toStringAsFixedNoZero(precision);
}

String octalToDecimal(String userInput){
  double answer = 0;
  double number = double.parse(userInput);
  int i = 0;
  while(number > 0){
    answer += pow(8,i)*(number%10);
    i++;
    number /= 10;
    number = number.truncateToDouble();
  }
  return answer.toStringAsFixedNoZero(precision);
}

String hexadecimalToDecimal(String userInput){
  double answer = 0;
  int i = 0;
  List digits = [];
  for(int i=userInput.length - 1; i >=0 ; i--){
    if(userInput[i] == 'A' || userInput[i] == 'a' )
      digits.add(10);
    else if(userInput[i] == 'B' || userInput[i] == 'b' )
      digits.add(11);
    else if(userInput[i] == 'C' || userInput[i] == 'c' )
      digits.add(12);
    else if(userInput[i] == 'D' || userInput[i] == 'd' )
      digits.add(13);
    else if(userInput[i] == 'E' || userInput[i] == 'e' )
      digits.add(14);
    else if(userInput[i] == 'F' || userInput[i] == 'f' )
      digits.add(15);
    else digits.add(double.parse(userInput[i]));
  }
  int number = 0;
  while(number < digits.length){
    answer += pow(16,i)*digits[number];
    i++;
    number++;
  }
  return answer.toStringAsFixedNoZero(precision);
}

String decimalToBinary(String userInput){
  double number = double.parse(userInput);
  if(number == 0)
    return '0';
  List binary = [];
  String answer = '';
  while(number>0){
    binary.add((number%2).toInt());
    number /= 2;
    number = number.truncateToDouble();
  }
  for(int i = binary.length - 1; i >= 0; i--){
    answer += binary[i].toString();
  }
  return answer.toStringAsFixedNoZero(precision);
}

String decimalToOctal(String userInput){
  double number = double.parse(userInput);
  if(number == 0)
    return '0';
  List binary = [];
  String answer = '';
  while(number>0){
    binary.add((number%8).toInt());
    number /= 8;
    number = number.truncateToDouble();
  }
  for(int i = binary.length - 1; i >= 0; i--){
    answer += binary[i].toString();
  }
  return answer.toStringAsFixedNoZero(precision);
}

String decimalToHexadecimal(String userInput){
  double number = double.parse(userInput);
  if(number == 0)
    return '0';
  List binary = [];
  int num = 0;
  String answer = '';
  while(number>0){
    num = (number % 16).toInt();
    if(num == 15)
      binary.add('F');
    else if(num == 14)
      binary.add('E');
    else if(num == 13)
      binary.add('D');
    else if(num == 12)
      binary.add('C');
    else if(num == 11)
      binary.add('B');
    else if(num == 10)
      binary.add('A');
    else binary.add(num);

    number /= 16;
    number = number.truncateToDouble();
  }
  for(int i = binary.length - 1; i >= 0; i--){
    answer += binary[i].toString();
  }
  return answer;
}

String asciiConvert(String unitChoiceOne, String unitChoiceTwo, String userInput){
  if(unitChoiceOne == "code"){
      if(int.parse(userInput) >= 127)
          return '';
      if(int.parse(userInput) < 32)
        return ' ';
      return String.fromCharCode(int.parse(userInput));
  }
  return userInput.codeUnitAt(0).toString();
}