import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:physio_therapy/modules/intro_page.dart';
import 'package:physio_therapy/shared/cubit/app_cubit.dart';
import 'package:physio_therapy/shared/cubit/bloc_observer.dart';

void main()async {
  // WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_ , child) {
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
                    )),
                floatingActionButtonTheme: const FloatingActionButtonThemeData(
                    backgroundColor: Color(0xff00bead)),
                scaffoldBackgroundColor: Colors.white),
            home: child,
            debugShowCheckedModeBanner: false,
          ),
        );
      },
      child: const IntroPage(),
    );
  }
}
