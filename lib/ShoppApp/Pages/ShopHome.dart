import 'package:flutter/material.dart';

import '../Data/Data.dart';
import '../Widgets/CardData.dart';
import '../Widgets/Cards.dart';

class ShopHome extends StatefulWidget {
  const ShopHome({Key? key}) : super(key: key);

  @override
  State<ShopHome> createState() => _ShopHomeState();
}

class _ShopHomeState extends State<ShopHome> {
  final List<Data> words = [];

  void add(Data word) {
    setState(() {
      words.add(word);
    });
    Navigator.of(context).pop();
  }

  showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Cards(add: add),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 55, 130),
        title: const Text(
          "MyShop",
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
        actions: [
          GestureDetector(
            child:
                (const Icon(Icons.card_giftcard_outlined, color: Colors.white)),
            onTap: () {
              Navigator.pushNamed(context, '/Products',
                  arguments: {"words": words});
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: ((context, index) => CardData(
                id: words[index].id,
                title: words[index].title,
                description: words[index].description,
                price: words[index].price,
                url: words[index].url,
              )),
          itemCount: words.length,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 165, 55, 130),
          onPressed: showBottomSheet,
          child: const Text("add")),
    );
  }
}
