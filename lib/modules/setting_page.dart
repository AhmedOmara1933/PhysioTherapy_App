import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          'Settings Page',
          style: GoogleFonts.acme(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          )
      ),
    );
  }
}
