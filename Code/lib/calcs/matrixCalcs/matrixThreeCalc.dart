import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dream_calc/calcs/matrixCalcs/matrixFourCalc.dart';


Widget matrixThreeChoice(String A1, String B1, String C1, String A2, String B2, String C2, String A3, String B3, String C3, int fn){
  Widget result;
  switch(fn){
    case 0: result = transposeThree(A1, B1, C1, A2, B2, C2, A3, B3, C3);
    break;
    case 1: result = detThree(A1, B1, C1, A2, B2, C2, A3, B3, C3);
    break;
    case 2: result = traceThree(A1, B1, C1, A2, B2, C2, A3, B3, C3);
    break;
    case 3: result = inverseThree(A1, B1, C1, A2, B2, C2, A3, B3, C3);
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

Widget transposeThree(String A1, String B1, String C1, String A2, String B2, String C2, String A3, String B3, String C3, ){
  if(A1 == "" || B1 == "" || C1 == "" || A2 == "" || B2 == "" || C2 == "" || A3 == "" || B3 == "" || C3 == "" ){
    return Text(
      "CHECK INPUT",
      style: TextStyle(
        color: Colors.red,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  double a1 = double.parse(A1);
  double b1 = double.parse(B1);
  double c1 = double.parse(C1);
  double a2 = double.parse(A2);
  double b2 = double.parse(B2);
  double c2 = double.parse(C2);
  double a3 = double.parse(A3);
  double b3 = double.parse(B3);
  double c3 = double.parse(C3);
  final matrix = Matrix([[a1,b1,c1],[a2,b2,c2], [a3,b3,c3]]);
  Matrix result = matrix.transpose();
  List answers = checkMatrix(result, 3);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Row(
            children: [
              myMatrixElement(answers[0]),
              myMatrixElement(answers[1]),
              myMatrixElement(answers[2]),
            ],
          ),
          Row(
            children: [
              myMatrixElement(answers[3]),
              myMatrixElement(answers[4]),
              myMatrixElement(answers[5]),
            ],
          ),

          Row(
            children: [
              myMatrixElement(answers[6]),
              myMatrixElement(answers[7]),
              myMatrixElement(answers[8]),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget inverseThree(String A1, String B1, String C1, String A2, String B2, String C2, String A3, String B3, String C3 ){
  if(A1 == "" || B1 == "" || C1 == "" || A2 == "" || B2 == "" || C2 == "" || A3 == "" || B3 == "" || C3 == "" ){
    return Text(
      "CHECK INPUT",
      style: TextStyle(
        color: Colors.red,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  double a1 = double.parse(A1);
  double b1 = double.parse(B1);
  double c1 = double.parse(C1);
  double a2 = double.parse(A2);
  double b2 = double.parse(B2);
  double c2 = double.parse(C2);
  double a3 = double.parse(A3);
  double b3 = double.parse(B3);
  double c3 = double.parse(C3);
  final matrix = SquareMatrix([[a1,b1,c1],[a2,b2,c2], [a3,b3,c3]]);
  if(matrix.determinant() == 0){
    return FittedBox(
      child: Text(
        'Inverse is not possible. Determinant is zero.',
        style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold
        ),
      ),
    );
  }
  Matrix result = matrix.inverse();
  List answers = checkMatrix(result, 3);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        children: [
          Row(
            children: [
              myMatrixElement(answers[0]),
              myMatrixElement(answers[1]),
              myMatrixElement(answers[2]),
            ],
          ),
          Row(
            children: [
              myMatrixElement(answers[3]),
              myMatrixElement(answers[4]),
              myMatrixElement(answers[5]),
            ],
          ),

          Row(
            children: [
              myMatrixElement(answers[6]),
              myMatrixElement(answers[7]),
              myMatrixElement(answers[8]),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget detThree(String A1, String B1, String C1, String A2, String B2, String C2, String A3, String B3, String C3 ){
  if(A1 == "" || B1 == "" || C1 == "" || A2 == "" || B2 == "" || C2 == "" || A3 == "" || B3 == "" || C3 == "" ){
    return Text(
      "CHECK INPUT",
      style: TextStyle(
        color: Colors.red,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  double a1 = double.parse(A1);
  double b1 = double.parse(B1);
  double c1 = double.parse(C1);
  double a2 = double.parse(A2);
  double b2 = double.parse(B2);
  double c2 = double.parse(C2);
  double a3 = double.parse(A3);
  double b3 = double.parse(B3);
  double c3 = double.parse(C3);
  final matrix = SquareMatrix([[a1,b1,c1],[a2,b2,c2], [a3,b3,c3]]);
  return Text(
    formatNumber(matrix.determinant().toDouble().toStringAsFixedNoZero(precision)),
    style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
    ),
  );
}


Widget traceThree(String A1, String B1, String C1, String A2, String B2, String C2, String A3, String B3, String C3 ){
  if(A1 == "" || B1 == "" || C1 == "" || A2 == "" || B2 == "" || C2 == "" || A3 == "" || B3 == "" || C3 == "" ){
    return Text(
      "CHECK INPUT",
      style: TextStyle(
        color: Colors.red,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
  double a1 = double.parse(A1);
  double b1 = double.parse(B1);
  double c1 = double.parse(C1);
  double a2 = double.parse(A2);
  double b2 = double.parse(B2);
  double c2 = double.parse(C2);
  double a3 = double.parse(A3);
  double b3 = double.parse(B3);
  double c3 = double.parse(C3);
  final matrix = SquareMatrix([[a1,b1,c1],[a2,b2,c2], [a3,b3,c3]]);
  return Text(
      formatNumber(matrix.trace().toDouble().toStringAsFixedNoZero(precision)),
    style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
    ),
  );
}