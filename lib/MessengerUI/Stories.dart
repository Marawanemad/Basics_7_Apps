import 'package:flutter/material.dart';

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: const [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://www.whatsappimages.in/wp-content/uploads/2021/07/Top-HD-sad-quotes-for-whatsapp-status-in-hindi-Pics-Images-Download-Free.gif"),
              ),
              CircleAvatar(
                radius: 7,
                backgroundColor: Colors.black,
              ),
              CircleAvatar(
                radius: 6,
                backgroundColor: Colors.green,
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            "Names of Users ",
            style: TextStyle(color: Colors.white),
            maxLines: 2,
            // to put ... to know the text not ended
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
