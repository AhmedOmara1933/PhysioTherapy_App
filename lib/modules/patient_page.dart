import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import '../shared/components/patientFormField.dart';
import '../shared/components/patient_card.dart';
import '../shared/cubit/app_cubit.dart';

class PatientPage extends StatelessWidget {
  const PatientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var patientDetails = AppCubit.get(context).searchModel;
        var cubit=AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 140.0,
            title: Form(
              key:cubit.formKey2,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: PatientFormField(
                        keyboardType: TextInputType.phone,
                        validate: (value) {
                          if (value!.isEmpty) {
                            return 'National Id must be fill';
                          }else if(value.length<14){
                            return 'Invalid National Id';
                          }
                          return null;
                        },
                        prefixicon: Icons.key,
                        radius: 50.0,
                        text: 'Enter Your National Id',
                        controller:cubit. searchNationalId),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 50.0),
                    child: MaterialButton(
                      onPressed: () {
                        if (cubit.formKey2.currentState!.validate()) {
                          cubit.getFromDatabase(cubit.database,cubit.searchNationalId.text);
                        }
                      },
                      child: const Text('Search'),
                    ),
                  )
                ],
              ),
            ),
            leading: const Padding(
              padding: EdgeInsets.only(bottom: 50.0, left: 5.0),
              child: Image(
                image: AssetImage(
                  'images/id-card.png',
                ),
                color: Color(0xff00bead),
              ),
            ),
          ),
          body: LiquidPullToRefresh(
            color: Colors.white,
            backgroundColor: const Color(0xff00bead),
            height: 300.0,
            animSpeedFactor: 2,
            onRefresh: ()async{
              cubit.getFromDatabase(cubit.database,cubit.searchNationalId.text);
              return await Future.delayed(Duration(seconds: 1));
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ConditionalBuilder(
                    condition: patientDetails != null,
                    builder: (context) => PatientCard(
                      model: patientDetails!,
                    ),
                    fallback: (context) => const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 60.0),
                            child: Image(
                                image:
                                AssetImage('images/Screenshot 2023-10-21 053801.png')),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
