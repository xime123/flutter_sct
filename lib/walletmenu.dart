import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class WalletMenuState extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "测试",
      home: new Scaffold(
        body: new ListView(
          children: <Widget>[
            new ListTile(
              leading: new Icon(Icons.photo_camera),
              title:new Text("扫一扫"),
            ),
            new ListTile(
              leading: new Icon(Icons.account_balance_wallet),
              title:new Text("创建钱包"),
            ),
          ],
        ),
      ),
    );
  }


}