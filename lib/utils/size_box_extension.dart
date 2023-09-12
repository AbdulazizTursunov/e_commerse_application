import 'package:flutter/cupertino.dart';

/// Katta hajmdagi Widgetlar uchun shundan foydalanamiz,

class AppSizer{
  static double editH(BuildContext context, itemHeight){
    double  height=MediaQuery.of(context).size.height;
    return height*itemHeight/812;
  }

  static double editW(BuildContext context, double itemWidth){
    double  width=MediaQuery.of(context).size.width;
    return width*itemWidth/375;
  }

}