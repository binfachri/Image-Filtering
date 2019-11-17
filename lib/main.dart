import 'package:flutter/material.dart';
import 'gallery_grid_view_widget.dart';

void main() => runApp(FilterApp());

class FilterApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.black,
        fontFamily: 'Roboto',
      ),
      home: MyHomePage(title: 'All Images'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Center(
        child: GalleryGridView(),
      ),
    );
  }

  Widget _appBar() {
    return AppBar(
      title: Text(widget.title),
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
    );
  }
}
