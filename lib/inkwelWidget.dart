import 'package:flutter/material.dart';

class inkwelWidget extends StatefulWidget {
  String buttomtext;
  Widget screen;
  inkwelWidget({Key? key, required this.buttomtext, required this.screen})
      : super(key: key);

  @override
  State<inkwelWidget> createState() => _inkwelWidgetState();
}

class _inkwelWidgetState extends State<inkwelWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        child: Container(
          width: double.infinity,
          color: Colors.teal,
          child: Center(
            child: Text(
              widget.buttomtext,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
        onTap: () {
          setState(() {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => widget.screen,
                ));
          });
        },
      ),
    );
  }
}
