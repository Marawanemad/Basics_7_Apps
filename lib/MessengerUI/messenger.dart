import 'package:flutter/material.dart';

import 'Stories.dart';
import 'messege.dart';

class Messenger extends StatelessWidget {
  const Messenger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(
                    "https://www.whatsappimages.in/wp-content/uploads/2021/07/Top-HD-sad-quotes-for-whatsapp-status-in-hindi-Pics-Images-Download-Free.gif"),
              ),
              SizedBox(width: 15),
              Text("Chats",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[850],
                child: const Icon(
                  Icons.camera_alt_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              )),
          IconButton(
              onPressed: () {},
              icon: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey[850],
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 20,
                ),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[850],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Search",
                        style: TextStyle(color: Colors.grey[400]),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 100.0,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const Stories(),
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 15),
                  itemCount: 10,
                ),
              ),
              const SizedBox(height: 10),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => const Messege(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
