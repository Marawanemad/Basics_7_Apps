import 'package:flutter/material.dart';

class BmiSecondPage extends StatelessWidget {
  final int weight;
  final int age;
  final double height;
  final int male;
  final double result;
  const BmiSecondPage(
      {Key? key,
      required this.age,
      required this.height,
      required this.male,
      required this.weight,
      required this.result})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text("BMI Result"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.blueGrey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "GENDER : ${male == 1 ? "Male" : "Female"}",
              style: const TextStyle(fontSize: 25, color: Colors.white),
            ),
            const SizedBox(height: 20),
            Text("AGE : $age",
                style: const TextStyle(fontSize: 25, color: Colors.white)),
            const SizedBox(height: 20),
            Text("WEIGHT : $weight",
                style: const TextStyle(fontSize: 25, color: Colors.white)),
            const SizedBox(height: 20),
            Text("HEIGHT : ${double.parse((height).toStringAsFixed(2))}",
                style: const TextStyle(fontSize: 25, color: Colors.white)),
            const SizedBox(height: 20),
            // to get to digit in double number
            Text("BMI : ${double.parse((result).toStringAsFixed(2))}",
                style: const TextStyle(fontSize: 25, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
