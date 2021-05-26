
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

String reverseString(String number){
  String reversedNumber = "";
  int numberOfCharacters = number.length - 1;
  while(numberOfCharacters>-1){
    reversedNumber += number[numberOfCharacters];
    numberOfCharacters--;
  }
  return reversedNumber;
}

String formatNumber(dynamic number, {bool isCurrency = false}){
  double num = 0;
  if(number is String){
    num = double.parse(number);
  }
  else{
    num = double.parse(number.toString());
  }
  if(num.toString().contains('e') || num.toString().contains('I') || num.toString().contains('i') || num.toString().contains('N') || num.toString().contains('n')){
    return num.toString();
  }
  if(num == 0)
    return "0";
  bool isNegative = num<0? true : false ;
  num = isNegative? -num : num;
  String formattedNumber = "";
  int n=0;
  String decimal;
  if(isCurrency){

    if(num.toString().contains('.')) {
      decimal = (num.toString().split('.')[1]);
      if(decimal.length>=2)
        decimal = decimal.substring(0,2);
      else if(decimal.length>=1)
        decimal = decimal.substring(0,1);
    }
    else
      decimal = '00';
  }
  else
    decimal = num.toString().contains('.')? num.toString().split('.')[1] : '0';


  int numberI = num.truncate();
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