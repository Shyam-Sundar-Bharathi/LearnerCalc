import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/rendering.dart';

class asciiChart extends StatefulWidget {
  const asciiChart({Key key}) : super(key: key);

  @override
  _asciiChartState createState() => _asciiChartState();
}

class _asciiChartState extends State<asciiChart> {

  Map asciiSpecial = {
    0 : "NUL (null)",
    1 : "SOH (start of heading)",
    2 : "STX (start of text)",
    3 : "ETX (end of text)",
    4 : "EOT (end of transmission)",
    5 : "ENQ (enquiry)",
    6 : "ACK (acknowledge)",
    7 : "BEL (bell)",
    8 : "BS (backspace)",
    9 : "TAB (horizontal tab)",
    10 : "LF (NL line feed, new line)",
    11 : "VT (vertical tab)",
    12 : "FF (NP form feed, new page)",
    13 : "CR (carriage return)",
    14 : "SO  (shift out)",
    15 : "SI  (shift in)",
    16 : "DLE (data link escape)",
    17 : "DC1 (device control 1)",
    18 : "DC2 (device control 2)",
    19 : "DC3 (device control 3)",
    20 : "DC4 (device control 4)",
    21 : "NAK (negative acknowledge)",
    22 : "SYN (synchronous idle)",
    23 : "ETB (end of trans. block)",
    24 : "CAN (cancel)",
    25 : "EM  (end of medium)",
    26 : "SUB (substitute)",
    27 : "ESC (escape)",
    28 : "FS (file separator)",
    29 : "GS (group separator)",
    30 : "RS (record separator)",
    31 : "US (unit separator)",
    32 : " (space)",
    127 : "DEL (rubout)"
  };

  int counter = 32;

  @override
  Widget build(BuildContext context) {
    counter = 32;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("ASCII CHART"),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 4050,
                  child: ListView.builder(
                    itemCount: 81,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index){
                      if(index<33 || counter+1 == 127){
                        if(counter+1 == 127) index = 127;
                        return Row(
                          children: [
                            myFormulaTableBlockNormalText(index.toString(), flex: 1, height: 50),
                            myFormulaTableBlockNormalText(asciiSpecial[index], flex: 2, height: 50),
                          ],
                        );
                      }
                      else return Row(
                        children: [
                          myFormulaTableBlockNormalText((++counter).toString(), flex: 1, height: 50),
                          myFormulaTableBlockNormalText(String.fromCharCode(counter), flex: 2, height: 50),
                          myFormulaTableBlockNormalText((++counter).toString(), flex: 1, height: 50),
                          myFormulaTableBlockNormalText(String.fromCharCode(counter), flex: 2, height: 50),
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(height: 30,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}