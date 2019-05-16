import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sct/ui/MyDrawer.dart';
import 'package:flutter_sct/ui/MyDrawer.dart';
import 'package:flutter_sct/ui/detail.dart';
import 'package:flutter_sct/walletmenu.dart';

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18.0);
  final _save = new Set<WordPair>();

  /**
   * 创建主容器
   */
  @override
  Widget build(BuildContext context) {
    //final wordPair = new WordPair.random();
    //return new Text(wordPair.asPascalCase);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Startup Name Generator"),
        actions: <Widget>[
          new IconButton(icon: new Icon(Icons.list), onPressed: _pushSaved)
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  /**
   * 创建item view
   */
  Widget _buildRow(WordPair suggestion) {
    final alreadySaved = _save.contains(suggestion);
    return new ListTile(
      title: new Text(
        suggestion.asPascalCase,
        style: _biggerFont,
      ),
      trailing: new Icon(
        alreadySaved ? Icons.favorite : Icons.favorite_border,
        color: alreadySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (alreadySaved) {
            _save.remove(suggestion);
          } else {
            _save.add(suggestion);
          }
        });
      },
    );
  }

  /**
   * 创建listview
   */
  Widget _buildSuggestions() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        // 对于每个建议的单词对都会调用一次itemBuilder，然后将单词对添加到ListTile行中
        // 在偶数行，该函数会为单词对添加一个ListTile row.
        // 在奇数行，该函数会添加一个分割线widget，来分隔相邻的词对。
        // 注意，在小屏幕上，分割线看起来可能比较吃力。
        itemBuilder: (context, i) {
          // 在每一列之前，添加一个1像素高的分隔线widget
          if (i.isOdd) return new Divider();
          // 语法 "i ~/ 2" 表示i除以2，但返回值是整形（向下取整），比如i为：1, 2, 3, 4, 5
          // 时，结果为0, 1, 1, 2, 2， 这可以计算出ListView中减去分隔线后的实际单词对数量
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            // ...接着再生成10个单词对，然后添加到建议列表
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  /**
   * 保存收藏
   */
  void _pushSaved() {
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (context) {
          //return new WalletMenuState();
          return new WalletDetail();
        }
        )
    );
//    Navigator.of(context).push(
//      new MaterialPageRoute(
//          builder:(context){
//            final tiles=_save.map(
//                (pair){
//                  return new ListTile(
//                    title: new Text(
//                      pair.asPascalCase,
//                      style: _biggerFont,
//                    ),
//                  );
//                }
//            );
//            final divided= ListTile
//            .divideTiles(
//                context: context,
//                tiles: tiles,
//            )
//            .toList();
//
//            return new Scaffold(
//              appBar: new AppBar(
//                title: new Text("我的收藏夹"),
//              ),
//              body: new ListView(children:divided),
//            );
//          }
//      ),
//    );
  }
}
