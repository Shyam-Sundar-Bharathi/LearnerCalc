import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/material.dart';
import 'package:dream_calc/screens/menu.dart';
import 'package:url_launcher/url_launcher.dart';

class contactUs extends StatefulWidget {
  const contactUs({Key key}) : super(key: key);

  @override
  _contactUsState createState() => _contactUsState();
}

final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'shyamsundarbharathi@gmail.com',
    queryParameters: {
      'subject': 'Example Subject & Symbols are allowed!'
    }
);

const url = 'https://thelearnersdaily.wordpress.com';

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
        body: Column(
          children: [
            ElevatedButton(
              child: Icon(Icons.mail),
              onPressed: () async {
                const url = "https://google.com";
                print("pressed");
                if(await canLaunch(url)){
                  print('can launch');
                  launch(_emailLaunchUri.toString());
              } else {
                  throw "can't launch";
                }
    },
            ),
            ElevatedButton(
              child: Text("blog"),
              onPressed: () async {
                print("pressed");
                if(await canLaunch(url)){
                  print('can launch');
                  launch(url);
                } else {
                  throw "can't launch";
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
