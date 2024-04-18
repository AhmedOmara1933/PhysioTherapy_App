import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../shared/components/bottomNavBar.dart';
import '../shared/components/patientFormField.dart';
import '../shared/cubit/app_cubit.dart';

// ignore: must_be_immutable
class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is AppInsertToDatabase) {
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          key: cubit.scaffoldKey,
          bottomNavigationBar: DefaultBottomNavBar(
            selectedItemColor: const Color(0xff00bead),
            selectedIndex: cubit.currentIndex,
            onItemSelected: (int value) {
              cubit.changeBottomNavBar(index: value);
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            width: 70.0,
            height: 70.0,
            child: ClipRRect(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              borderRadius: BorderRadius.circular(50.0),
              child: FloatingActionButton(
                onPressed: () {
                  if (cubit.isBottomSheet) {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.insertToDatabase(
                          name: cubit.patientName.text,
                          numberOfPatient: cubit.numberOfPatient.text,
                          doctor: cubit.patientDoctor.text,
                          history: cubit.patientHistory.text,
                          date: cubit.patientDate.text,
                          passport: cubit.passport.text);
                      cubit.isBottomSheetShown(isShown: false, icon: Icons.add);
                    }
                  } else {
                    cubit.isBottomSheetShown(isShown: true, icon: Icons.edit);
                    cubit.scaffoldKey.currentState!
                        .showBottomSheet((context) {
                          return SingleChildScrollView(
                            child: Container(
                              color: Colors.grey[100],
                              child: Form(
                                key: cubit.formKey,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: PatientFormField(
                                          text: 'Patient Name',
                                          keyboardType: TextInputType.name,
                                          prefixicon: Icons.person_outlined,
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return 'Patient Name must be fill';
                                            }
                                            return null;
                                          },
                                          controller: cubit.patientName),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: PatientFormField(
                                          text: 'Patient National Id',
                                          keyboardType: TextInputType.phone,
                                          prefixicon: Icons.key,
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return 'National Id must be fill';
                                            } else if (value.length < 14) {
                                              return 'Invalid National Id';
                                            }
                                            return null;
                                          },
                                          controller: cubit.passport),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: PatientFormField(
                                          text: 'Patient Number',
                                          keyboardType: TextInputType.phone,
                                          prefixicon: Icons.numbers,
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return 'Patient Number must be fill';
                                            } else if (value.length < 11) {
                                              return 'Invalid Number';
                                            }
                                            return null;
                                          },
                                          controller: cubit.numberOfPatient),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: PatientFormField(
                                          text: 'Patient Doctor',
                                          keyboardType: TextInputType.name,
                                          prefixicon: Icons
                                              .medical_information_outlined,
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return 'Patient Doctor must be fill';
                                            }
                                            return null;
                                          },
                                          controller: cubit.patientDoctor),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: PatientFormField(
                                          text: 'Patient Date',
                                          prefixicon:
                                              Icons.calendar_month_sharp,
                                          onTap: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate: DateTime(2100),
                                            ).then((value) {
                                              cubit.patientDate.text =
                                                  DateFormat.yMMMEd()
                                                      .format(value!);
                                            });
                                          },
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return 'Patient Date must be 4';
                                            }
                                            return null;
                                          },
                                          controller: cubit.patientDate),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: PatientFormField(
                                          keyboardType: TextInputType.text,
                                          text: 'Patient History',
                                          prefixicon: Icons.history,
                                          validate: (value) {
                                            if (value!.isEmpty) {
                                              return 'Patient History must be fill';
                                            }
                                            return null;
                                          },
                                          controller: cubit.patientHistory),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                        .closed
                        .then((value) {
                          cubit.isBottomSheetShown(
                              isShown: false, icon: Icons.add);
                        });
                  }
                },
                child: Icon(
                  cubit.fbiIcon,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
            ),
          ),
          body: cubit.screans[cubit.currentIndex],
        );
      },
    );
  }
}
