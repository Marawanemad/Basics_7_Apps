import 'package:flutter/material.dart';

import '../Colors.dart';
import '../Cubit/cubit.dart';

Widget buildTaskItem(context, Map model) {
// to make swipe
  return Dismissible(
    key: Key(model['id'].toString()),
    child: Padding(
      padding: const EdgeInsets.only(top: 25, left: 15, bottom: 10),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: CircleAvatarColor,
            radius: 45,
            child: Text(
              model['time'],
              style: TextStyle(
                  color: TextColor, fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  model['title'],
                  style: TextStyle(
                      fontSize: 25,
                      color: TextColor,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  model['date'],
                  style: TextStyle(fontSize: 15, color: TextColor),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          IconButton(
              onPressed: () {
                CubitApp.get(context)
                    .UpdateData(status: "done", id: model["id"]);
              },
              icon: Icon(
                Icons.check_circle_outline_rounded,
                color: CircleAvatarColor,
              )),
          IconButton(
              onPressed: () {
                CubitApp.get(context)
                    .UpdateData(status: "archive", id: model["id"]);
              },
              icon: Icon(
                Icons.archive,
                color: CircleAvatarColor,
              ))
        ],
      ),
    ),
// to make delete when swipe widget
    onDismissed: (direction) {
      CubitApp.get(context).DeleteData(id: model['id']);
    },
  );
}
