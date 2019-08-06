import 'package:flutter/material.dart';
import 'dart:async';

enum action {
  OK,
  Cancel
}

class AlertDialogDemo extends StatefulWidget {
  @override
  _AlertDialogDemoState createState() {
    return _AlertDialogDemoState();
  }
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {

  String _choice = 'Noting';

  Future _openAlertDialog() async {
    final actions = await showDialog(
        context: context,
        //点击空白处不收回
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDialog'),
            content: Text('Are you sure about this?'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context, action.Cancel);
                },
              ),
              FlatButton(
                child: Text('ok'),
                onPressed: () {
                  Navigator.pop(context, action.OK);
                },
              ),

            ],


          );
        });

    switch (actions) {
      case action.OK:
        setState(() {
          _choice = 'OK';
        });
        break;
      case action.Cancel:
        setState(() {
          _choice = 'Cancel';
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
        title: Text('AlertDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('your choice is ${_choice}'),
            SizedBox(
              height: 32.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Open AlertDialog'),
                  onPressed: _openAlertDialog,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
