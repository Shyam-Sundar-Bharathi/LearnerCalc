import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class home extends StatefulWidget {
  const home({Key key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

dynamic result;
int precision = 0;
String colorTheme = '';
Map colors = {
  'BLUE' : [Colors.white, Colors.blue[100], Colors.blue[200],Colors.blue[300], Colors.blue[400], Colors.blue[500], Colors.blue[600], Colors.blue[700], Colors.blue[800], Colors.blue[900],  Colors.black, Colors.blueAccent ],
  'PINK' : [Colors.white, Colors.pink[100], Colors.pink[200],Colors.pink[300], Colors.pink[400], Colors.pink[500], Colors.pink[600], Colors.pink[700], Colors.pink[800], Colors.pink[900], Colors.black, Colors.pinkAccent ],
  'BLACK' : [Colors.white, Colors.grey[100], Colors.grey[200],Colors.grey[300], Colors.grey[400], Colors.grey[500], Colors.grey[600], Colors.grey[700], Colors.grey[800], Colors.grey[900], Colors.black, Colors.blueGrey ],
  'GREEN' : [Colors.white, Colors.green[100], Colors.green[200],Colors.green[300], Colors.green[400], Colors.green[500], Colors.green[600], Colors.green[700], Colors.green[800], Colors.green[900], Colors.black, Colors.greenAccent ],
  'YELLOW' : [Colors.white, Colors.yellow[100], Colors.yellow[200],Colors.yellow[300], Colors.yellow[400], Colors.yellow[500], Colors.yellow[600], Colors.yellow[700], Colors.yellow[800], Colors.yellow[900], Colors.black, Colors.yellowAccent ],
  'PURPLE' : [Colors.white, Colors.purple[100], Colors.purple[200],Colors.purple[300], Colors.purple[400], Colors.purple[500], Colors.purple[600], Colors.purple[700], Colors.purple[800], Colors.purple[900], Colors.black, Colors.purpleAccent],
  'RED' : [Colors.white, Colors.red[100], Colors.red[200],Colors.red[300], Colors.red[400], Colors.red[500], Colors.red[600], Colors.red[700], Colors.red[800], Colors.red[900], Colors.black, Colors.redAccent],
};

class _homeState extends State<home> {


  save() async {
    final prefs = await SharedPreferences.getInstance();
    final precisionKey = 'precision';
    final precisionValue = precision;
    prefs.setInt(precisionKey, precisionValue);
    final colorKey = 'colorTheme';
    final colorValue = colorTheme;
    prefs.setString(colorKey, colorValue);
    print('saved $precision and $colorTheme');
  }

  Map routes = {
    0 : ['LCM HCF','/lcmhcf'],
    1 : ['CENTRAL\nTENDENCY', '/centTend'],
    2 : ['AREA', '/area'],
    3 : ['VOLUME', '/volume'],
    4 : ['UNIT\nCONVERSION', '/unitConversion'],
    5 : ['PERCENTAGE', '/percentage'],
    6 : ['QUADRATIC\nEQUATION', '/quadratic'],
    7 : ['CUBIC\nEQUATION', '/cubic'],
    8 : ['TRIGONOMETRY', '/trigonometry'],
    9 : ['VECTOR', '/vector'],
    10 : ['MATRIX','/matrixChoice'],
    11 : ['COMPLEX\nNUMBERS', '/complex'],
    12 : ['LINEAR\nEQUATIONS', '/linearChoice'],
    13 : ['CURRENCY\nCONVERSION', '/currency'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[colorTheme][5],
      appBar: AppBar(
        backgroundColor: colors[colorTheme][9],
        title: Text(
          "DREAM CALCULATOR",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            color: colors[colorTheme][1]
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
            Icons.settings,
          color: Colors.black,
        ),
        backgroundColor: colors[colorTheme][2],
        onPressed: () async {
          result = await Navigator.pushNamed(context, '/settings');
          setState(() {
            precision = result['precision'];
            colorTheme = result['colorTheme'];
            save();
          });
        },
      ),
      //drawer: myDrawer(),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: GridView.builder(
                padding: EdgeInsets.all(0),
                itemCount: routes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0,
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index){

                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 5,
                    child: Card(
                      color: Colors.grey,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.grey[100]),
                            elevation: MaterialStateProperty.all(15)
                          ),
                          child: FittedBox(
                            child: Text(
                                routes[index][0],
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black
                              ),
                            ),
                          ),
                          onPressed: (){Navigator.pushNamed(context, routes[index][1]);},
                        ),
                    ),
                  );
                  }
              ),
            ),
          ),
        ],
      ),
    );
  }
}
