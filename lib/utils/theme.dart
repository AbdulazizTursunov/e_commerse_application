import 'package:e_commerse_application/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppTheme {
  /// --------------------------- dark theme -----------------------------//

  static final ThemeData darkTheme = ThemeData(
    /// ------------------------scaffold background theme ------------------//
    scaffoldBackgroundColor: Colors.black,
    /// ----------------- app bar theme -----------------
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      /// ------------------------------status bar theme-------------------------//
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.black),
    ),
    /// --------------------------icon theme ------------------------------------//
    iconTheme: IconThemeData(color: Colors.grey),

    /// --------------------------- text theme ----------------------------------//
    textTheme: TextTheme(
      ///display
      displayLarge: TextStyle(
          color: Colors.white,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins"),
      displayMedium: TextStyle(
          color: Colors.white,
          fontSize: 45.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Poppins"),
      displaySmall: TextStyle(
          color: Colors.white,
          fontSize: 36.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"),
      ////headline
      headlineLarge: TextStyle(
          color: Colors.white,
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Poppins"),
      headlineMedium: TextStyle(
          color: Colors.white,
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      headlineSmall: TextStyle(
          color: Colors.white,
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins"),

     ///title
      titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Poppins"),
      titleMedium: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"),
      titleSmall: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      ///label
      labelLarge: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"),
      labelMedium: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      labelSmall: TextStyle(
          color: Colors.white,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      ///body
      bodySmall: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins"),
    ),

    /// ----------------------------------- popup menu theme --------------------//
    popupMenuTheme: PopupMenuThemeData(
        color: Colors.black,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
        )),
  );

  /// -------------------------------------light theme --------------------------//
  static final ThemeData lightTheme = ThemeData(
    /// ------------------------scaffold background theme ------------------//

    scaffoldBackgroundColor: Colors.white,

    /// ----------------- app bar theme -----------------
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,

      /// ------------------------------status bar theme-------------------------//
      systemOverlayStyle: SystemUiOverlayStyle(statusBarColor: Colors.white),
    ),

    /// ----------------------------------- popup menu theme --------------------//
    popupMenuTheme: PopupMenuThemeData(
        color: Colors.white,
        textStyle: TextStyle(color: Colors.black, fontSize: 12.sp)),
    iconTheme: IconThemeData(color: Colors.grey),

    /// --------------------------- text theme ----------------------------------//
    textTheme: TextTheme(
      ///display
      displayLarge: TextStyle(
          color: Colors.black,
          fontSize: 50.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins"),
      displayMedium: TextStyle(
          color: Colors.black,
          fontSize: 45.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Poppins"),
      displaySmall: TextStyle(
          color: Colors.black,
          fontSize: 36.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"),
     ///headline
      headlineLarge: TextStyle(
          color: AppColors.c0C042E,
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Poppins"),
      headlineMedium: TextStyle(
          color: AppColors.c0C042E,
          fontSize: 28.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      headlineSmall: TextStyle(
          color: AppColors.c0C042E,
          fontSize: 24.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins"),

      ///title
      titleLarge: TextStyle(
          color: AppColors.c0C042E,
          fontSize: 22.sp,
          fontWeight: FontWeight.w700,
          fontFamily: "Poppins"),
      titleMedium: TextStyle(
          color:AppColors.c0C042E,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"),
      titleSmall: TextStyle(
          color: AppColors.c0C042E,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      ///label
      labelLarge: TextStyle(
          color: AppColors.c0C042E,
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"),
      labelMedium: TextStyle(
          color: AppColors.c0C042E,
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      labelSmall: TextStyle(
          color: AppColors.c0C042E,
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      ///body
      bodySmall: TextStyle(
          color: AppColors.c0C042E,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      bodyMedium: TextStyle(
          color:AppColors.c0C042E,
          fontSize: 14.sp,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      bodyLarge: TextStyle(
          color: AppColors.c0C042E,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins"),
    ),
  );
}
