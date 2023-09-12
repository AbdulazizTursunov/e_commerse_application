
import 'package:e_commerse_application/ui/route/route_names.dart';
import 'package:e_commerse_application/ui/tab_box/all_product_page/product_detail_page/product_detail_page.dart';
import 'package:e_commerse_application/ui/tab_box/tab_box_page.dart';
import 'package:flutter/material.dart';




class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.productDetail:
        return MaterialPageRoute(builder: (_) =>  ProductDetailsPage(id: settings.arguments as int));
      case RouteNames.tabBox:
        return MaterialPageRoute(builder: (_) =>const  TabBox());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            ));
    }
  }
}