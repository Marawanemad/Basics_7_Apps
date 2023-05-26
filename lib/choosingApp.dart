import 'package:flutter/material.dart';

import 'BMIAPP/BMI.dart';
import 'MessengerUI/Messenger.dart';
import 'LoginApp/LoginApp.dart';
import 'ShoppApp/Pages/ShopHome.dart';
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
              Expanded(
                child: InkWell(
                  child: Container(
                    color: Colors.teal,
                    width: double.infinity,
                    child: const Center(
                      child: Text(
                        "First App",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const FirstApp(),
                          ));
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    color: Colors.teal,
                    child: const Center(
                      child: Text(
                        "Shop App",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ShopHome(),
                          ));
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    color: Colors.teal,
                    child: const Center(
                      child: Text(
                        "Messenger App\n(UI)",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Messenger(),
                          ));
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    color: Colors.teal,
                    child: const Center(
                      child: Text(
                        "Word App",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WordScreen(),
                          ));
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    color: Colors.teal,
                    child: const Center(
                      child: Text(
                        "Login App",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginApp(),
                          ));
                    });
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: InkWell(
                  child: Container(
                    width: double.infinity,
                    color: Colors.teal,
                    child: const Center(
                      child: Text(
                        "BMI Calculator App",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Bmi(),
                          ));
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
