import 'package:dream_calc/screens/matrixScreens/choiceScreen.dart';
import 'package:extended_math/extended_math.dart';
import 'package:dream_calc/services/formatNumber.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget matrixFourChoice(String A1, String B1, String C1, String D1, String A2, String B2, String C2, String D2, String A3, String B3, String C3, String D3, String A4, String B4, String C4, String D4, int fn){
  Widget result;
  switch(fn){
    case 0: result = transposeFour(A1, B1, C1, D1, A2, B2, C2, D2, A3, B3, C3, D3, A4, B4, C4, D4);
    break;
    case 1: result = detFour(A1, B1, C1, D1, A2, B2, C2, D2, A3, B3, C3, D3, A4, B4, C4, D4);
    break;
    case 2: result = traceFour(A1, B1, C1, D1, A2, B2, C2, D2, A3, B3, C3, D3, A4, B4, C4, D4);
    break;
    case 3: result = inverseFour(A1, B1, C1, D1, A2, B2, C2, D2, A3, B3, C3, D3, A4, B4, C4, D4);
    break;
  }
  return result;
}

Widget myMatrixElement(String text){
  return Container(
    width: (screenWidth-100)/4,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(),
    ),
    child: Padding(
      padding: EdgeInsets.all(5),
      child: Center(
        child: FittedBox(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}

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
  if(A1 == "" || B1 == "" || C1 == "" || D1 == ""|| A2 == "" || B2 == "" || C2 == "" || D2 == ""|| A3 == "" || B3 == "" || C3 == "" || D3 == "" || A4 == "" || B4 == "" || C4 == "" || D4 == ""){
    return Text(
      "CHECK INPUT",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
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
      Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              myMatrixElement(answers[0]),
              myMatrixElement(answers[1]),
              myMatrixElement(answers[2]),
              myMatrixElement(answers[3]),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              myMatrixElement(answers[4]),
              myMatrixElement(answers[5]),
              myMatrixElement(answers[6]),
              myMatrixElement(answers[7]),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              myMatrixElement(answers[8]),
              myMatrixElement(answers[9]),
              myMatrixElement(answers[10]),
              myMatrixElement(answers[11]),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              myMatrixElement(answers[12]),
              myMatrixElement(answers[13]),
              myMatrixElement(answers[14]),
              myMatrixElement(answers[15]),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget inverseFour(String A1, String B1, String C1, String D1, String A2, String B2, String C2, String D2, String A3, String B3, String C3, String D3, String A4, String B4, String C4, String D4 ){
  if(A1 == "" || B1 == "" || C1 == "" || D1 == ""|| A2 == "" || B2 == "" || C2 == "" || D2 == ""|| A3 == "" || B3 == "" || C3 == "" || D3 == "" || A4 == "" || B4 == "" || C4 == "" || D4 == ""){
    return Text(
      "CHECK INPUT",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
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
      Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              myMatrixElement(answers[0]),
              myMatrixElement(answers[1]),
              myMatrixElement(answers[2]),
              myMatrixElement(answers[3]),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              myMatrixElement(answers[4]),
              myMatrixElement(answers[5]),
              myMatrixElement(answers[6]),
              myMatrixElement(answers[7]),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              myMatrixElement(answers[8]),
              myMatrixElement(answers[9]),
              myMatrixElement(answers[10]),
              myMatrixElement(answers[11]),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              myMatrixElement(answers[12]),
              myMatrixElement(answers[13]),
              myMatrixElement(answers[14]),
              myMatrixElement(answers[15]),
            ],
          ),
        ],
      ),
    ],
  );
}

Widget detFour(String A1, String B1, String C1, String D1, String A2, String B2, String C2, String D2, String A3, String B3, String C3, String D3, String A4, String B4, String C4, String D4 ){
  if(A1 == "" || B1 == "" || C1 == "" || D1 == ""|| A2 == "" || B2 == "" || C2 == "" || D2 == ""|| A3 == "" || B3 == "" || C3 == "" || D3 == "" || A4 == "" || B4 == "" || C4 == "" || D4 == ""){
    return Text(
      "CHECK INPUT",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
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
      formatNumber(matrix.determinant().toDouble().toStringAsFixedNoZero(precision)),
    style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
    ),
  );
}


Widget traceFour(String A1, String B1, String C1, String D1, String A2, String B2, String C2, String D2, String A3, String B3, String C3, String D3, String A4, String B4, String C4, String D4 ){
  if(A1 == "" || B1 == "" || C1 == "" || D1 == ""|| A2 == "" || B2 == "" || C2 == "" || D2 == ""|| A3 == "" || B3 == "" || C3 == "" || D3 == "" || A4 == "" || B4 == "" || C4 == "" || D4 == ""){
    return Text(
      "CHECK INPUT",
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
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
      formatNumber(matrix.trace().toDouble().toStringAsFixedNoZero(precision)),
    style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold
    ),
  );
}