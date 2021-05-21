import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';
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

Widget transposeThree(String A1, String B1, String C1, String A2, String B2, String C2, String A3, String B3, String C3, ){
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
                      answers[3],
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
                      answers[4],
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
                      answers[5],
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
                      answers[6],
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
                      answers[7],
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
                      answers[8],
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

Widget inverseThree(String A1, String B1, String C1, String A2, String B2, String C2, String A3, String B3, String C3 ){
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
                      answers[3],
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
                      answers[4],
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
                      answers[5],
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
                      answers[6],
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
                      answers[7],
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
                      answers[8],
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

Widget detThree(String A1, String B1, String C1, String A2, String B2, String C2, String A3, String B3, String C3 ){
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
    'Determinant = ${matrix.determinant().toDouble().toStringAsFixedNoZero(precision)}',
    style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
    ),
  );
}


Widget traceThree(String A1, String B1, String C1, String A2, String B2, String C2, String A3, String B3, String C3 ){
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
    'Trace = ${matrix.trace().toDouble().toStringAsFixedNoZero(precision)}',
    style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
    ),
  );
}