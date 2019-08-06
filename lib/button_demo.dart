import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Button'),
          onPressed: () {},
          //溅墨效果
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          label: Text('Button'),
          icon: Icon(Icons.add),
          onPressed: () {},
          //溅墨效果
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );



    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: Theme.of(context).buttonTheme.copyWith(
                  textTheme: ButtonTextTheme.primary,
                  buttonColor: Theme.of(context).accentColor,
//                  shape: BeveledRectangleBorder(
//            borderRadius: BorderRadius.circular(12.0),
//            )
                  shape: StadiumBorder())

//              buttonTheme: ButtonThemeData(
//                textTheme: ButtonTextTheme.primary,
////            shape: BeveledRectangleBorder(
////              borderRadius: BorderRadius.circular(12.0),
////            )
//                shape: StadiumBorder(),
//              ),
          ),
          child: RaisedButton(
            child: Text('Button'),
            onPressed: () {},
            //溅墨效果
            splashColor: Colors.grey,
            elevation: 0.0,
//          color: Theme.of(context).accentColor,
//          textColor: Colors.white,
//          textTheme: ButtonTextTheme.primary,
//          textColor: Theme
//              .of(context)
//              .accentColor,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        RaisedButton.icon(
          label: Text('Button'),
          icon: Icon(Icons.add),
          onPressed: () {},
          //溅墨效果
          splashColor: Colors.grey,
          elevation: 12.0,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );




    //描边按钮
    final Widget outLineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: Theme.of(context).buttonTheme.copyWith(
                  textTheme: ButtonTextTheme.primary,
                  buttonColor: Theme.of(context).accentColor,
                  shape: StadiumBorder())),
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            //溅墨效果
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        OutlineButton.icon(
          label: Text('Button'),
          icon: Icon(Icons.add),
          onPressed: () {},
          //溅墨效果
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );



    final Widget expandedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 160.0,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            //溅墨效果
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          flex: 2,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            //溅墨效果
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        )
      ],
    );




    Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: Theme.of(context).buttonTheme.copyWith(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
            ),
          ),
          child: ButtonBar(
            children: <Widget>[
              OutlineButton(
                child: Text('Button'),
                onPressed: () {},
                //溅墨效果
                splashColor: Colors.grey[100],
                borderSide: BorderSide(color: Colors.black),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
              OutlineButton(
                child: Text('Button'),
                onPressed: () {},
                //溅墨效果
                splashColor: Colors.grey[100],
                borderSide: BorderSide(color: Colors.black),
                textColor: Colors.black,
                highlightedBorderColor: Colors.grey,
              ),
            ],
          ),
        )
      ],
    );




    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            flatButtonDemo,
            raisedButtonDemo,
            outLineButtonDemo,
            expandedButtonDemo,
            buttonBarDemo
          ],
        ),
      ),
    );
  }
}