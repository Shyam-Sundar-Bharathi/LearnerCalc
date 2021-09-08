import 'package:dream_calc/calcs/matrixCalcs/matrixFourCalc.dart';
import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget matrixTwoChoice(String A, String B, String C, String D, int fn){
  if(A == "" || B == "" || C == ""  || D == ""){
    return Text(
      "CHECK INPUT",
      style: TextStyle(
        color: Colors.red,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  double a = double.parse(A);
  double b = double.parse(B);
  double c = double.parse(C);
  double d = double.parse(D);
  Widget result;
  switch(fn){
    case 0: result = transposeTwo(a, b, c, d);
    break;
    case 1: result = detTwo(a, b, c, d);
    break;
    case 2: result = traceTwo(a, b, c, d);
    break;
    case 3: result = inverseTwo(a, b, c, d);
    break;
    case 4: result = normTwo(a, b, c, d);
    break;
  }
  return result;
}

List checkMatrix(Matrix m, int n){
  List answers = [];
  for(int i=1; i<=n; i++){
    for(int j=1; j<=n; j++){
      answers.add(m.itemAt(i, j).toDouble().toStringAsFixedNoZero(precision));
    }
  }
  return answers;
}

Widget transposeTwo(double a, double b, double c, double d){

  final matrix = Matrix([[a,b],[c,d]]);
  Matrix result = matrix.transpose();
  List answers = checkMatrix(result, 2);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  myMatrixElement(answers[0]),
                  myMatrixElement(answers[1]),
                  ]
              ),
              Row(
                children: [
                  myMatrixElement(answers[2]),
                  myMatrixElement(answers[3]),
                ],
              ),
            ],
      ),
    ],
  );
}

Widget detTwo (double a, double b, double c, double d){

  final matrix = SquareMatrix([[a,b],[c,d]]);
  return Text(
    formatNumber(matrix.determinant().toDouble().toStringAsFixedNoZero(precision)),
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );
}

Widget traceTwo (double a, double b, double c, double d){

  final matrix = Matrix([[a,b],[c,d]]);
  return Text(
    formatNumber(matrix.trace().toDouble().toStringAsFixedNoZero(precision)),
    style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
    ),
  );
}

Widget inverseTwo(double a, double b, double c, double d){

  final matrix = SquareMatrix([[a,b],[c,d]]);
  if(matrix.determinant() == 0){
    return FittedBox(
      child: Text(
        'Inverse is not possible. Determinant is zero.',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            backgroundColor: Colors.white,
        ),
      ),
    );
  }
  Matrix result = matrix.inverse();
  List answers = checkMatrix(result, 2);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Row(
              children: [
                myMatrixElement(answers[0]),
                myMatrixElement(answers[1]),
              ]
          ),
          Row(
            children: [
              myMatrixElement(answers[2]),
              myMatrixElement(answers[3]),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget normTwo(double a, double b, double c, double d){
  double norm = sqrt(pow(a,2) + pow(b,2) + pow(c,2) + pow(d,2));
  return Text(
    formatNumber(norm.toStringAsFixedNoZero(precision)),
    style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
    ),
  );
}
