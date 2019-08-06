import '../lib/test/test_demo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

void main(){
  
  test('should return hello + something', (){
    var string = ZXTestDemo.greet('zhangxu');
    //断言
    expect(string, 'hello zhangxu');
    
    
  });

  //测试widget
  testWidgets('widget testing demo',(WidgetTester tester)async {

    await tester.pumpWidget(
      MaterialApp(
        home: TestDemo() ,
      ),
    );

    //测试是否有label这个widget
    final labelTest = find.text('hello');

//    expect(labelTest, findsNothing);

//    expect(labelTest, findsOneWidget);
    expect(labelTest, findsNWidgets(1));

    final actionChipLabelTest = find.text('0');

    expect(actionChipLabelTest, findsOneWidget);

    //点按以后的结果
    final actionChip = find.byType(ActionChip);//按类型查找部件
    await tester.tap(actionChip);

    //重建小部件 因为state有变化
    await tester.pump();
    final actionChipLabelTestAfterTap = find.text('1');
    expect(actionChipLabelTestAfterTap, findsOneWidget);
    expect(actionChipLabelTest, findsNothing);


  });


}