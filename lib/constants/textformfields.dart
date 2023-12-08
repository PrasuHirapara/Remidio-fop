import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget authTextFormField(TextEditingController controller, String label, String validator, {bool obscureText = false}){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      textInputAction: TextInputAction.next,
      style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black),
      cursorColor: Colors.black,
      validator: (value){
        if(value!.isEmpty){
          return validator;
        }else{
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black54),
        prefixIconColor: Colors.black,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.black),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
    ),
  );
}