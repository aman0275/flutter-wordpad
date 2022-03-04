import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wp = WordPair.random();
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.cyan[100]),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  @override
  var nam = ["aman", "manjit", "intaz", "Sorab"];
  final saved = Set<String>();

  Widget _buildList() {
    return (ListView.builder(
      itemCount: 4,
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, item) {
        return _buildRow(nam[item], item);
      },
    ));
  }

  Widget _buildRow(String nu, int item) {
    final alreadythere = saved.contains(nu);
    return ListTile(
        leading: Icon(Icons.male),
        trailing: Icon(alreadythere ? Icons.favorite : Icons.favorite_border,
            color: alreadythere ? Colors.red[600] : null),
        onTap: () {
          setState(() {
            if (alreadythere) {
              saved.remove(nu);
            } else {
              saved.add(nu);
            }
          });
        },
        title: Text("Stud $item -> " + nu));
  }

  void _pushSaved() {}

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendence Shortage'),
        actions: <Widget>[
          IconButton(onPressed: _pushSaved, icon: Icon(Icons.list))
        ],
        centerTitle: true,
        backgroundColor: Colors.cyan[400],
      ),
      body: _buildList(),
    );
  }
}
