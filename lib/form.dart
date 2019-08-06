import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  //保存表单里的数据
  final registerForKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;

  void submitRegisterForm() {

    //在提交按钮里 验证表单
    if (registerForKey.currentState.validate()) {
      registerForKey.currentState.save();
      debugPrint("username:$username");
      debugPrint("password:$password");
      //收起键盘
      FocusScope.of(context).requestFocus(FocusNode());

      //验证成功后提示
      Scaffold.of(context).showSnackBar(

        SnackBar(

            content: Text('Registering')


        ),
      );
      Navigator.of(context).pop();

    } else {
      setState(() {
        autovalidate = true;
      });
    }
  }

  String validatorUsername(value) {
    if (value.isEmpty) {
      return '请输入用户名';
    }

    return null;
  }

  String validatorPassword(value) {
    if (value.isEmpty) {
      return '请输入密码';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: registerForKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Username', helperText: ''),
            onSaved: (value) {
              username = value;
            },
            //验证表单是否匹配要求
            validator: validatorUsername,
            autovalidate: autovalidate, //自动验证表单
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password', helperText: ''),
            onSaved: (value) {
              password = value;
            },
            validator: validatorPassword,
            autovalidate: autovalidate, //自动验证表单
          ),
          SizedBox(
            height: 32.0,
          ),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text(
                'Register',
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0.0,
              onPressed: submitRegisterForm,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ThemoDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //主app的颜色
      color: Theme.of(context).accentColor,
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() {
    return _TextFieldDemoState();
  }
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  //监听文本字段变化
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    textEditingController.text = 'hi';
    textEditingController.addListener(() {
      debugPrint('input:${textEditingController.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: '请输入..',
//        border: InputBorder.none,//没有边框
//      border: OutlineInputBorder(),//四周都有边框
        filled: true, //背景颜色
      ),
      //监听输入状态变化
//      onChanged: (value){
//        debugPrint('input:$value');
//      },

      controller: textEditingController,

      onSubmitted: (value) {
        debugPrint('submit:$value');
      },
    );
  }
}
