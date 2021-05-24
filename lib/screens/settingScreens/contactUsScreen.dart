import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
class contactUs extends StatefulWidget {
  const contactUs({Key key}) : super(key: key);

  @override
  _contactUsState createState() => _contactUsState();
}

class _contactUsState extends State<contactUs> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: colors[colorTheme][2],
        appBar: AppBar(
          title: FittedBox(
            child: Text(
              "CONTACT US",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w900,
                color: colors[colorTheme][1],
              ),
            ),
          ),
          backgroundColor: colors[colorTheme][9],
        ),
      ),
    );
  }
}
