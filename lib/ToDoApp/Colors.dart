// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Color appBarColor = Colors.black;
Color appBodyColor = Colors.grey[700]!;
Color BottomSheetColor = Colors.grey;
Color SelectedItemColor = Colors.grey[800]!;
Color UnSelectedItemColor = Colors.white;
Color CircleAvatarColor = Colors.black;
Color TextColor = Colors.white;

color({required bool dark}) {
  if (dark == true) {
    appBarColor = Colors.black;
    appBodyColor = Colors.grey[700]!;
    BottomSheetColor = Colors.grey;
    SelectedItemColor = Colors.grey[800]!;
    UnSelectedItemColor = Colors.white;
    CircleAvatarColor = Colors.black;
    TextColor = Colors.white;
  } else {
    appBarColor = Colors.blue;
    appBodyColor = Colors.white;
    BottomSheetColor = Colors.grey[300]!;
    SelectedItemColor = Colors.white;
    UnSelectedItemColor = Colors.black;
    CircleAvatarColor = Colors.blue;
    TextColor = Colors.black;
  }
}
