import 'package:dream_calc/services/globalWidgets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class contactUs extends StatefulWidget {
  const contactUs({Key key}) : super(key: key);

  @override
  _contactUsState createState() => _contactUsState();
}

Widget myContactUsText({String text, double fontSize = 20, String fontFamily = "Times"}){
  return Column(
    children: [
      FittedBox(
        child: Text(
          text,
          style: TextStyle(
              fontFamily: fontFamily,
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      ),
      SizedBox(height: 3,)
    ],
  );
}

final Uri _emailLaunchUri = Uri(
    scheme: 'mailto',
    path: 'thelearnersdaily@gmail.com',
    queryParameters: {
      'subject': 'Feedback on LearnerCalc'
    }
);

const blogURL = 'https://thelearnersdaily.wordpress.com';
const linkedInURL = "https://www.linkedin.com/in/shyam-sundar-bharathi/";
const twitterURL = "https://twitter.com/bharathi_shyam1";
const githubURL = "https://github.com/Shyam-Sundar-Bharathi/LearnerCalc";

ElevatedButton myEmailButton = myContactUsButton(text: "thelearnersdaily@gmail.com", icon: Icons.mail, launcher: _emailLaunchUri.toString());
ElevatedButton myBlogButton = myContactUsButton(text: "The Learner's Daily Blog", icon: Icons.library_books, launcher: blogURL);
ElevatedButton myLinkedInButton = myContactUsButton(text: "Connect with me on LinkedIn", icon: Icons.laptop_mac_sharp, launcher: linkedInURL);
ElevatedButton myTwitterButton = myContactUsButton(text: "Follow me on Twitter", icon: Icons.phone_iphone_sharp, launcher: twitterURL);
ElevatedButton myQuoraButton = myContactUsButton(text: "Ask me a question on Quora", icon: Icons.question_answer_outlined, launcher: "https://www.quora.com/profile/Shyam-Sundar-Bharathi");
ElevatedButton myGitHubButton = myContactUsButton(text: "Check out our code on GitHub", icon: Icons.code, launcher: githubURL);

class _contactUsState extends State<contactUs> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Color(0xFF858b97),
        appBar: myAppBar("CONTACT US", contactUs: 1),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  color: Color(0xFF545a62),
                  child: Column(
                    children: [
                      myContactUsText(text: "LET'S TALK!", fontSize: 50),
                      SizedBox(height: 10,),
                      myContactUsText(text: "YOU GO FIRST", fontSize: 30),
                      SizedBox(height: 20,),
                      myContactUsText(text: "Tell me what you love about Learner.", fontFamily: "Courier"),
                      myContactUsText(text: "Tell me what you don't love about it.", fontFamily: "Courier"),
                      myContactUsText(text: "Tell me what you more you want to see.", fontFamily: "Courier"),
                      myContactUsText(text: "Tell me what you can't even stand.", fontFamily: "Courier"),
                      myContactUsText(text: "JUST TELL ME EVERYTHING.", fontFamily: "Courier"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/contactUs.jpg"),
                      fit: BoxFit.fill,
                    ),
                    color: Color(0xFF858b97)
                  ),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                  color: Color(0xFF858b97),
                  child: Column(
                    children: [
                      myEmailButton,
                      SizedBox(height: 10,),
                      myLinkedInButton,
                      SizedBox(height: 10,),
                      myTwitterButton,
                      SizedBox(height: 10,),
                      myQuoraButton,
                      SizedBox(height: 10,),
                      myBlogButton,
                      SizedBox(height: 10,),
                      myGitHubButton,
                      SizedBox(height: 50,),
                    ],
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
