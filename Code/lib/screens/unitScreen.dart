
import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/calcs/unitCalc.dart';
import 'package:dream_calc/services/globalWidgets.dart';

class unitconversion extends StatefulWidget {
  @override
  _unitconversionState createState() => _unitconversionState();
}

class _unitconversionState extends State<unitconversion> {

  bool inFocusOne = true;
  bool inFocusTwo = true;
  String answer = "answer";
  TextEditingController userInputOne = new TextEditingController();
  TextEditingController userInputTwo = new TextEditingController();
  String unitElementsValue = "LENGTH";
  List<String> unitElements = ["LENGTH","MASS","TEMPERATURE","TIME", "PLANE ANGLE","SPEED","ENERGY","AREA","VOLUME"];
  Map unitChoices = {
    'LENGTH' : ['meter','centimeter','kilometer','inch','foot','mile','millimeter','yard'],
    'MASS' : ['kilogram','gram','milligram','tonne','pound', 'ounce','us ton'],
    'TEMPERATURE' : ['celcius','kelvin','farenheit'],
    'TIME' : ['minute', 'second', 'hour', 'day'],
    'PLANE ANGLE' : ['degree','radian','gradian','minute','second'],
    'SPEED' : ['meter per second', 'kilometer per hour', 'mile per hour', 'foot per second'],
    'ENERGY' : ['joule','calorie','kilojoule','kilocalorie','watt hour','kilowatt hour', 'foot-pound'],
    'AREA' : ['sq. meter', 'sq. foot', 'sq. kilometer', 'sq. centimeter', 'sq. mile', 'sq. inch', 'sq. yard', 'cent', 'ground', 'acre', 'hectare'],
    'VOLUME' : ['cubic meter','liter','cubic centimeter','milliliter','cubic foot','cubic inch']
  };

  String plurals(String singular){

    //handling exceptions
    if(singular == 'celius' || singular == 'farenheit' || singular == 'kelvin')
      return singular;
    if(singular == 'inch')
      return 'inches';
    if(singular == 'foot')
      return 'feet';
    if(singular == 'inch')
      return 'inches';
    if(singular == 'meter per second')
      return 'meters per second';
    if(singular == 'kilometer per hour')
      return 'kilometers per hour';
    if(singular == 'mile per hour')
      return 'miles per hour';
    if(singular == 'foot per second')
      return 'feet per second';
    if(singular == 'sq. foot')
      return 'sq. feet';
    if(singular == 'sq. inch')
      return 'sq. inches';
    if(singular == 'cubic foot')
      return 'cubic feet';
    if(singular == 'cubic inch')
      return 'cubic inches';

    //standard plural form
    return singular + 's';
  }

  String unitChoiceOne='';
  String unitChoiceTwo='';

  @override
  Widget build(BuildContext context) {

    SystemChrome.setEnabledSystemUIOverlays([]);
    unitChoiceOne = unitChoiceOne==''? unitChoices[unitElementsValue][0] : unitChoiceOne;
    unitChoiceTwo = unitChoiceTwo==''? unitChoices[unitElementsValue][1] : unitChoiceTwo;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("UNIT CONVERSION"),
        //drawer: myDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                myDropDownBox(context,
                child: DropdownButton<String>(
                  value: unitElementsValue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),
                  underline: Container(
                      height: 0
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      unitElementsValue = newValue;
                      unitChoiceOne = '';
                      unitChoiceTwo = '';
                      userInputOne.text='';
                      userInputTwo.text='';
                    });
                  },
                  items: unitElements.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onTap: (){
                          setState(() {
                            inFocusOne = true;
                            inFocusTwo = false;
                            answer =  "";
                            userInputTwo.text=answer;
                          });
                        },
                        textAlign: TextAlign.right,
                        onChanged: (text){
                            userInputTwo.text = convert(unitElementsValue, unitChoiceOne, unitChoiceTwo, userInputOne.text);
                            },
                        controller: userInputOne,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        style: TextStyle(
                          color: inFocusOne ? Colors.black : Colors.green[700],
                          fontSize: 20,
                          fontWeight: inFocusOne ? FontWeight.w500 : FontWeight.bold
                        ),
                        cursorColor: Colors.black,
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: inFocusOne? 'Enter here' : 'Answer',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    myDropDownBox(context,
                      child: DropdownButton<String>(
                        value: unitChoiceOne,
                        icon: Icon(Icons.keyboard_arrow_down),
                        // iconSize: 50,
                        // elevation: 16,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),
                        underline: Container(height: 0),
                        onChanged: (String newValue) {
                          setState(() {
                            if(newValue == unitChoiceTwo){
                              unitChoiceTwo = unitChoiceOne;
                            }
                            unitChoiceOne = newValue;
                            userInputTwo.text = convert(unitElementsValue, unitChoiceOne, unitChoiceTwo, userInputOne.text);
                          });
                        },
                        items: unitChoices[unitElementsValue].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onTap: (){
                          setState(() {
                            inFocusOne = false;
                            inFocusTwo = false;
                            answer = "";
                            userInputOne.text = answer;
                          });
                        },
                        textAlign: TextAlign.right,
                        cursorColor: Colors.black,
                        onChanged: (text){
                            userInputOne.text = convert(unitElementsValue, unitChoiceTwo, unitChoiceOne, userInputTwo.text);
                            },
                        controller: userInputTwo,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        style: TextStyle(
                            color: inFocusOne ? Colors.green[700] : Colors.black,
                            fontSize: 20,
                            fontWeight: inFocusOne ? FontWeight.bold : FontWeight.w500
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9,. ]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          labelText: inFocusOne? (inFocusTwo ? 'or here' : 'Answer') : 'Enter here',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 1.5),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    myDropDownBox(context,
                    child: DropdownButton<String>(
                      value: unitChoiceTwo,
                      icon: Icon(Icons.keyboard_arrow_down),
                      // iconSize: 50,
                      elevation: 16,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                      underline: Container(
                        height: 0,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          if(newValue == unitChoiceOne){
                            unitChoiceOne = unitChoiceTwo;
                          }
                          unitChoiceTwo = newValue;
                          userInputOne.text = convert(unitElementsValue, unitChoiceTwo, unitChoiceOne, userInputTwo.text);
                        });
                      },
                      items: unitChoices[unitElementsValue].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 50,),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: FittedBox(
                      child: Text(
                        inFocusOne?
                        "1 $unitChoiceOne = ${convert(unitElementsValue, unitChoiceOne, unitChoiceTwo, '1', display: 1)} ${plurals(unitChoiceTwo)}" :
                        "1 $unitChoiceTwo = ${convert(unitElementsValue, unitChoiceTwo, unitChoiceOne, '1', display: 1)} ${plurals(unitChoiceOne)}",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
