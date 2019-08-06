import 'dart:async';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

//单元测试
//运行测试：打开终端：
//flutter driver --target=test_driver/app.dart,这个命令会去创建一个应用，然后会安装在设备上，测试会连接应用，并去操控应用。这个过程就像是用户在使用
void main() {

  group('App',(){

    FlutterDriver driver;

    final actionChip = find.byValueKey('actionChip');

    final actionChipLabelTest = find.byValueKey('actionChipLabelTest');

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    //关闭
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });




    test('start at 0', () async{

      expect(await driver.getText(actionChipLabelTest), '0');

    });

    test('increments the counter', () async{

      await driver.tap(actionChip);

      expect(await driver.getText(actionChipLabelTest), '1');

    });



  });
}



