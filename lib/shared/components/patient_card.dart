import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:physio_therapy/models/model.dart';
 
// ignore: must_be_immutable
class PatientCard extends StatelessWidget {
  PatientModel model;

  PatientCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(
          left: 20.0, right: 20.0, bottom: 40.0, top: 20.0),
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: const Color(0xff00bead),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: 120.0,
                        height: 120.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(color: Colors.white, width: 5.0),
                        ),
                        child: Image.asset('images/3608262.jpg'),
                      ),
                      Text(
                        '${model.number}',
                        style: GoogleFonts.acme(),
                      )
                    ],
                  ),
                   SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          '${model.name}',
                          style: GoogleFonts.belleza(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w900),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        ),
                         SizedBox(
                          height: 10.0,
                        ),
                        Container(
                         padding: EdgeInsets.only(bottom: 7.0,top:5.0,left: 2.0,right: 2.0),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Colors.white),
                          child: Text(
                            '${model.date}',
                            style: GoogleFonts.belleza(
                              fontSize: 20.0,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                height: 50.0,
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(width: 1.5, color: Colors.white)),
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        'Patient Doctor / ',
                        style: GoogleFonts.belleza(
                            fontSize: 21.0, fontWeight: FontWeight.w900),
                      ),
                      Expanded(
                        child: Text(
                          '${model.doctor}',
                          style: GoogleFonts.belleza(
                              fontSize: 15.0, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 250.0,
                decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(width: 1.5, color: Colors.white)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              '${model.History}',
                              style: GoogleFonts.belleza(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: 1.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
