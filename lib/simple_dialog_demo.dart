import 'package:flutter/material.dart';
import 'dart:async';

enum Option{
  A,B,C
}

class SimpleDiologDemo extends StatefulWidget {
  @override
  _SimpleDiologDemoState createState() {
    return _SimpleDiologDemoState();
  }
}

class _SimpleDiologDemoState extends State<SimpleDiologDemo> {

  String _choice = 'Noting';


  Future _openSimpleDiolog() async {
  final optopn =  await showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text('SimpleDiolog'),
            children: <Widget>[
              SimpleDialogOption(
                 child: Text('选项1'),
                 onPressed: (){
                   Navigator.of(context).pop(Option.A);
                 },

              ),
              SimpleDialogOption(
                child: Text('选项2'),
                onPressed: (){
                  Navigator.of(context).pop(Option.B);
                },

              ),
              SimpleDialogOption(
                child: Text('选项3'),
                onPressed: (){
                  Navigator.of(context).pop(Option.C);
                },

              ),
            ],
          );
        });

        switch(optopn){

          case Option.A:
            setState(() {
              _choice = 'A';
            });
            break;
          case Option.B:
            setState(() {
              _choice = 'B';
            });
            break;
          case Option.C:
            setState(() {
              _choice = 'C';
            });
            break;
           default:
        }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('SimpleDiologDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('你选择的是${_choice}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.format_list_numbered), onPressed: _openSimpleDiolog),
    );
  }
}
