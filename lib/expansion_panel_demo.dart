import 'package:flutter/material.dart';

class ExpansionPanelItem {
  final String headerText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({this.headerText, this.body, this.isExpanded});
}

//收缩面板
class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() {
    return _ExpansionPanelDemoState();
  }
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
//  bool _isExpanded = false;

  List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText:'Panel A' ,
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel A.'),
        ),
        isExpanded: false
      ),
      ExpansionPanelItem(
        headerText:'Panel B' ,
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel B.'),
        ),
          isExpanded: false
      ),
      ExpansionPanelItem(
        headerText:'Panel C' ,
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for Panel C.'),
        ),
          isExpanded: false
      ),
    ];
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
              //panelIndex被点击面板的索引号
              expansionCallback: (int panelIndex, bool isExpanded) {
                setState(() {
                  _expansionPanelItems[panelIndex].isExpanded = !isExpanded;
                });
              },
                //map迭代
              children:_expansionPanelItems.map(
                  (ExpansionPanelItem item){

                    return ExpansionPanel(
                      isExpanded: item.isExpanded,
                      body: item.body,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return Container(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            item.headerText,
                            style: Theme.of(context).textTheme.title,
                          ),
                        );
                      },
                    );
                  }
              ).toList()
            ),
          ],
        ),
      ),
    );
  }
}

//[
//ExpansionPanel(
//headerBuilder:
//body: Container(
//width: double.infinity,
//padding: EdgeInsets.all(16.0),
//child: Text('Content for Panel A.'),
//),
////默认不展开
//isExpanded: _isExpanded,
//),
//],