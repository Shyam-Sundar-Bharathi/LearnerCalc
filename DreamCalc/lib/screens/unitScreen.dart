
import 'package:dream_calc/screens/genScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dream_calc/calcs/unitCalc.dart';

class unitconversion extends StatefulWidget {
  @override
  _unitconversionState createState() => _unitconversionState();
}

class _unitconversionState extends State<unitconversion> {
  bool inFocusOne = false;
  String answer = "answer";
  TextEditingController userInputOne = new TextEditingController();
  TextEditingController userInputTwo = new TextEditingController();
  String unitElementsValue = "LENGTH";
  List<String> unitElements = ["LENGTH","MASS","TEMPERATURE","PLANE ANGLE","SPEED","ENERGY","AREA","VOLUME"];
  Map unitChoices = {
    'LENGTH' : ['meter','centimeter','kilometer','inch','feet','mile','millimeter'],
    'MASS' : ['kilogram','gram','milligram','tonne','pound', 'ounce'],
    'TEMPERATURE' : ['celcius','kelvin','farenheit'],
    'PLANE ANGLE' : ['degree','radian','gradian','minute','second'],
    'SPEED' : ['meter per second', 'kilometer per hour', 'mile per hour', 'foot per second'],
    'ENERGY' : ['joule','calorie','kilojoule','kilocalorie','watt hour','kilowatt hour'],
    'AREA' : ['sq. meter', 'sq. foot', 'sq. kilometer', 'sq. centimeter', 'sq. mile', 'sq. inch', 'acre', 'hectare'],
    'VOLUME' : ['cubic meter','liter','cubic centimeter','milliliter','cubic foot','cubic inch']
  };
  String unitChoiceOne='';
  String unitChoiceTwo='';

  @override
  Widget build(BuildContext context) {
    unitChoiceOne = unitChoiceOne==''? unitChoices[unitElementsValue][0] : unitChoiceOne;
    unitChoiceTwo = unitChoiceTwo==''? unitChoices[unitElementsValue][1] : unitChoiceTwo;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: AppBar(
          title: Text(
            'Unit Conversion',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: colors[colorTheme][1],
            ),
          ),
          backgroundColor: colors[colorTheme][9],
        ),
        //drawer: myDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                DropdownButton<String>(
                  value: unitElementsValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 72,
                  elevation: 16,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
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
                SizedBox(height: 30.0,),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onTap: (){
                          setState(() {
                            inFocusOne = true;
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
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9.]'), allow: true),
                        ],
                         decoration: InputDecoration(
                           border:OutlineInputBorder(
                             borderSide: const BorderSide(color: Colors.black, width: 2.0),
                             borderRadius: BorderRadius.zero,
                           ),
                           labelText: inFocusOne? 'Enter' : 'answer',
                           labelStyle: TextStyle(
                             fontSize: 20.0,
                           ),
                         ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    DropdownButton<String>(
                      value: unitChoiceOne,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 50,
                      elevation: 16,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
                      ),
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
                    )
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
                            answer = "";
                            userInputOne.text = answer;
                          });
                        },
                        textAlign: TextAlign.right,
                        onChanged: (text){
                            userInputOne.text = convert(unitElementsValue, unitChoiceTwo, unitChoiceOne, userInputTwo.text);
                            },
                        controller: userInputTwo,
                        keyboardType: TextInputType.number,
                        enableInteractiveSelection: true,
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp('[0-9,. ]'), allow: true),
                        ],
                        decoration: InputDecoration(
                          border:OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.black, width: 2.0),
                            borderRadius: BorderRadius.zero,
                          ),
                          labelText: inFocusOne? 'answer' : 'Enter',
                          labelStyle: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    DropdownButton<String>(
                      value: unitChoiceTwo,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 50,
                      elevation: 16,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      underline: Container(
                        height: 2,
                        color: Colors.black,
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
                    )],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
