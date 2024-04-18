import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:physio_therapy/shared/cubit/app_cubit.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0.0,
          ),
          body: Stack(
            children: [
              Positioned(
                bottom: 170.0,
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.grey[200],
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: (){
                          showMenu(
                              elevation: 100.0,
                              shape: Border.all(
                                  color: Colors.black.withOpacity(0.2)),
                              context: context,
                              position: RelativeRect.fromLTRB(80, 200, 80, 200),
                              items: [
                                PopupMenuItem(
                                  child: Container(
                                    width: double.infinity,
                                    margin: EdgeInsetsDirectional.symmetric(
                                        horizontal: 10.0),
                                    child: MaterialButton(
                                      onPressed: () {
                                        AppCubit.get(context)
                                            .uploadCameraImage();
                                      },
                                      child: Text(
                                        'Take from camera',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                              ]);
                        },
                        child: Container(
                            height:double.infinity,
                            width: double.infinity,
                            child: AppCubit.get(context).image == null
                                ? Image(
                                    image: AssetImage('images/Screenshot_2024-04-18_031400-removebg-preview.png'),
                                  )
                                : Image.file(
                                    AppCubit.get(context).image!,
                                    fit: BoxFit.cover,
                                  )),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 490.0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 30.0, left: 20.0, right: 20.0, bottom: 20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    color: Colors.white,
                  ),
                  child: ListView(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Text(
                          'DR / Ahmed Omara',
                          style: GoogleFonts.benne(
                              fontWeight: FontWeight.bold, fontSize: 30.0),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0),
                        child: Row(
                          children: [
                            Expanded(
                                child: Image.asset(
                              'images/google.png',
                              height: 50.0,
                              width: 50.0,
                            )),
                            Expanded(
                                child: Image.asset(
                              'images/facebook.png',
                              height: 50.0,
                              width: 50.0,
                            )),
                            Expanded(
                                child: Image.asset(
                              'images/twitter.png',
                              height: 50.0,
                              width: 50.0,
                            )),
                            Expanded(
                                child: Image.asset(
                              'images/instagram.png',
                              height: 50.0,
                              width: 50.0,
                            )),
                          ],
                        ),
                      ),
                      Text(
                        'Loream ipsum dolor sit amet consecrate.Dais\n'
                        'portion purus qualm dais molester non rises\n'
                        'purus deque. ipsum lacks id....',
                        style: TextStyle(color: Colors.black54, fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
