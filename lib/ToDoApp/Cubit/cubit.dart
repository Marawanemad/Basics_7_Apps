// ignore_for_file: non_constant_identifier_names

import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Colors.dart';
import '../moudules/archived.dart';
import '../moudules/done.dart';
import '../moudules/tasks.dart';
import 'state.dart';

// make class cubit to put in it all logic
class CubitApp extends Cubit<CubitAppState> {
  // declare the intialstate in this app
  CubitApp() : super(CubitIntialAppState());

  // make object to use any thing in these class easily in another classes
  static CubitApp get(context) => BlocProvider.of(context);
  int currentindex = 0;
// list to swirch between screen using current index
  List<Widget> screen = [
    const TasksScreen(),
    const DoneScreen(),
    const ArchivedScreen()
  ];
  // list to change name in appBar when change Screen
  List<String> ScreenNames = ["Tasks", "Done", "Archived"];
// to change floating action button icon
  IconData floatingIcon = Icons.edit;
// make flag to check pressed on floating action button
  bool sheetopened = false;

  void changeIndex(int value) {
    currentindex = value;
// make emit to know app this state happenned to update
    emit(ChangeScreensState());
  }

  void ChangeBottomSheet(bool sheetopened, IconData floatingIcon) {
    this.floatingIcon = floatingIcon;
    this.sheetopened = sheetopened;
    emit(ChangeBottomSheetState());
  }

  bool dark = true;
  IconData icon = Icons.dark_mode;
  SwitchButton(bool value) {
    dark = value;
    dark == true ? icon = Icons.dark_mode : icon = Icons.light_mode;

    color(dark: dark);

    emit(ColorChangeState());
  }

  Database? database;
  List<Map> NewTasks = [];
  List<Map> DoneTasks = [];
  List<Map> ArchivedTasks = [];

  void onCreateDataBase() {
    // to declare database variable with path and version
    openDatabase(
      'todo.db', version: 1,
// to make creation
      onCreate: (database, version) {
        database.execute(
            'CREATE TABLE tasks(id INTEGER PRIMARY KEY , title TEXT , date TEXT ,time TEXT, status TEXT)');
      },
      onOpen: (database) {
        getDataFromDataBase(database);
      },
    ).then((value) {
      database = value;
      emit(OnCreateDataBaseState());
    });
  }

  Future insertToDataBase({
    required String title,
    required String date,
    required String time,
  }) async {
    await database?.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks(title,date,time,status) VALUES("$title","$date","$time","new")')
          .then((value) {
        getDataFromDataBase(database);
        emit(InsertDataBaseState());
      });
    });
  }

  void getDataFromDataBase(database) {
// to make lists empty to add new elements without replication
    NewTasks = [];
    DoneTasks = [];
    ArchivedTasks = [];
    database!.rawQuery("SELECT * FROM tasks").then((value) {
// make for loop on each element and condition to know where store it
      value.forEach((element) {
        if (element['status'] == "new") {
          NewTasks.add(element);
        } else if (element['status'] == "done") {
          DoneTasks.add(element);
        } else {
          ArchivedTasks.add(element);
        }
      });

      emit(GetDataBaseState());
    });
  }

  void UpdateData({required String status, required int id}) async {
    database!.rawUpdate("UPDATE tasks SET status = ?  WHERE id = ?",
        [status, id]).then((value) {
      getDataFromDataBase(database);
      emit(UpdateDataState());
    });
  }

  void DeleteData({required int id}) async {
    database!.rawDelete("DELETE FROM tasks  WHERE id = ?", [id]).then((value) {
      getDataFromDataBase(database);
      emit(DeleteDataState());
    });
  }
}
