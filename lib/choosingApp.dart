import 'package:basicapps/inkwelWidget.dart';
import 'package:flutter/material.dart';

import 'BMIAPP/BMI.dart';
import 'MessengerUI/Messenger.dart';
import 'LoginApp/LoginApp.dart';
import 'ShoppApp/Pages/ShopHome.dart';
import 'ToDoApp/moudules/todoHome.dart';
import 'WordApp/screens/word_screen.dart';
import 'firstApp/FirstApp.dart';

class ChooseApp extends StatefulWidget {
  const ChooseApp({super.key});

  @override
  State<ChooseApp> createState() => _ChooseAppState();
}

class _ChooseAppState extends State<ChooseApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Choose Your App",
          style: TextStyle(
              color: Colors.teal[400],
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(70.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inkwelWidget(buttomtext: "First App", screen: const FirstApp()),
              const SizedBox(
                height: 20,
              ),
              inkwelWidget(buttomtext: "Shop App", screen: const ShopHome()),
              const SizedBox(
                height: 20,
              ),
              inkwelWidget(
                  buttomtext: "Messenger App \n(UI)",
                  screen: const Messenger()),
              const SizedBox(
                height: 20,
              ),
              inkwelWidget(buttomtext: "Word App", screen: const WordScreen()),
              const SizedBox(
                height: 20,
              ),
              inkwelWidget(buttomtext: "Login App", screen: const LoginApp()),
              const SizedBox(
                height: 20,
              ),
              inkwelWidget(
                  buttomtext: "BMI Calculator App", screen: const Bmi()),
              const SizedBox(
                height: 20,
              ),
              inkwelWidget(buttomtext: "To Do App", screen: const todoHome()),
            ],
          ),
        ),
      ),
    );
  }
}
