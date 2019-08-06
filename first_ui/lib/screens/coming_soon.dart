import 'package:flutter/material.dart';

// Coming soon page for multi-purpose

class ComingSoonScreen extends StatefulWidget {
  @override
  _ComingSoonScreenState createState() => new _ComingSoonScreenState();
}

class _ComingSoonScreenState extends State<ComingSoonScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            child: Icon(
              Icons.info_outline,
              size: 35,
            ),
          ),
          Text(
            'Coming soon~!',
            style: TextStyle(
              fontSize: 16,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
