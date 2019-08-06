import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() {
    return _ChipDemoState();
  }
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banna',
    'Lemon'
  ];

  String _action = 'Noting';

  List<String> _selected =[];

  String _choice = 'Lemon';


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //自动平分换行
            Wrap(
              spacing: 50.0,
              runSpacing: 20.0,
              children: <Widget>[
                Chip(label: Text('left')),

                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.red,
                ),

                Chip(
                  label: Text('zhangXu'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('旭'),
                  ),
                ),

                Chip(
                  label: Text('zhangXu'),
                  avatar: CircleAvatar(
                   backgroundImage: NetworkImage(
                     'https://gss0.bdstatic.com/94o3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike220%2C5%2C5%2C220%2C73/sign=67b1299caaec08fa320d1bf538875608/d62a6059252dd42ab8868c88093b5bb5c9eab802.jpg'
                   ),

                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: (){

                  },
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'Remove this tag',

                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                  //向两边缩进
                  indent: 32.0,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return Chip(
                        label: Text(tag),
                        onDeleted: (){
                          setState(() {
                           _tags.remove(tag);

                          });
                        },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.grey,
                  height: 32.0,
                  //向两边缩进
                  indent: 32.0,
                ),
                Container(width: double.infinity,child:Text('ActionClip:$_action') ,),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return ActionChip(
                      label: Text(tag),
                      onPressed: (){
                         setState(() {

                           _action= tag;
                         });
                      },
                    );
                  }).toList(),
                ),

                Divider(
                  color: Colors.grey,
                  height: 32.0,
                  //向两边缩进
                  indent: 32.0,
                ),
                Container(width: double.infinity,child:Text('FliterClip:${_selected.toString()}') ,),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value){
                        setState(() {
                          if(_selected.contains(tag)){
                            _selected.remove(tag);
                          }else{
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),


                Divider(
                  color: Colors.grey,
                  height: 32.0,
                  //向两边缩进
                  indent: 32.0,
                ),
                Container(width: double.infinity,child:Text('Choice:$_choice') ,),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag){
                    return ChoiceChip(
                      label: Text(tag),
                      selectedColor: Colors.black,
                      selected: _choice == tag,
                      onSelected: (value){
                        setState(() {
                          _choice = tag;
                        });
                      },
                    );
                  }).toList(),
                ),

              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
          onPressed: (){
          setState(() {
            _tags = ['Apple','banana','Lemon'];

            _selected = [];

            _choice = 'Lemon';
          });
          }
      ),
    );
  }
}
