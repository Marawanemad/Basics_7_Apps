import 'package:flutter/material.dart';

Widget button({
  // make parameteres to change button shape in different places
  required String herotag,
  Color background = Colors.pinkAccent,
  required Icon icons,
  required Function function,
}) =>
// to make circle button
    FloatingActionButton(
// to give name to action button to avoid error of multiple floatingactionbutton
      heroTag: herotag,
// to make size of button small
      mini: true,
      backgroundColor: background,
      onPressed: () => function(),
      child: icons,
    );
