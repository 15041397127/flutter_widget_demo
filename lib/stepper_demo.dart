import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  @override
  _StepperDemoState createState() {
    return _StepperDemoState();
  }
}

class _StepperDemoState extends State<StepperDemo> {

  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('StepperDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black,
              ),
              child: Stepper(
                //控制打开的是第几个
                currentStep: _currentStep,
                onStepTapped: (int value){
                  setState(() {
                    _currentStep = value;
                  });
                },
                onStepContinue: (){
                  setState(() {
                    _currentStep <2 ? _currentStep +=1 : _currentStep = 0;
                  });


                },

                onStepCancel: (){
                  setState(() {
                    _currentStep >0 ? _currentStep -=1 : _currentStep = 0;
                  });

                },
                steps: [

                  Step(
                    title: Text('Login'),
                    subtitle: Text('Login frist'),
                    content: Text('【长安逸动/CS35 PLUS 1.4T于7月27日上市】日前，我们从官方获悉，长安逸动和CS35 PLUS的1.4T车型（蓝鲸版）将于7月27日上市。新车的外观和内饰存在着少许的变化，动力均搭载长安最新的蓝鲸NE系列1.4T发动机，此前公布的两款车预售价为8.99万起。'),
                    isActive: _currentStep == 0,
                  ),
                  Step(
                    title: Text('Choose Plan'),
                    subtitle: Text('Choose  your Plan'),
                    content: Text('【长安逸动/CS35 PLUS 1.4T于7月27日上市】日前，我们从官方获悉，长安逸动和CS35 PLUS的1.4T车型（蓝鲸版）将于7月27日上市。新车的外观和内饰存在着少许的变化，动力均搭载长安最新的蓝鲸NE系列1.4T发动机，此前公布的两款车预售价为8.99万起。'),
                    isActive:  _currentStep == 1,
                  ),
                  Step(
                    title: Text('Confirm payment'),
                    subtitle: Text('Confirm your payment method'),
                    content: Text('【长安逸动/CS35 PLUS 1.4T于7月27日上市】日前，我们从官方获悉，长安逸动和CS35 PLUS的1.4T车型（蓝鲸版）将于7月27日上市。新车的外观和内饰存在着少许的变化，动力均搭载长安最新的蓝鲸NE系列1.4T发动机，此前公布的两款车预售价为8.99万起。'),
                    isActive:  _currentStep == 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
