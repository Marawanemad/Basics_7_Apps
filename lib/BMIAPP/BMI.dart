import 'dart:math';

import 'package:basicapps/BMIAPP/BmiSecondPage.dart';
import 'package:flutter/material.dart';

import 'floatingbutton.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  // variables to use in different places in app code
  int weight = 50;
  int age = 20;
  double height = 120;
  int male = 0;
  @override
  Widget build(BuildContext context) {
    // Scaffold to show and design page
    return Scaffold(
      // make bar in top of app
      appBar: AppBar(
        // to make title in bar in the center
        title: const Center(
          child: Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      // make body of app
      // container to give colour to background page,
      body: Container(
        color: Colors.blueGrey[800],
        // dived container to column to take widget vertically
        child: Column(children: [
          // expanded to divided widgets by equality
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              // make row to take widget horizontally
              child: Row(
                children: [
                  Expanded(
                    // gestureDetector to make container dynamic to press on it
                    child: GestureDetector(
                      onTap: () {
                        // seState use to make change appear on app screen without restart app
                        setState(() {
                          male = 1;
                        });
                      },
                      child: Container(
                        // boxDecoration use to design container
                        decoration: BoxDecoration(
                          // to make border circular
                          borderRadius: BorderRadius.circular(15),
                          color: male == 1
                              ? Colors.pinkAccent[400]
                              : Colors.blueGrey[900],
                        ),
                        child: Column(
                          // to make widget in center
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            // to create icon
                            Icon(
                              Icons.male,
                              size: 60,
                              color: Colors.white,
                            ),
                            // to make white space
                            SizedBox(),
                            Text(
                              "MALE",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          male = 2;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: male == 2
                              ? Colors.pinkAccent[400]
                              : Colors.blueGrey[900],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.female,
                              size: 60,
                              color: Colors.white,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "FEMALE",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.blueGrey[900],
                ),
                padding: const EdgeInsets.all(30),
                width: double.infinity,
                child: Column(
                  children: [
                    const Text(
                      "HEIGHT",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${double.parse(height.toStringAsFixed(2))}",
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 50),
                        ),
                        const Text(
                          "cm",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Slider(
                      value: height,
                      min: 50,
                      max: 220,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      },
                      activeColor: Colors.pinkAccent[400],
                      thumbColor: Colors.pinkAccent[400],
                      inactiveColor: Colors.white70,
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueGrey[900],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Weight",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            // $ to put changeable number to print it
                            "$weight",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // call floatingactionbutton to make age- buttons
                                button(
                                    herotag: 'weight-',
                                    icons: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                    function: () {
                                      setState(() {
                                        weight--;
                                        weight < 0 ? weight = 0 : weight;
                                      });
                                    },
                                    // to confirm make value not has null
                                    background: Colors.pinkAccent[400]!),
                                const SizedBox(
                                  width: 5,
                                ),
                                // call floatingactionbutton to make age- buttons
                                button(
                                    herotag: 'weight+',
                                    icons: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                    function: () {
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                    background: Colors.pinkAccent[400]!)
                              ])
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueGrey[900],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Age",
                            style: TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            "$age",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // call floatingactionbutton to make age- buttons
                                button(
                                  herotag: 'age-',
                                  icons: const Icon(
                                    Icons.remove,
                                    color: Colors.white,
                                  ),
                                  function: () {
                                    setState(() {
                                      age--;
                                      age < 0 ? age = 0 : age;
                                    });
                                  },
                                  background: Colors.pinkAccent[400]!,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                // call floatingactionbutton to make age+ button
                                button(
                                  herotag: 'age+',
                                  icons: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  function: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  background: Colors.pinkAccent[400]!,
                                ),
                              ])
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            // to make width of container = width of phone screen
            width: double.infinity,
            height: 60,
            color: Colors.pinkAccent[400],
            child: MaterialButton(
              onPressed: () {
                double result = weight / pow(height / 100, 2);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BmiSecondPage(
                          age: age,
                          height: height,
                          result: result,
                          male: male,
                          weight: weight),
                    ));
              },
              height: 60,
              child: const Text(
                "Calculate",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
