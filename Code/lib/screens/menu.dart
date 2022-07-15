import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:keyboard_visibility/keyboard_visibility.dart';

class home extends StatefulWidget {
  const home({Key key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

dynamic result;
int precision = 0;
String colorTheme = '';
String userName = '';
int numberOfTilesFound = 0;
bool showSearchBar = true;

Map colors = {
  'SKY BLUE' : [Colors.white, Colors.blue[100], Colors.blue[200],Colors.blue[300], Colors.blue[400], Colors.blue[500], Colors.blue[600], Colors.blue[700], Colors.blue[800], Colors.blue[900],  Colors.black, Colors.blueAccent ],
  'ROSE' : [Colors.white, Colors.pink[100], Colors.pink[200],Colors.pink[300], Colors.pink[400], Colors.pink[500], Colors.pink[600], Colors.pink[700], Colors.pink[800], Colors.pink[900], Colors.black, Colors.pinkAccent ],
  'GRAYSCALE' : [Colors.white, Colors.grey[100], Colors.grey[200],Colors.grey[300], Colors.grey[400], Colors.grey[500], Colors.grey[600], Colors.grey[700], Colors.grey[800], Colors.grey[900], Colors.black, Colors.blueGrey ],
  'EMERALD' : [Colors.white, Colors.green[100], Colors.green[200],Colors.green[300], Colors.green[400], Colors.green[500], Colors.green[600], Colors.green[700], Colors.green[800], Colors.green[900], Colors.black, Colors.green[800]],
  'SAFFRON' : [Colors.white, Colors.deepOrange[100], Colors.deepOrange[200],Colors.deepOrange[300], Colors.deepOrange[400], Colors.deepOrange[500], Colors.deepOrange[600], Colors.deepOrange[700], Colors.deepOrange[800], Colors.deepOrange[900], Colors.black, Colors.deepOrange],
  'LAVENDER' : [Colors.white, Colors.purple[100], Colors.purple[200],Colors.purple[300], Colors.purple[400], Colors.purple[500], Colors.purple[600], Colors.purple[700], Colors.purple[800], Colors.purple[900], Colors.black, Colors.purpleAccent],
  'CHERRY' : [Colors.white, Colors.red[100], Colors.red[200],Colors.red[300], Colors.red[400], Colors.red[500], Colors.red[600], Colors.red[700], Colors.red[800], Colors.red[900], Colors.black, Colors.redAccent],
  'BLUEGRAY' : [Colors.white, Colors.blueGrey[100], Colors.blueGrey[200],Colors.blueGrey[300], Colors.blueGrey[400], Colors.blueGrey[500], Colors.blueGrey[600], Colors.blueGrey[700], Colors.blueGrey[800], Colors.blueGrey[900], Colors.black, Colors.blueGrey[700]],
  'CHOCOLATE' : [Colors.white, Colors.brown[100], Colors.brown[200],Colors.brown[300], Colors.brown[400], Colors.brown[500], Colors.brown[600], Colors.brown[700], Colors.brown[800], Colors.brown[900], Colors.black, Colors.brown],
  'TURQUOISE' : [Colors.white, Colors.teal[100], Colors.teal[200],Colors.teal[300], Colors.teal[400], Colors.teal[500], Colors.teal[600], Colors.teal[700], Colors.teal[800], Colors.teal[900], Colors.black, Colors.teal],
};

class _homeState extends State<home> {

  Map displayRoutes = {};
  TextEditingController searchCont = new TextEditingController();
  List<String> tileNames = ['general calculator', 'unit conversion', 'formulae sheet', 'linear equations', 'quadratic equation','cubic equation','vectors','complex numbers','matrix','trigonometry','statistics','percentage','straight lines', 'circle', 'progressions','number theory', 'area', 'volume', 'permutation combination', 'boolean algebra', 'set theory'];
  void search(String Text){
    String text = Text.toLowerCase();
    setState(() {
      displayRoutes = {};
      numberOfTilesFound = 0;
    });
    if(text == ""){
      setState(() {
        displayRoutes = routes;
      });
      return;
    }
    for(int i = 0; i < tileNames.length; i++){
      if(tileNames[i].contains(text)){
        setState(() {
          displayRoutes[numberOfTilesFound] = [routes[i][0], routes[i][1]];
          numberOfTilesFound++;
        });
      }
    }
  }

  saveToDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final precisionKey = 'precision';
    final precisionValue = precision;
    prefs.setInt(precisionKey, precisionValue);
    final colorKey = 'colorTheme';
    final colorValue = colorTheme;
    prefs.setString(colorKey, colorValue);
    final nameKey = 'userName';
    final nameValue = userName;
    prefs.setString(nameKey, nameValue);
    final showSearchBarKey = 'showSearchBar';
    final showSearchBarValue = showSearchBar;
    prefs.setBool(showSearchBarKey, showSearchBarValue);
  }

  Map routes = {
    0 : ['   GENERAL\nCALCULATOR', '/genCalc'],
    1 : ['        UNIT\nCONVERSION', '/unitConversion'],
    2 : ['FORMULAE\n    SHEET', '/formulaChoice'],
    3 : ['AREA', '/area'],
    4 : ['VOLUME', '/volume'],
    5 : ['STATISTICS', '/centTend'],
    6 : ['NUMBER\n THEORY','/lcmhcf'],
    7 : ['   SET\nTHEORY', '/setTheory'],
    8 : ['TRIGONOMETRY', '/trigonometry'],
    9 : ['   LINEAR\nEQUATIONS', '/linearChoice'],
    10 : ['QUADRATIC\n EQUATIONS', '/quadraticChoice'],
    11 : ['   CUBIC\nEQUATIONS', '/cubicChoice'],
    12 : ['VECTORS', '/vector'],
    13 : ['COMPLEX\nNUMBERS', '/complex'],
    14 : ['MATRIX','/matrixChoice'],
    15 : ['STRAIGHT\n    LINES','/straightLineChoice'],
    16 : ['CIRCLE', '/circleChoice'],
    17 : ['PROGRESSIONS','/progressionsChoice'],
    18 : ['PERMUTATION\nCOMBINATION','/pnc'],
    19 : ['BOOLEAN\nALGEBRA', '/booleanAlgebra'],
    20 : ['PERCENTAGE', '/percentage']
  };

  void initState(){
    setState(() {
      displayRoutes = routes;
    });
    // KeyboardVisibilityNotification().addNewListener(
    //   onChange: (bool visible) {
    //     if(!visible){
    //       FocusScope.of(context).unfocus();
    //     }
    //   },
    // );
  }

  // Future<bool> _onWillPop() {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: Text('Are you sure?'),
  //       content: Text('Do you want to exit?'),
  //       actions: <Widget>[
  //         TextButton(
  //           onPressed: () => Navigator.of(context).pop(false),
  //           child: Text('No'),
  //         ),
  //         TextButton(
  //           onPressed: () => exit(0),
  //           child: Text("Yes"),
  //         ),
  //       ],
  //     ),
  //   ) ??
  //       false;
  // }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      backgroundColor: colors[colorTheme][1],
      appBar: AppBar(
        backgroundColor: colors[colorTheme][9],
        title: FittedBox(
          child: GestureDetector(
            onTap: (){
              setState(() {
                searchCont.text = "";
              });
              search("");
              FocusScope.of(context).unfocus();
              }
              ,
            //onLongPress: _onWillPop,
            child: Text(
              userName == "" ? "LearnerCalc" : "LEARNER $userName",
              style: TextStyle(
                fontFamily: "Times",
                fontSize: 25,
                fontWeight: FontWeight.w900,
                color: Colors.white
              ),
            ),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.settings,
            color: colors[colorTheme][1],
        ),
          onPressed: () async {
            result = await Navigator.pushNamed(context, '/settings');
            setState(() {
              precision = result['precision'];
              colorTheme = result['colorTheme'];
              userName = result['userName'];
              showSearchBar = result['showSearchBar'];
              saveToDevice();
            });
          },
        ),
      ),
      body: Column(
        children: [
          showSearchBar ? Container(
            padding: EdgeInsets.fromLTRB(5, 5, 5, 2),
            child: TextField(
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500
              ),
              cursorColor: colors[colorTheme][1],
              controller: searchCont,
              onChanged: search,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                fillColor: colors[colorTheme][9],
                filled: true,
                prefixIcon: IconButton(
                    icon: Icon(
                        Icons.search,
                      color: Colors.white,
                    ),
                  onPressed: (){FocusScope.of(context).unfocus();},
                ),
                suffixText: '$numberOfTilesFound found',
                suffixStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 3, color: colors[colorTheme][9]),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 5, color: colors[colorTheme][9]),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ) : Container(),
          Expanded(
            child: Container(
              child: GridView.builder(
                padding: EdgeInsets.all(0),
                itemCount: displayRoutes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 0,
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))
                                ),
                            ),
                          backgroundColor: MaterialStateProperty.all(colors[colorTheme][9]),
                          elevation: MaterialStateProperty.all(15)
                        ),
                        child: FittedBox(
                          child: Text(
                              displayRoutes[index][0],
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: (){Navigator.pushNamed(context, displayRoutes[index][1]);},
                      ),
                    ),
                  );
                  }
              ),
            ),
          ),
          Container(
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
