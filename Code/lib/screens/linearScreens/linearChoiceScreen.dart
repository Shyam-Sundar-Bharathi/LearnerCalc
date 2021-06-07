import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';
class linearChoice extends StatefulWidget {
  const linearChoice({Key key}) : super(key: key);

  @override
  _linearChoiceState createState() => _linearChoiceState();
}

class _linearChoiceState extends State<linearChoice> {

  Map choices = {
    0 : ['1 VARIABLE', '/linearOne'],
    1 : ['2 VARIABLES', '/linearTwo'],
    2 : ['3 VARIABLES', '/linearThree']
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[colorTheme][2],
      appBar: myAppBar("LINEAR EQUATION"),
      body: Center(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: choices.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery. of(context). size. width - 50,
                        child: ElevatedButton(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              choices[index][0],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize:30
                              ),
                            ),
                          ),
                          style: myButtonStyle,
                          // ButtonStyle(
                          //   backgroundColor: MaterialStateProperty.all(Colors.grey[100]),
                          //   elevation: MaterialStateProperty.all(10),
                          // ),
                          onPressed: (){
                            Navigator.pushNamed(context, choices[index][1]);
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                ],
              );
            }
        ),
      )
    );
  }
}
