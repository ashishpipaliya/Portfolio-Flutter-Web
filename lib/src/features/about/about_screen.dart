import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
            // CircleAvatar(
            //   maxRadius: 100,
            //   backgroundColor: Colors.transparent,
            //   foregroundImage: NetworkImage(
            //       "https://placehold.jp/24/cccccc/000000/100x100.png?text=Profile.."),
            // ),
            SizedBox(height: 50),
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

            SizedBox(height: 50),
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
                CustomChip(
                  title: "Flutter",
                  logoUrl: "https://img.icons8.com/color/452/flutter.png",
                ),
              ],
            ),

            //  Frameworks
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text("Languages"),
                CustomChip(
                  title: "Dart",
                  logoUrl: "https://img.icons8.com/color/452/dart.png",
                ),
                CustomChip(
                    title: "Java",
                    logoUrl:
                        "https://img.icons8.com/color/48/000000/java-coffee-cup-logo--v1.png"),
                CustomChip(
                  title: "JavaScript",
                  logoUrl:
                      "https://img.icons8.com/color/144/000000/javascript--v1.png",
                ),
              ],
            ),

            //  Database
            SizedBox(height: 20),
            Wrap(
              spacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text("Databases"),
                CustomChip(
                  title: "MongoDB",
                  logoUrl:
                      "https://img.icons8.com/color/144/000000/mongodb.png",
                ),
                CustomChip(
                  title: "Cloud Firestore",
                  logoUrl:
                      "https://img.icons8.com/color/144/000000/cloud-firestore.png",
                ),
                CustomChip(
                  title: "Supabase",
                  logoUrl: "https://pipedream.com/s.v0/app_1dBhP3/logo/96",
                ),
              ],
            ),
            SizedBox(height: 30),
            Wrap(
              spacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text("Socials"),
                IconButton(
                    onPressed: () => _openSocials(
                        url: "https://www.linkedin.com/in/ashish-pipaliya/"),
                    icon: Image.network(
                        "https://img.icons8.com/glyph-neue/452/linkedin.png")),
                IconButton(
                    onPressed: () => _openSocials(
                        url: "https://twitter.com/ashish_pipaliya"),
                    icon: Image.network(
                        "https://img.icons8.com/ios-filled/452/twitter.png")),
                IconButton(
                    onPressed: () =>
                        _openSocials(url: "https://github.com/ashishpipaliya"),
                    icon: Image.network(
                        "https://img.icons8.com/material-outlined/452/github.png"))
              ],
            ),
            SizedBox(height: 50),
            Text(
              "Extras".toUpperCase(),
              style:
                  GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            Text(
                "• I play a lot with selenium using java. I automated Amazon.in for creating bulk account, place bulk orders and much more",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 20)),
            SizedBox(height: 10),
            RichText(
                text: TextSpan(
                    children: [
                  TextSpan(
                      text: "http://gvgb.herokuapp.com",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () =>
                            _openSocials(url: 'http://gvgb.herokuapp.com'),
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                          fontSize: 20))
                ],
                    text: "• Amazon Giftcard extractor from Email : ",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 20))),

            SizedBox(height: 10),
            RichText(
                text: TextSpan(
              text: "• Reverse Engineering enthusiastic : ",
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.4),
                  fontSize: 20),
              children: [
                TextSpan(
                    text:
                        "reversed Divyabhaskar and Dainikbhaskar mobile apps api",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: 20))
              ],
            ))
          ],
        ),
      ),
    );
  }

  void _openSocials({required String url}) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}

class CustomChip extends StatelessWidget {
  final String title;
  final String logoUrl;
  const CustomChip(
      {Key? key,
      required this.title,
      this.logoUrl =
          "https://play-lh.googleusercontent.com/CT1M2pKlUhGx4w5UHqarn6oSU_sa7L7XRW2-hQrfNi9oou6W81PbJnWi-9PbEfC_3g"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      margin: EdgeInsets.only(right: 20),
      constraints: BoxConstraints(minWidth: 60),
      decoration: BoxDecoration(),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(logoUrl, width: 30, height: 30, fit: BoxFit.fitWidth),
          Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
