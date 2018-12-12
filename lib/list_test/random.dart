import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new RandomWordsState();
}

class RandomWordsState extends State<RandomWords> {
  //在Dart语言中使用下划线前缀标识符，会强制其变成私有的。
  final _suggestions = <WordPair>[];
  final _saved = new Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold (
      appBar: new AppBar(
        title: new Text("Startup Name Generator"),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.list),
              onPressed: _pushSaved),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved() {
    Navigator.of(context).push(
      new MaterialPageRoute(
          builder: (context) {
            final tiles = _saved.map(
                  (pair) {
                return new ListTile(
                  title: new Text(
                    pair.asPascalCase,
                    style: _biggerFont,
                  ),
                );
              },
            );
            final divided = ListTile.divideTiles(
                context: context,
                tiles: tiles)
                .toList();
            return new Scaffold(
              appBar: new AppBar(
                title: new Text('Saved Suggestions'),
              ),
              body: new ListView(children: divided),
            );
          }
      ),
    );
  }

  Widget _buildSuggestions() {
    padding:
    const EdgeInsets.all(16.0);
    return new ListView.builder(itemBuilder: (context, i) {
      if (i.isOdd) return new Divider();
      //"i  ~/ 2"表示i除以2，但返回值是整形(向下取整)
      //这可以计算出ListView中减去分隔线后的实际单词对数量
      final index = i ~/ 2;
      //如果是建议列表中最后一个单词对
      if (index >= _suggestions.length) {
        //生成10个
        _suggestions.addAll(generateWordPairs().take(10));
      }
      return _buildRow(_suggestions[index]);
    });
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    return new ListTile(
      title: new Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _saved.remove(pair);
          } else {
            _saved.add(pair);
          }
        });
      },
    );
  }
}