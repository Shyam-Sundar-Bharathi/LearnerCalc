import 'package:dream_calc/services/globalWidgets.dart';
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
        appBar: myAppBar("CONTACT US"),
      ),
    );
  }
}
