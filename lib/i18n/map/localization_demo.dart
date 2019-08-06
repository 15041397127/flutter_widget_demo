import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

//定义本地化资源类
class LocalizationsDemo {
  final Locale locale;

  LocalizationsDemo(this.locale);

  static LocalizationsDemo of(BuildContext context){

    return Localizations.of<LocalizationsDemo>(
        context,
        LocalizationsDemo
    );
  }

  static Map<String, Map<String, String>> _localized = {
    'en': {
      'title': 'hello',
    },
    'zh': {
      'title': '您好',
    }
  };

  String get title {
    return _localized[locale.languageCode]['title'];
  }
}


//加载本地化资源
class LocallizationsDelegateDemo extends LocalizationsDelegate<LocalizationsDemo>{

  LocallizationsDelegateDemo();

  @override
  Future<LocalizationsDemo> load(Locale locale) {
    // TODO: implement load
    return SynchronousFuture<LocalizationsDemo>(
      
      LocalizationsDemo(locale)
      
    );
  }

  //是否支持本地语言
  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return true;
  }


  @override
  bool shouldReload(LocalizationsDelegate<LocalizationsDemo> old) {
    // TODO: implement shouldReload
    return false;
  }

}