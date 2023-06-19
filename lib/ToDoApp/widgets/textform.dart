import 'package:flutter/material.dart';

// make method to create form
TextFormField form({
  required var formname,
  required var controllertext,
  required var keyboardtype,
  required var labeltext,
  required var icon,
  // make function onclick not required to call it
  onclick,
}) {
  return TextFormField(
      // controller use to recive data
      controller: controllertext,
      // to show how keyboard shape will apear
      keyboardType: keyboardtype,
      // to make function when click on field
      onTap: onclick,
      // to make decoration shape to this form
      decoration: InputDecoration(
        // to make title text inside formtext border
        labelText: labeltext,
        // to make icon in the start of formtext
        prefixIcon: Icon(icon),
        // to make border line with circule shape
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
      ),
      validator: (String? value) {
        if (value!.isEmpty) {
          return '$formname must not by Empty';
        }
        return null;
      });
}
