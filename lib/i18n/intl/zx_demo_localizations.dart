import 'package:intl/intl.dart';
import 'zx_demo_messages_all.dart';
import 'zx_demo_messages_en.dart';
import 'zx_demo_messages_messages.dart';
import 'zx_demo_messages_zh.dart';
import 'package:flutter/material.dart';
import '../map/localization_demo.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

//intl 定义需要翻译的信息

class ZxDemoLocalization {



  static ZxDemoLocalization of(BuildContext context){

    return Localizations.of<ZxDemoLocalization>(
        context,
        ZxDemoLocalization
    );
  }

  static Future<ZxDemoLocalization> load(Locale locale){

    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);//规范本地化的代号

    return initializeMessages(localeName).then((bool _){

      Intl.defaultLocale =localeName;//默认本地化配置


      return ZxDemoLocalization();

    });

  }


  String get title => Intl.message(
        'hello',
        name: 'title',
        desc: 'demo localizations.',
      );

  String greet(String name) => Intl.message(
        'hello $name',
        name: 'greet',
        desc: 'greet someone',
        args: [name],//List 类型
      );
}

//加载本地化资源
class LocallizationsDelegateDemo extends LocalizationsDelegate<ZxDemoLocalization>{

  LocallizationsDelegateDemo();

  @override
  Future<ZxDemoLocalization> load(Locale locale) {
    // TODO: implement load
    return ZxDemoLocalization.load(locale);
  }

  //是否支持本地语言
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return true;
  }


  @override
  bool shouldReload(LocalizationsDelegate<ZxDemoLocalization> old) {
    // TODO: implement shouldReload
    return false;
  }

}
