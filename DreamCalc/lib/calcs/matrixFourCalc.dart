import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/genScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List checkMatrix(Matrix m){
  List answers = [];
  int n=4;
  for(int i=1; i<=n; i++){
    for(int j=1; j<=n; j++){
      answers.add(m.itemAt(i, j).toDouble().toStringAsFixedNoZero(precision));
    }
  }
  return answers;
}

Widget transposeFour(String A1, String B1, String C1, String D1, String A2, String B2, String C2, String D2, String A3, String B3, String C3, String D3, String A4, String B4, String C4, String D4 ){
  double a1 = double.parse(A1);
  double b1 = double.parse(B1);
  double c1 = double.parse(C1);
  double d1 = double.parse(D1);
  double a2 = double.parse(A2);
  double b2 = double.parse(B2);
  double c2 = double.parse(C2);
  double d2 = double.parse(D2);
  double a3 = double.parse(A3);
  double b3 = double.parse(B3);
  double c3 = double.parse(C3);
  double d3 = double.parse(D3);
  double a4 = double.parse(A4);
  double b4 = double.parse(B4);
  double c4 = double.parse(C4);
  double d4 = double.parse(D4);
  final matrix = Matrix([[a1,b1,c1,d1],[a2,b2,c2,d2], [a3,b3,c3,d3],[a4,b4,c4,d4]]);
  Matrix result = matrix.transpose();
  List answers = checkMatrix(result);
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
                      answers[8],
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
                      answers[9],
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
                      answers[10],
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
                      answers[11],
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
                      answers[12],
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
                      answers[13],
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
                      answers[14],
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
                      answers[15],
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

Widget inverseFour(String A1, String B1, String C1, String D1, String A2, String B2, String C2, String D2, String A3, String B3, String C3, String D3, String A4, String B4, String C4, String D4 ){
  double a1 = double.parse(A1);
  double b1 = double.parse(B1);
  double c1 = double.parse(C1);
  double d1 = double.parse(D1);
  double a2 = double.parse(A2);
  double b2 = double.parse(B2);
  double c2 = double.parse(C2);
  double d2 = double.parse(D2);
  double a3 = double.parse(A3);
  double b3 = double.parse(B3);
  double c3 = double.parse(C3);
  double d3 = double.parse(D3);
  double a4 = double.parse(A4);
  double b4 = double.parse(B4);
  double c4 = double.parse(C4);
  double d4 = double.parse(D4);
  final matrix = SquareMatrix([[a1,b1,c1,d1],[a2,b2,c2,d2], [a3,b3,c3,d3],[a4,b4,c4,d4]]);
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
  List answers = checkMatrix(result);
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
                      answers[8],
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
                      answers[9],
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
                      answers[10],
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
                      answers[11],
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
                      answers[12],
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
                      answers[13],
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
                      answers[14],
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
                      answers[15],
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

Widget detFour(String A1, String B1, String C1, String D1, String A2, String B2, String C2, String D2, String A3, String B3, String C3, String D3, String A4, String B4, String C4, String D4 ){
  double a1 = double.parse(A1);
  double b1 = double.parse(B1);
  double c1 = double.parse(C1);
  double d1 = double.parse(D1);
  double a2 = double.parse(A2);
  double b2 = double.parse(B2);
  double c2 = double.parse(C2);
  double d2 = double.parse(D2);
  double a3 = double.parse(A3);
  double b3 = double.parse(B3);
  double c3 = double.parse(C3);
  double d3 = double.parse(D3);
  double a4 = double.parse(A4);
  double b4 = double.parse(B4);
  double c4 = double.parse(C4);
  double d4 = double.parse(D4);
  final matrix = SquareMatrix([[a1,b1,c1,d1],[a2,b2,c2,d2], [a3,b3,c3,d3],[a4,b4,c4,d4]]);
  return Text(
    'Determinant = ${matrix.determinant().toDouble().toStringAsFixedNoZero(precision)}',
    style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
    ),
  );
}


Widget traceFour(String A1, String B1, String C1, String D1, String A2, String B2, String C2, String D2, String A3, String B3, String C3, String D3, String A4, String B4, String C4, String D4 ){
  double a1 = double.parse(A1);
  double b1 = double.parse(B1);
  double c1 = double.parse(C1);
  double d1 = double.parse(D1);
  double a2 = double.parse(A2);
  double b2 = double.parse(B2);
  double c2 = double.parse(C2);
  double d2 = double.parse(D2);
  double a3 = double.parse(A3);
  double b3 = double.parse(B3);
  double c3 = double.parse(C3);
  double d3 = double.parse(D3);
  double a4 = double.parse(A4);
  double b4 = double.parse(B4);
  double c4 = double.parse(C4);
  double d4 = double.parse(D4);
  final matrix = SquareMatrix([[a1,b1,c1,d1],[a2,b2,c2,d2], [a3,b3,c3,d3],[a4,b4,c4,d4]]);
  return Text(
    'Trace = ${matrix.trace().toDouble().toStringAsFixedNoZero(precision)}',
    style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
    ),
  );
}