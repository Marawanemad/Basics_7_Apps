import 'package:flutter/material.dart';

class WordTile extends StatelessWidget {
  final String title;
  final String description;
  final Widget trailing;

  const WordTile({
    required this.title,
    required this.description,
    required this.trailing,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(title.substring(0, 1).toUpperCase()),
        ),
        title: Text(title),
        subtitle: Text(
          description,
          textAlign: TextAlign.justify,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        ),
        isThreeLine: true,
        trailing: trailing,
      ),
    );
  }
}
