import 'package:dream_calc/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loading extends StatefulWidget {
  const loading({Key key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {

  readFromDevice() async {
    final prefs = await SharedPreferences.getInstance();
    final precisionKey = 'precision';
    final precisionValue = prefs.getInt(precisionKey) ?? 4;
    final colorKey = 'colorTheme';
    final colorValue = prefs.getString(colorKey) ?? 'GRAYSCALE';
    setState(() {
      precision = precisionValue;
      colorTheme = colorValue;
    });
    Navigator.pushReplacementNamed(context, '/genScreen');
  }

  @override
  void initState() {
    super.initState();
    readFromDevice();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(),
    );
  }
}
