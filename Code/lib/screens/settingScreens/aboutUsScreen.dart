import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';

class aboutUs extends StatefulWidget {
  const aboutUs({Key key}) : super(key: key);

  @override
  _aboutUsState createState() => _aboutUsState();
}

class _aboutUsState extends State<aboutUs> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: myAppBar("ABOUT US"),
      ),
    );
  }
}
