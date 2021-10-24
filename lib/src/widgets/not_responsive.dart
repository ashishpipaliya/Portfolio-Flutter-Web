import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotResponsiveWidget extends StatelessWidget {
  const NotResponsiveWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          child: Text(
            "I'm available to desktop only",
            style:
                GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
