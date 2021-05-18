import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/genScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
List checkMatrix(Matrix m, int n){
  List answers = [];
  for(int i=1; i<=n; i++){
    for(int j=1; j<=n; j++){
      answers.add(m.itemAt(i, j).toDouble().toStringAsFixedNoZero(precision));
    }
  }
  return answers;
}

Widget transposeTwo(String A, String B, String C, String D){
  double a = double.parse(A);
  double b = double.parse(B);
  double c = double.parse(C);
  double d = double.parse(D);
  final matrix = Matrix([[a,b],[c,d]]);
  Matrix result = matrix.transpose();
  List answers = checkMatrix(result, 2);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: FittedBox(
          child: Text(
            'Transpose = ',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
      Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                      answers[0],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                        answers[1],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                        answers[2],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                        answers[3],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget detTwo (String A, String B, String C, String D){
  double a = double.parse(A);
  double b = double.parse(B);
  double c = double.parse(C);
  double d = double.parse(D);
  final matrix = SquareMatrix([[a,b],[c,d]]);
  return Text(
    'Determinant = ${matrix.determinant().toDouble().toStringAsFixedNoZero(precision)}',
    style: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold
    ),
  );
}

Widget traceTwo (String A, String B, String C, String D){
  double a = double.parse(A);
  double b = double.parse(B);
  double c = double.parse(C);
  double d = double.parse(D);
  final matrix = Matrix([[a,b],[c,d]]);
  return Text(
    'Trace = ${matrix.trace().toDouble().toStringAsFixedNoZero(precision)}',
    style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
    ),
  );
}

Widget inverseTwo(String A, String B, String C, String D){
  double a = double.parse(A);
  double b = double.parse(B);
  double c = double.parse(C);
  double d = double.parse(D);
  final matrix = SquareMatrix([[a,b],[c,d]]);
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
  List answers = checkMatrix(result, 2);
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: FittedBox(
          child: Text(
            'Inverse = ',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
      Column(
        children: [
          Row(
            children: [
              Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                        answers[0],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                        answers[1],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                        answers[2],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: Center(
                  child: FittedBox(
                    child: Text(
                        answers[3],
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

