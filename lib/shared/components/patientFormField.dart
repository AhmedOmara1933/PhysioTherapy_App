import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PatientFormField extends StatelessWidget {
  String? text;
  TextInputType ?keyboardType;
  double radius;
  IconData? prefixicon;
  String? Function(String?)? validate;
  void Function()? onTap;
  TextEditingController? controller;

  PatientFormField({
    this.keyboardType,
    super.key,
    this.radius=10.0,
    required this.text,
    this.prefixicon,
    this.validate,
    this.onTap,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border:  OutlineInputBorder(borderRadius: BorderRadius.circular(radius)),
        hintText: text,
        prefixIcon: Icon(
          prefixicon,
        ),
      ),
      validator: validate,
      keyboardType: keyboardType,
      onTap: onTap,
    );
  }
}