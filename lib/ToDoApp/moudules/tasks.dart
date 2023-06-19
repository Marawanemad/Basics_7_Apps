import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/cubit.dart';
import '../Cubit/state.dart';
import '../widgets/conditionalItem.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// to make list from widget with number of it we use separated to make line after each item
    return BlocConsumer<CubitApp, CubitAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = CubitApp.get(context).NewTasks;
        return ConditionalItem(
            tasks: tasks,
            icon: Icons.menu,
            text: "No Tasks yet , Please Add One");
      },
    );
  }
}
