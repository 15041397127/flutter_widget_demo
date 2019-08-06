import 'package:flutter/material.dart';

class BottomNavagtionBarDemo extends StatefulWidget {
  @override
  _BottomNavagtionBarDemoState createState() {
    return _BottomNavagtionBarDemoState();
  }
}

class _BottomNavagtionBarDemoState extends State<BottomNavagtionBarDemo> {
  int _currentIndex  =  0;

  void _onTapHandler (int index){
     setState(() {
       _currentIndex = index;
     });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(

      currentIndex: _currentIndex,
      onTap:(int index){
        _onTapHandler(index);
      },
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.black,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.explore),
          title: Text('Explore'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.history),
          title: Text('History'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list),
          title: Text('List'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          title: Text('My'),
        ),
      ],
    );
  }
}