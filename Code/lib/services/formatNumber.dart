//REMOVES TRAILING ZEROES AFTER DECIMAL FOR DOUBLE
extension Ex on double {
  String toStringAsFixedNoZero(int precision) {
    String result = double.parse(this.toStringAsFixed(precision)).toString();
    if(this.toDouble() != 0 && double.parse(result) == 0){
      while(this.toDouble()!= 0 && double.parse(result) == 0 && precision < 7){
        precision++;
        result = double.parse(this.toStringAsFixed(precision)).toString();
      }
    }
    int length = result.length;
    if(result.substring(length-2,length) == '.0'){
      return result.substring(0,length-2);
    }
    else {
      return result;
    }
  }
}

//REMOVES TRAILING ZEROES AFTER DECIMAL FOR STRING
extension Ext on String {
  String toStringAsFixedNoZero(int precision) {
    double num = double.parse(this.replaceAll(',', ''));
    String result = double.parse(num.toStringAsFixed(precision)).toString();
    if(num.toDouble() != 0 && double.parse(result) == 0){
      while(num.toDouble()!= 0 && double.parse(result) == 0 && precision < 6){
        precision++;
        print(precision);
        result = double.parse(num.toStringAsFixed(precision)).toString();
      }
    }
    int length = result.length;
    if(result.substring(length-2,length) == '.0'){
      return result.substring(0,length-2);
    }
    else {
      return result;
    }
  }
}

//RETURNS A STRING IN REVERSE
String reverseString(String number){
  String reversedNumber = "";
  int numberOfCharacters = number.length - 1;
  while(numberOfCharacters>-1){
    reversedNumber += number[numberOfCharacters];
    numberOfCharacters--;
  }
  return reversedNumber;
}

//ADDS COMMA AFTER EVERY 3 DIGITS FROM THE END
String formatNumber(dynamic number){
  double num = 0;

  //IF INPUT IS IN FORM OF STRING
  if(number is String){
    num = double.parse(number);
  }

  //IF INPUT IS IN FORM OF DOUBLE
  else{
    num = double.parse(number.toString());
  }

  //IF NUMBER IS TOO SMALL SO HAS e, OR IS NaN, OR IS COMPLEX SO HAS i, RETURN AS IS.
  if(num.toString().contains('e') || num.toString().contains('I') || num.toString().contains('i') || num.toString().contains('N') || num.toString().contains('n')){
    return num.toString();
  }

  //IF NUMBER IS 0
  if(num == 0)
    return "0";

  //SEPARATING MINUS FROM NUMBER, ADDED BACK TO NUMBER WHILE FORMING RESULT
  bool isNegative = num<0? true : false ;
  num = isNegative? -num : num;
  String formattedNumber = "";
  int n = 0;
  String decimal = num.toString().contains('.')? num.toString().split('.')[1] : '0';

  //SEPARATING DECIMAL PART, ADDED BACK TO NUMBER WHILE FORMING RESULT
  int numberI = num.truncate();

  //IF NUMBER IS LESS THAN ONE
  if(numberI == 0)
    return double.parse(decimal) == 0.0? '0' :
    isNegative? '-0.' + decimal : '0.' + decimal;

  //IF NUMBER IS GREATER THAN ONE
  while(numberI>0){
    n++;
    formattedNumber += (numberI%10).toString();
    numberI = (numberI~/10);
    if(n==3 && numberI != 0){
      formattedNumber += ",";
      n=0;
    }
  }

  String result = isNegative? '-' + reverseString(formattedNumber) : reverseString(formattedNumber);
  print("result = $result");
  return double.parse(decimal) == 0.0? result  : result + '.' + decimal;
}