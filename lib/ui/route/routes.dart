import 'package:e_commerce_application/ui/route/route_names.dart';
import 'package:flutter/material.dart';
import '../splash/splash_screen.dart';
import '../tab_box/all_product_page/product_detail_page/product_detail_page.dart';
import '../tab_box/tab_box_page.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.productDetail:
        return MaterialPageRoute(
            builder: (_) => ProductDetailsPage(id: settings.arguments as int));
      case RouteNames.tabBox:
        return MaterialPageRoute(builder: (_) => const TabBox());
      case RouteNames.splashPage:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
