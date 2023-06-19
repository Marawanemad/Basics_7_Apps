// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../Colors.dart';
import '../Cubit/cubit.dart';
import '../Cubit/state.dart';
import '../widgets/textform.dart';

// create globalkey to scaffold
var ScaffoldKey = GlobalKey<ScaffoldState>();
var formkey = GlobalKey<FormState>();
var TitleText = TextEditingController();
var TimeText = TextEditingController();
var DateText = TextEditingController();

class todoHome extends StatelessWidget {
  const todoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// to make bloc state in statelesswidget
    return BlocProvider(
// to make required parameter and give it class cubitApp
// we use .. to make it as a object and call itmes inside it
      create: (BuildContext context) => CubitApp()..onCreateDataBase(),
// make blocConsumer and give it 2 types the cubit and the state
      child: BlocConsumer<CubitApp, CubitAppState>(
// make listener to listen where the action
        listener: (BuildContext context, CubitAppState state) {},
// make builder to take from the listener and rebuild the page
        builder: (BuildContext context, CubitAppState state) {
          // make object from cubit object to make use it easily in mant times
          CubitApp cubit = CubitApp.get(context);
          return Scaffold(
            // make globalkey to use it in many places
            key: ScaffoldKey,
            appBar: AppBar(
              titleSpacing: 30,
              toolbarHeight: 70,
              backgroundColor: appBarColor,
              title: Text(
                cubit.ScreenNames[cubit.currentindex],
                style: const TextStyle(fontSize: 40),
              ),
              actions: [
                Switch(
                  thumbIcon: MaterialStatePropertyAll(Icon(
                    cubit.dark == true ? Icons.dark_mode : Icons.light_mode,
                    color: appBarColor,
                  )),
                  activeColor: Colors.grey,
                  onChanged: cubit.SwitchButton,
                  value: cubit.dark,
                )
              ],
            ),

            floatingActionButton: FloatingActionButton(
              backgroundColor: appBarColor,
              child: Icon(
                cubit.floatingIcon,
                color: TextColor,
              ),
              onPressed: () {
                if (cubit.sheetopened) {
                  // to check if text or not
                  if (formkey.currentState!.validate()) {
                    // to close sheet if it opened
                    cubit
                        .insertToDataBase(
                            title: TitleText.text,
                            time: TimeText.text,
                            date: DateText.text)
                        .then((value) {
                      Navigator.pop(context);
                      TitleText.text = '';
                      TimeText.text = '';
                      DateText.text = '';
                      cubit.ChangeBottomSheet(false, Icons.edit);
                    });
                  }
                } else {
                  // use scaffold key to make bottom sheet in this scaffold
                  ScaffoldKey.currentState!
                      .showBottomSheet(
                        (context) => Container(
                          padding: const EdgeInsets.all(15.0),
                          color: BottomSheetColor,
                          // make form with key to check with this key
                          child: Form(
                            key: formkey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                // make first formFieldtext to take title and send parameters to it
                                form(
                                    formname: "Title",
                                    controllertext: TitleText,
                                    keyboardtype: TextInputType.text,
                                    labeltext: 'Task Title',
                                    icon: Icons.text_fields_rounded),
                                const SizedBox(
                                  height: 15,
                                ),
                                // make first formFieldtext to take title and send parameters to it
                                form(
                                  formname: "Time",
                                  controllertext: TimeText,
                                  keyboardtype: TextInputType.datetime,
                                  labeltext: 'Task Time',
                                  icon: Icons.watch_later_outlined,
                                  onclick: () {
                                    // to make time box to choose time from it and make then to take value to show it and use it later
                                    showTimePicker(
                                            context: context,
                                            initialTime: TimeOfDay.now())
                                        .then((value) => TimeText.text =
                                            value!.format(context).toString());
                                  },
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                form(
                                    formname: "Date",
                                    controllertext: DateText,
                                    keyboardtype: TextInputType.datetime,
                                    labeltext: "Task Date",
                                    icon: Icons.calendar_month_rounded,
                                    onclick: () {
                                      // to make date box to choose time from it and make then to take value to show it and use it later
                                      showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(2005),
                                              lastDate:
                                                  DateTime.parse('2030-02-05'))
                                          .then((value) => DateText.text =
                                              // to convert date shape use intel libirary
                                              DateFormat.yMMMd()
                                                  .format(value!));
                                    }),
                              ],
                            ),
                          ),
                        ),
                        // to handle if we closed app from bottomsheet not from floatActionButton
                      )
                      .closed
                      .then((value) {
                    cubit.ChangeBottomSheet(false, Icons.edit);
                  });
                  cubit.ChangeBottomSheet(true, Icons.add);
                }
              },
            ),
            // to make bar in down to navigation
            bottomNavigationBar: BottomNavigationBar(
                // to know the item we stand on it
                currentIndex: cubit.currentindex,
                // function to change index with click on it
                onTap: (value) {
                  cubit.changeIndex(value);
                },
                // to make inimation in bar and must give each bottom background color in BottomNavigationItem in this type
                // we can make it fixed no inimate by replace shifiting with fixed and this type not need to give color to each element we can give one color to backgroundcolor in main BottomNavigationBar
                type: BottomNavigationBarType.shifting,
                // to give color to element we selected it
                selectedItemColor: SelectedItemColor,
                // to give color to each element we donot choose it
                unselectedItemColor: UnSelectedItemColor,
                // to give one back ground color to all bar when type is fixed
                // backgroundColor: Colors.grey[400],
                // to make list of itemes
                items: [
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.menu_rounded),
                      label: 'Tasks',
                      backgroundColor: appBarColor),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.done_outline_rounded),
                      label: 'Done',
                      backgroundColor: appBarColor),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.archive),
                      label: 'Archived',
                      backgroundColor: appBarColor),
                ]),
            body: Center(
              child: cubit.screen[cubit.currentindex],
            ),
            backgroundColor: appBodyColor,
          );
        },
      ),
    );
  }
}
