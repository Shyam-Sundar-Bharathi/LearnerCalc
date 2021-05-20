import 'package:flutter/material.dart';
import 'package:dream_calc/screens/genScreen.dart';
class formulaChoice extends StatefulWidget {
  const formulaChoice({Key key}) : super(key: key);

  @override
  _formulaChoiceState createState() => _formulaChoiceState();
}

class _formulaChoiceState extends State<formulaChoice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[colorTheme][2],
      appBar: AppBar(
        backgroundColor: colors[colorTheme][9],
        title: Text(
          'FORMULAE SHEET',
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
            Container(
              width: MediaQuery. of(context). size. width - 100,
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "DIFFERENTIAL",
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
                  Navigator.pushNamed(context, '/differential');
                },
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery. of(context). size. width - 100,
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "INTEGRAL",
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
                  Navigator.pushNamed(context, '/integral');
                },
              ),
            ),
            SizedBox(height: 20,),
            Container(
              width: MediaQuery. of(context). size. width - 100,
              child: ElevatedButton(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "COMING SOON",
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
                  Navigator.pushNamed(context, '/comingSoon');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
