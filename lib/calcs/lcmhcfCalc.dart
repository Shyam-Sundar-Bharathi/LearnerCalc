import 'dart:math';

import 'package:dream_calc/services/formatNumber.dart';
import 'package:extended_math/extended_math.dart';

double gcd(double a, double b) {
  if (b == 0)
    return a;
  return gcd(b, a % b);
}

String primeFactors(String userInput){
  if(userInput == "")
    return '';
  String factor = '';
  double number = double.parse(userInput);
  while (number % 2 == 0)
  {
    factor += '2, ';
    number/=2;
  }
  for (int i = 3; i <= sqrt(number); i += 2)
  {
    while (number % i == 0)
    {
      factor += '$i, ';
      number/=i;;
    }
  }

  if (number > 2)
    factor += '${number.toInt()}';

  if(factor.endsWith(', '))
    factor = factor.substring(0,factor.length-2);

  return factor;

}

String lcm(String userInput){
  if(userInput == "")
    return '';
  var sArray = userInput.split(",");
  var length = sArray.length;
  var iArray = [];
  double lcm;
  int iter= 0;
  for(iter=0; iter<sArray.length; iter++)
    iArray.add(double.parse(sArray[iter]));
  iArray.sort();
  lcm = iArray[0];
  for(iter = 1; iter<iArray.length; iter++){
    lcm = (((iArray[iter] * lcm)) /
        (gcd(iArray[iter], lcm)));
  }
  return formatNumber(lcm);
}


String hcf (String userInput) {
  if(userInput == "")
    return '';
  var sArray = userInput.split(",");
  var length = sArray.length;
  var iArray = [];
  var hcf;
  var potDivisers = [1];
  var hcf_found = false;
  int iter= 0;
  for(iter=0; iter<sArray.length; iter++)
  {
    iArray.add(int.parse(sArray[iter]));
  }
  iArray.sort();
  hcf = iArray[0];
  for(int i=2; i <= hcf/2 ; i++)
    {
      if(hcf % i == 0)
        potDivisers.add(i);
    }
  potDivisers.add(hcf);
  iter = potDivisers.length-1;
  while(!hcf_found)
    {
      hcf = potDivisers[iter];
      for(int i=1; i<length; i++)
          {
            if(iArray[i] % hcf != 0)
              {
                hcf=potDivisers[iter-1];
              }
          }
      iter--;
      if(hcf == potDivisers[iter+1])
        hcf_found = true;
    }
    return hcf.toString();
}

String isPrime(String userInput){
  if(userInput == "")
    return '';
  final c = Integer(int.parse(userInput));
  return c.isPrime() ? '$userInput is a prime number' : '$userInput is not a prime number';
}