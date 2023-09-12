import 'package:e_commerse_application/service/api_repository/repository.dart';
import 'package:e_commerse_application/service/api_service/api_service.dart';
import 'package:e_commerse_application/ui/route/routes.dart';
import 'package:e_commerse_application/ui/tab_box/tab_box_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/product_bloc/products_bloc.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MainApp(

  ));
}

// class App extends StatelessWidget {
//   const App({super.key, required this.apiService});
//
//   final ProductService apiService;
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiRepositoryProvider(
//       providers: [
//         RepositoryProvider(
//           create: (context) => ProductRepository(apiService: apiService),
//         ),
//       ],
//       child: MultiBlocProvider(
//         providers: [
//           BlocProvider(
//             create: (context) => ProductsBloc(
//             )..add(GetAllProductsEvent()),
//           ),
//
//         ],
//         child: const MainApp(),
//       ),
//     );
//   }
// }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          onGenerateRoute: AppRoutes.generateRoute,
          debugShowCheckedModeBanner: false,
          // theme: AppTheme.lightTheme,
          // darkTheme: AppTheme.lightTheme,
          // themeMode: ThemeMode.light,
          home: const TabBox(),
        );
      },
    );
  }
}
