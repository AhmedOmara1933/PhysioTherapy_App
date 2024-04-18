import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../layout/home_layout.dart';

// ignore: must_be_immutable
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/Screenshot 2023-10-22 184425.png'),
                fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Physio Therapy',
                  style: GoogleFonts.beauRivage(
                      fontSize: 62.0, fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(
                bottom: 60.0,
                right: 250.0,
              ),
              height: 100.0,
              width: 100.0,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(300.0)),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: MaterialButton(
                color: const Color(0xff00bead),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeLayout(),
                      ));
                },
                child: Text(
                  'GO',
                  style: GoogleFonts.bevan(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
