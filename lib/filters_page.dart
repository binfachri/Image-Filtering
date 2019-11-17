import 'package:flutter/material.dart';
import 'dart:io';

class FilterPage extends StatefulWidget {
  final File image;

  FilterPage({Key key, @required this.image}) : super(key : key);

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        leading: GestureDetector(
          onTap: () {},
          child: Icon(Icons.menu),
        ),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.more_horiz),
            ),
          )
        ],
      ),
      body: Center(
        child: Image.file(widget.image),
      ),
      persistentFooterButtons: <Widget>[
        
      ],
    );
  }
}
