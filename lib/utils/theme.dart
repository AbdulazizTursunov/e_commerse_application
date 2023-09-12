import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


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
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins"),
      displayMedium: TextStyle(
          color: Colors.white,
          fontSize: 45,
          fontWeight: FontWeight.w700,
          fontFamily: "Poppins"),
      displaySmall: TextStyle(
          color: Colors.white,
          fontSize: 36,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"),
      ////headline
      headlineLarge: TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.w700,
          fontFamily: "Poppins"),
      headlineMedium: TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      headlineSmall: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins"),

     ///title
      titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          fontFamily: "Poppins"),
      titleMedium: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"),
      titleSmall: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      ///label
      labelLarge: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"),
      labelMedium: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      labelSmall: TextStyle(
          color: Colors.white,
          fontSize: 11,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      ///body
      bodySmall: TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      bodyLarge: TextStyle(
          color: Colors.white,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins"),
    ),

    /// ----------------------------------- popup menu theme --------------------//
    popupMenuTheme: PopupMenuThemeData(
        color: Colors.black,
        textStyle: TextStyle(
          color: Colors.white,
          fontSize: 12,
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
        textStyle: TextStyle(color: Colors.black, fontSize: 12)),
    iconTheme: IconThemeData(color: Colors.grey),

    /// --------------------------- text theme ----------------------------------//
    textTheme: TextTheme(
      ///display
      displayLarge: TextStyle(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins"),
      displayMedium: TextStyle(
          color: Colors.black,
          fontSize: 45,
          fontWeight: FontWeight.w700,
          fontFamily: "Poppins"),
      displaySmall: TextStyle(
          color: Colors.black,
          fontSize: 36,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"),
     ///headline
      headlineLarge: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.w700,
          fontFamily: "Poppins"),
      headlineMedium: TextStyle(
          color: Colors.black,
          fontSize: 28,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      headlineSmall: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins"),

      ///title
      titleLarge: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w700,
          fontFamily: "Poppins"),
      titleMedium: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"),
      titleSmall: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      ///label
      labelLarge: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins"),
      labelMedium: TextStyle(
          color: Colors.black,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      labelSmall: TextStyle(
          color: Colors.black,
          fontSize: 11,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      ///body
      bodySmall: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      bodyMedium: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: "Poppins"),
      bodyLarge: TextStyle(
          color: Colors.black,
          fontSize: 13,
          fontWeight: FontWeight.w400,
          fontFamily: "Poppins"),
    ),
  );
}
