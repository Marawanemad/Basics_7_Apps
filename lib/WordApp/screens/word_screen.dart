import 'package:flutter/material.dart';

import '../modal/wordmodal.dart';
import '../widgets/bottomsheet_widget.dart';
import '../widgets/word_widget.dart';

class WordScreen extends StatefulWidget {
  const WordScreen({Key? key}) : super(key: key);

  @override
  State<WordScreen> createState() => _WordScreenState();
}

class _WordScreenState extends State<WordScreen> {
  final List<WordModel> words = [];
  bool isDeleted = false;
  void deleteWord(String id) {
    setState(() {
      words.removeWhere((element) => element.id == id);
    });
  }

  void addWord(WordModel word) {
    setState(() {
      words.add(word);
    });
    Navigator.of(context).pop();
  }

  showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheetWidget(addWord: addWord),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Word App",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isDeleted = !isDeleted;
              });
            },
            icon: isDeleted ? const Icon(Icons.done) : const Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: ((context, index) => WordTile(
                title: words[index].word,
                description: words[index].description,
                trailing: isDeleted
                    ? IconButton(
                        onPressed: () => deleteWord(words[index].id),
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.red,
                        ))
                    : const SizedBox(),
              )),
          itemCount: words.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showBottomSheet,
        child: const Icon(Icons.add),
      ),
    );
  }
}
