import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GLobalProvider with ChangeNotifier {
  bool _isTodo = true;

  bool get isTodo => _isTodo;
  set isTodo(
    bool value,
  ) {
    _isTodo = value;
    notifyListeners();
  }

  bool _isPickDate = false;

  bool get isPickDate => _isPickDate;
  set isPickDate(
    bool value,
  ) {
    _isPickDate = value;
    notifyListeners();
  }

  bool _isPickTime = false;

  bool get isPickTime => _isPickTime;
  set isPickTime(
    bool value,
  ) {
    _isPickTime = value;
    notifyListeners();
  }

  bool _todaytime = false;

  bool get todaytime => _todaytime;
  set todaytime(
    bool value,
  ) {
    _todaytime = value;
    notifyListeners();
  }

  bool _iswriting = false;

  bool get iswriting => _iswriting;
  set iswriting(
    bool value,
  ) {
    _iswriting = value;
    notifyListeners();
  }

  bool _isPopupBottomSheet = false;

  bool get isPopupBottomSheet => _isPopupBottomSheet;
  set isPopupBottomSheet(bool value) {
    _isPopupBottomSheet = value;
    notifyListeners();
  }

  bool _isTodoTaskVisible = true;

  bool get isTodoTaskVisible => _isTodoTaskVisible;
  set isTodoTaskVisible(bool value) {
    _isTodoTaskVisible = value;
    notifyListeners();
  }

  bool _isDoneTaskVisible = true;

  bool get isDoneTaskVisible => _isDoneTaskVisible;
  set isDoneTaskVisible(bool value) {
    _isDoneTaskVisible = value;
    notifyListeners();
  }

  final List _listTodoCard = [];
  final List _listDoneCard = [];
  final List _listTodayCard = [];
  final List _listDoneTodayCard = [];
//void addTodoCard
  void addTodoCard(String taskC, String time, String date, bool isPickDate,
      bool isPickTime) {
    _listTodoCard.add({
      "task": taskC,
      "time": time,
      "date": date,
      "isPickTime": isPickTime,
      "isPickDate": isPickDate,
    });
    notifyListeners();
  }

  List get listTodoCard => _listTodoCard;

  //void removeTodoCard
  void removeTodoCard(int index) {
    _listTodoCard.removeAt(index);
    notifyListeners();
  }

//void addDoneCard
  void addDoneCard(String taskC, String time, String date, bool isPickDate,
      bool isPickTime) {
    _listDoneCard.add({
      "task": taskC,
      "time": time,
      "date": date,
      "isPickTime": isPickTime,
      "isPickDate": isPickDate,
    });
    notifyListeners();
  }

  List get listDoneCard => _listDoneCard;

//void removeDoneCard
  void removeDoneCard(int index) {
    _listDoneCard.removeAt(index);
    notifyListeners();
  }

//void addTodayCard
  void addTodayCard(String taskC, String time, bool isPickTime) {
    _listTodayCard.add({
      "task": taskC,
      "time": time,
      "isPickTime": isPickTime,
    });
    notifyListeners();
  }

  List get listTodayCard => _listTodayCard;

  //void removeTodayCard
  void removeTodayCard(int index) {
    _listTodayCard.removeAt(index);
    notifyListeners();
  }

//void removeTodayCard
  void clearAllTodayTask() {
    _listTodayCard.clear();
    notifyListeners();
  }

//void addDoneTodayCard
  void addDoneTodayCard(String taskC, String time, bool isPickTime) {
    _listDoneTodayCard.add({
      "task": taskC,
      "time": time,
      "isPickTime": isPickTime,
    });
    notifyListeners();
  }

  List get listDoneTodayCard => _listDoneTodayCard;

  //void removeTodayCard
  void removeDoneTodayCard(int index) {
    _listDoneTodayCard.removeAt(index);
    notifyListeners();
  }

//void removeTodayCard
  void clearAllDoneTodayTask() {
    _listDoneTodayCard.clear();
    notifyListeners();
  }

//void removeDoneTask
  void clearAllDoneTask() {
    _listDoneCard.clear();
    notifyListeners();
  }

  //void editTodoCard

  void editTodoCard(String taskC, String time, String date, bool isPickDate,
      int index, bool isPickTime) {
    _listTodoCard.removeAt(_listTodoCard[index]);
    _listTodoCard.add({
      "task": taskC,
      "time": time,
      "date": date,
      "isPickTime": isPickTime,
      "isPickDate": isPickDate,
    });
    notifyListeners();
  }

  DateTime date = DateTime.now();
  String selectedDate = "Pick date";
  pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: date, // Refer step 1
        firstDate: DateTime(2000),
        lastDate: DateTime(2025),
        errorFormatText: "Please input correct date");
    if (pickedDate != null && pickedDate != date) {
      date = pickedDate;
      var dateNow = DateFormat.MMMd().format(date);

      _isPickDate = true;
      selectedDate = dateNow;
    }

    notifyListeners();
  }

  TimeOfDay time = TimeOfDay.now();
  String selectedTime = "Pick time";

  pickTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: time,
    );

    if (pickedTime != null && pickedTime != time) {
      time = pickedTime;

      _isPickTime = true;
      selectedTime = "${pickedTime.hour}:${pickedTime.minute}";
    }
    notifyListeners();
  }
}
