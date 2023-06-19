// ignore: duplicate_ignore
// ignore_for_file: non_constant_identifier_names, file_names

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../Colors.dart';
import 'builditemtask.dart';

// to make condition with ConditionalBuilder
Widget ConditionalItem(
    {required List tasks, required IconData icon, required String text}) {
// to make condition without if
  return ConditionalBuilder(
    condition: tasks.isNotEmpty,
// to make list from widget with number of it we use separated to make line after each item
    builder: (context) => ListView.separated(
        itemBuilder: (context, index) => buildTaskItem(context, tasks[index]),
// to make line after each item
        separatorBuilder: ((context, index) => Container(
              width: double.infinity,
              height: 1,
              color: BottomSheetColor,
            )),
        itemCount: tasks.length),
    fallback: (context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: TextColor,
            size: 100,
          ),
          const SizedBox(height: 20),
          Text(
            text,
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: TextColor),
          )
        ],
      ),
    ),
  );
}
