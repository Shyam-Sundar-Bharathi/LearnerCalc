import 'package:flutter/material.dart';
import 'package:dream_calc/screens/genScreen.dart';
class matrixChoice extends StatefulWidget {
  const matrixChoice({Key key}) : super(key: key);

  @override
  _matrixChoiceState createState() => _matrixChoiceState();
}

class _matrixChoiceState extends State<matrixChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[colorTheme][2],
      appBar: AppBar(
        backgroundColor: colors[colorTheme][9],
        title: Text(
          'MATRIX',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: colors[colorTheme][1],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "2 x 2",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize:30
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[100]),
                elevation: MaterialStateProperty.all(10),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/matrixTwo');
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "3 x 3",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize:30
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[100]),
                elevation: MaterialStateProperty.all(10),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/matrixThree');
              },
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "4 x 4",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontSize:30
                  ),
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[100]),
                elevation: MaterialStateProperty.all(10),
              ),
              onPressed: (){
                Navigator.pushNamed(context, '/matrixFour');
              },
            ),
          ],
        ),
      ),
    );
  }
}
