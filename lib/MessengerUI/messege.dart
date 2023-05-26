import 'package:flutter/material.dart';

class Messege extends StatelessWidget {
  const Messege({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: const [
          CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(
                "https://www.whatsappimages.in/wp-content/uploads/2021/07/Top-HD-sad-quotes-for-whatsapp-status-in-hindi-Pics-Images-Download-Free.gif"),
          ),
          CircleAvatar(
            radius: 8.3,
            backgroundColor: Colors.black,
          ),
          CircleAvatar(
            radius: 7,
            backgroundColor: Colors.green,
          ),
        ],
      ),
      const SizedBox(
        width: 10,
      ),
      // to stop overflow error without make scroll
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Names of Users ",
              style: TextStyle(color: Colors.grey[500], fontSize: 20),
              maxLines: 1,
              // to put ... to know the text not ended
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Messege........ ",
                    style: TextStyle(color: Colors.grey[500], fontSize: 15),
                    maxLines: 1,
                    // to put ... to know the text not ended
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "oct 16 ",
                  style: TextStyle(color: Colors.grey[500], fontSize: 20),
                )
              ],
            ),
          ],
        ),
      ),
    ]);
  }
}
