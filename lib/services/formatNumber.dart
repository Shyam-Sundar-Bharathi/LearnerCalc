
extension Ex on double {
  String toStringAsFixedNoZero(int precision) {
    String result = double.parse(this.toStringAsFixed(precision)).toString();
    if(this.toDouble() != 0 && double.parse(result) == 0){
      while(this.toDouble()!= 0 && double.parse(result) == 0 && precision < 6){
        precision++;
        print(precision);
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

String reverseString(String number){
  String reversedNumber = "";
  int numberOfCharacters = number.length - 1;
  while(numberOfCharacters>-1){
    reversedNumber += number[numberOfCharacters];
    numberOfCharacters--;
  }
  return reversedNumber;
}

String formatNumber(double number, {bool isCurrency = false}){
  if(number.toString().contains('e')){
    return number.toString();
  }
  if(number == 0)
    return "0";
  bool isNegative = number<0? true : false ;
  number = isNegative? -number : number;
  String formattedNumber = "";
  int n=0;
  String decimal;
  if(isCurrency){

    if(number.toString().contains('.')) {
      decimal = (number.toString().split('.')[1]);
      if(decimal.length>=2)
        decimal = decimal.substring(0,2);
      else if(decimal.length>=1)
        decimal = decimal.substring(0,1);
    }
    else
      decimal = '00';
  }
  else
    decimal = number.toString().contains('.')? number.toString().split('.')[1] : '0';


  int numberI = number.truncate();
  if(numberI == 0)
    return double.parse(decimal) == 0.0? '0' : '0.' + decimal;
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
  return double.parse(decimal) == 0.0? result  : result + '.' + decimal;
}