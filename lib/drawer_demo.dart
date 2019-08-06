import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
//              DrawerHeader(
//                child: Text('header'.toUpperCase()),
//                decoration: BoxDecoration(
//                  color: Colors.blue
//                ),
//              ),
          UserAccountsDrawerHeader(
            accountName: Text(
              '啥玩意儿啊',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail:Text(
              '120920774@qq.com',

            ),
            currentAccountPicture:CircleAvatar(
              backgroundImage: NetworkImage('http://wx2.sinaimg.cn/large/d7f0c0dcgy1g54wylmdo6j218z0u07wj.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: DecorationImage(
                image: NetworkImage('http://wx2.sinaimg.cn/large/7223594bly1g51f27ywxsj21kw0w0qk5.jpg'),
                fit: BoxFit.cover,
                //滤镜
                colorFilter: ColorFilter.mode(
                    Colors.orange[400].withOpacity(0.6),
                    BlendMode.hardLight),
              ),
            ),

          ),
          ListTile(
            title: Text('Message',textAlign: TextAlign.right),
            trailing: Icon(Icons.message,size: 22.0,color:Colors.black12 ,),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Message',textAlign: TextAlign.right),
            trailing: Icon(Icons.message,size: 22.0,color:Colors.black12 ,),
            onTap: (){
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Message',textAlign: TextAlign.right),
            trailing: Icon(Icons.message,size: 22.0,color:Colors.black12 ,),
            onTap: (){
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
