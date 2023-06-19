import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Cubit/cubit.dart';
import '../Cubit/state.dart';
import '../widgets/conditionalItem.dart';

class ArchivedScreen extends StatelessWidget {
  const ArchivedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitApp, CubitAppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = CubitApp.get(context).ArchivedTasks;

        return ConditionalItem(
          tasks: tasks,
          icon: Icons.archive,
          text: "No Arcived Yet ",
        );
      },
    );
  }
}
