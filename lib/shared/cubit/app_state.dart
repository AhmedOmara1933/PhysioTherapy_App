part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class AppInitial extends AppState {}

class AppChangeBottomNavBar extends AppState {}

class AppIsButtonSheetShown extends AppState {}

class AppCreateDatabase extends AppState {}

class AppInsertToDatabase extends AppState {}

class AppGetFromDatabase extends AppState {}

class AppUpdateDatabase extends AppState {}

class AppDeleteDatabase extends AppState {}

class SearchSuccessState extends AppState {}

class ImagePickerSuccessState extends AppState {
  final File image;

  ImagePickerSuccessState({required this.image});
}

class ImagePickerCanceledState extends AppState {}

class ImagePickerErrorState extends AppState {
  final String error;

  ImagePickerErrorState({required this.error});
}
