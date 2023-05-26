import 'package:flutter/material.dart';

class FirstApp extends StatefulWidget {
  const FirstApp({Key? key}) : super(key: key);

  @override
  State<FirstApp> createState() => _FirstAppState();
}

class _FirstAppState extends State<FirstApp> {
  void datetime() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Center(
            child: Text(
              "CV",
              style: TextStyle(fontSize: 25, color: Colors.blue),
            ),
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () => datetime(),
                icon: const Icon(Icons.date_range)),
            const CircleAvatar(
              radius: 60,
              child: Icon(Icons.image),
            ),
            const SizedBox(height: 20),
            const Text(
              "Marawan",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
            // to draw line
            const Divider(
              color: Colors.grey,
              thickness: 2,
              indent: 100,
              endIndent: 100,
              height: 30,
            ),
            const Card(
              elevation: 7,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "01008676346",
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
