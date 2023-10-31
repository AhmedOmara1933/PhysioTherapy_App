import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0.0,
      ),
      body: Stack(
        children: [
          Positioned(
            bottom: 200.0,
            top: 0,
            left: 0,
            right: 0,
            child: Image(
              image: AssetImage(
                'images/Screenshot 2023-10-22 193756.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 470.0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(
                  top: 30.0, left: 20.0, right: 20.0, bottom: 20.0),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0.r),
                  topRight: Radius.circular(30.0.r),
                ),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity.w,
                    child: Text(
                      'DR / Mohamed Omara',
                      style: GoogleFonts.benne(
                          fontWeight: FontWeight.bold, fontSize: 30.0.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(child: Image.asset('images/google.png',height: 45.0.h,width: 45.0.w,)),
                      Expanded(child: Image.asset('images/facebook.png',height: 45.0.h,width: 45.0.w,)),
                      Expanded(child: Image.asset('images/twitter.png',height: 45.0.h,width: 45.0.w,)),
                      Expanded(child: Image.asset('images/instagram.png',height: 45.0.h,width: 45.0.w,)),

                    ],
                  ),
                  Text(
                    'Loream ipsum dolor sit amet consecrate.Dais\n'
                    'portion purus qualm dais molester non rises\n'
                    'purus deque. ipsum lacks id....',
                    style: TextStyle(color: Colors.black54, fontSize: 16.0.sp),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
