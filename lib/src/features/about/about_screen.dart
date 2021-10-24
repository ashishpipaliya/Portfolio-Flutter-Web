import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              maxRadius: 100,
              backgroundColor: Colors.transparent,
              foregroundImage: NetworkImage(
                  "https://placehold.jp/24/cccccc/000000/100x100.png?text=Profile.."),
            ),
            SizedBox(height: 20),
            RichText(
              text: TextSpan(children: [
                TextSpan(
                    text: '''Hey there, \nI am  ''',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 20)),
                TextSpan(
                    text: "Ashish Pipaliya",
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 35)),
                TextSpan(
                    text:
                        '''\nI am a Flutter Developer living in Surat(IN). I loves to transform design into code to build mobile applications using Flutter. I am currently working at ''',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 20)),
                TextSpan(
                    text: '''Agile Infoways Pvt. Ltd. ''',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.7),
                        fontSize: 20)),
                TextSpan(
                    text:
                        '''as a Flutter Developer. Other than Flutter, I am learning NodeJs and I can also make simple APIs as per my need. In my free time, I make personal projects using Flutter + NodeJS.\n''',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 20)),
              ]),
            ),
            SizedBox(height: 150),
            Text(
              "Skills".toUpperCase(),
              style:
                  GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text("Framework"),
                CustomChip(title: "Flutter"),
              ],
            ),

            //  Frameworks
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text("Languages"),
                CustomChip(title: "Dart"),
                CustomChip(title: "Java"),
                CustomChip(title: "JavaScript"),
              ],
            ),

            //  Database
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text("Databases"),
                CustomChip(title: "MongoDB"),
                CustomChip(title: "Cloud Firestore"),
                CustomChip(title: "Supabase"),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomChip extends StatelessWidget {
  final String title;
  const CustomChip({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      constraints: BoxConstraints(minWidth: 60),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(color: Colors.black, width: 2)),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500, color: Colors.black),
      ),
    );
  }
}
