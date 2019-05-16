import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WalletDetail extends StatelessWidget {
  BuildContext mContext;

  @override
  Widget build(BuildContext context) {
    Widget titleSection = _buildTitle();
    Widget btnSection = _buildBtnSection();
    Widget textSection = _buildText();
    mContext = context;
    var img = Image.asset(
      './images/cover_img.jpg',
      width: 600.0,
      height: 204.0,
      fit: BoxFit.cover,
    );
    return new MaterialApp(

      home: new Scaffold(

        body: new ListView(children: [
          img,
          titleSection,
          btnSection,
          textSection
        ]),
      ),
    );
  }

  Widget _buildTitle() {
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    'Oeschinen Lake Campground',
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                new Text(
                  'Kandersteg, Switzerland',
                  style: new TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          new Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          new Text("14")
        ],
      ),
    );
  }

  Column _buildColumn(IconData icon, String label) {
    Color color = Colors.blue[500];
    return new Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        new Icon(icon, color: color),
        new Container(
          margin: const EdgeInsets.only(top: 8.0),
          child: new Text(
            label,
            style: new TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildBtnSection() {
    return new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildColumn(Icons.call, "打电话"),
          _buildColumn(Icons.near_me, "联系我们"),
          _buildColumn(Icons.share, "分享")
        ],
      ),
    );
  }

  Widget _buildText() {
    return new Container(
      padding: const EdgeInsets.all(32.0),
      child: new Text(
        '''
Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. A gondola ride from Kandersteg, followed by a half-hour walk through pastures and pine forest, leads you to the lake, which warms to 20 degrees Celsius in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.
        ''',
        softWrap: true,
      ),
    );
  }
}
