import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:physio_therapy/modules/intro_page.dart';
import 'package:physio_therapy/shared/cubit/app_cubit.dart';
import 'package:physio_therapy/shared/cubit/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()..createDataBase())
      ],
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0.0,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarBrightness: Brightness.light,
                  statusBarColor: Colors.black,
                  systemNavigationBarColor: Colors.white,
                )
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
                backgroundColor: Color(0xff00bead)),
            scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );
  }
}
