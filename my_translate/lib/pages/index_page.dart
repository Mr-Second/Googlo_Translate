import 'package:flutter/material.dart';
import '../pages/drawer_page.dart';
import '../pages/body_page.dart';
import '../pages/textfield_page.dart';
import '../pages/recording_page.dart';

class IndexPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      child: Scaffold
      (
        appBar: AppBar(
          title: Text('Googlo Translate'),
          elevation: 0.0,
        ),
        body: Column(
          children: <Widget>[
            IndexBody(),
            TextFieldPage(),
            Container(height: 10,),
            RecordingTranslate(),
          ],
        ),
        drawer: DrawerPage(),
      ),
    );
  }
}