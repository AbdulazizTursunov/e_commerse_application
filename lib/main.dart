import 'package:e_commerce_application/service/api_repository/repository.dart';
import 'package:e_commerce_application/ui/route/route_names.dart';
import 'package:e_commerce_application/ui/route/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/bloc_crud_local_db/local_db_bloc.dart';
import 'bloc/favorites_bloc/favorite_bloc.dart';
import 'bloc/product_bloc/products_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocProvider(
          create: (context) => CartBloc(),
          child: BlocProvider(
            create: (context) => FavoritesBloc(),
            child: BlocProvider(
              create: (context) => ProductsBloc(ProductsService()),
              child: const MaterialApp(
          initialRoute: RouteNames.splashPage,
                onGenerateRoute: AppRoutes.generateRoute,
                debugShowCheckedModeBanner: false,
              ),
            ),
          ),
        );
      },
    );
  }
}
