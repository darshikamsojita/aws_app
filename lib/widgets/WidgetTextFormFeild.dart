import 'package:flutter/material.dart';

class WidgetTextFormFeild extends StatelessWidget {
     TextEditingController? controller;
   String? hintText;
   Widget? suffixIcon;
   String? Function(String?)? validator;
   bool obscureText = false;

   WidgetTextFormFeild({super.key,this.controller,this.hintText,this.suffixIcon,this.validator,required this.obscureText});

  @override
  Widget build(BuildContext context) {
 return TextFormField(
  style:const TextStyle(color: Colors.grey),
      cursorColor: Colors.grey,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle:const TextStyle(
          fontSize: 12,
          color: Colors.white
        ),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:const BorderSide(color: Colors.grey,width: 1.5)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:const BorderSide(color: Colors.grey,width: 1.5)
        ),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:const BorderSide(width: 1)
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:const BorderSide(width: 1)
        ),
      ),
      validator: validator,

 );
  }
}