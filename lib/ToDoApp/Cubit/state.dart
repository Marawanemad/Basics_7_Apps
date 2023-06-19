// make abstract class to make States of app
abstract class CubitAppState {}

// declare the intial state
class CubitIntialAppState extends CubitAppState {}

class ColorChangeState extends CubitAppState {}

// declare the state that know change happened in currentindex of screens
class ChangeScreensState extends CubitAppState {}

class OnCreateDataBaseState extends CubitAppState {}

class GetDataBaseState extends CubitAppState {}

class InsertDataBaseState extends CubitAppState {}

class ChangeBottomSheetState extends CubitAppState {}

class UpdateDataState extends CubitAppState {}

class DeleteDataState extends CubitAppState {}
