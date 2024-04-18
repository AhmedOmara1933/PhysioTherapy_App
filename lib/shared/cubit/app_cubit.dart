import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:physio_therapy/modules/patient_page.dart';
import 'package:physio_therapy/modules/setting_page.dart';
import 'package:sqflite/sqflite.dart';
import '../../models/model.dart';
import '../../modules/profile_page.dart';
part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);

  //todo//////////////////////// variables && functions/////////////////////////////////

  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var formKey2 = GlobalKey<FormState>();
  var patientName = TextEditingController();
  var numberOfPatient = TextEditingController();
  var patientDate = TextEditingController();
  var patientDoctor = TextEditingController();
  var patientHistory = TextEditingController();
  var searchNationalId = TextEditingController();
  var passport = TextEditingController();
  File? image;
  final imagePicker = ImagePicker();

  List<Widget> screans = [
    const PatientPage(),
    const ProfilePage(),
    SettingPage()
  ];

  uploadCameraImage() async {
    await imagePicker.pickImage(source: ImageSource.camera).then((value) {
      if (value != null) {
        image = File(value.path);
        emit(ImagePickerSuccessState(image: image!));
      } else {
        emit(ImagePickerCanceledState());
      }
    }).catchError((error) {
      emit(ImagePickerErrorState(error: error.toString()));
    });
  }

  //todo//////////////////////// changeBottomNavBar/////////////////////////////////
  int currentIndex = 0;

  void changeBottomNavBar({required index}) {
    currentIndex = index;
    emit(AppChangeBottomNavBar());
  }

//todo////////////////////////changeBottomSheet/////////////////////////////////////
  IconData fbiIcon = Icons.add;
  bool isBottomSheet = false;

  void isBottomSheetShown({
    required bool isShown,
    required IconData icon,
  }) {
    isBottomSheet = isShown;
    fbiIcon = icon;
    emit(AppIsButtonSheetShown());
  }

//todo//////////////////////////sqflite database///////////////////////////////

  Database? database;
  List<PatientModel> patient = [];

  void createDataBase() {
    openDatabase('physiotherapy.db', version: 3, onCreate: (database, version) {
      if (kDebugMode) {
        print('database is created');
      }
      database
          .execute(
              "CREATE TABLE patients(id INTEGER PRIMARY KEY,name TEXT,numberOfPatient TEXT,date TEXT,doctor TEXT,history TEXT,passport TEXT)")
          .then((value) {
        if (kDebugMode) {
          print('Table is created');
        }
      });
    }, onOpen: (database) {
      print('database is opened');
      //getFromDatabase(database);
    }).then((value) {
      database = value;
      emit(AppCreateDatabase());
    });
  }

  insertToDatabase({
    required String name,
    required String numberOfPatient,
    required String date,
    required String doctor,
    required String history,
    required String passport,
  }) async {
    await database!.transaction((txn) {
      return txn
          .rawInsert(
              'INSERT INTO patients(name,numberOfPatient,date,doctor,history,passport) VALUES("$name","$numberOfPatient","$date","$doctor","$history","$passport")')
          .then((value) {
        print('$value inserted succeed');
        emit(AppInsertToDatabase());
      });
    });
  }

  void getFromDatabase(database, text) async {
    await database!.rawQuery('SELECT *FROM patients').then((value) {
      patient = List<PatientModel>.from(
          (value as List).map((e) => PatientModel.fromJson(e)));
      print(patient);
      searchIntoList(searchText: text);
      emit(AppGetFromDatabase());
    });
  }

  PatientModel? searchModel;

  searchIntoList({required String searchText}) {
    patient.forEach((element) {
      if (searchText == element.passport) {
        searchModel = element;
      }
    });
    emit(SearchSuccessState());
  }

  void deleteDatabase({required String id}) async {
    await database!
        .rawDelete('DELETE FROM patients WHERE id = ?', [id]).then((value) {
      //getFromDatabase(database,"");
      emit(AppDeleteDatabase());
    });
  }
}
