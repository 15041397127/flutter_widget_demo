import 'package:flutter/material.dart';
//import 'map/localization_demo.dart';
import 'intl/zx_demo_localizations.dart';
//国际化
class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //获取与设置语言和地区（理解 Locale 类与 Localizations 小部件)
    
    Locale locale = Localizations.localeOf(context);
    
    
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text('${locale.languageCode}'),
            Text('${locale.toString()}'),
            Text(
              //使用本地资源的语言
//              Localizations.of(context, LocalizationsDemo).title,
            //根据静态方法
//            LocalizationsDemo.of(context).title,
//              style: Theme.of(context).textTheme.title,

              ZxDemoLocalization.of(context).greet('zhanxgu'),
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),

      ),

    );
  }
}
