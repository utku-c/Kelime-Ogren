import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constant.dart';

ThemeData appTheme() {
  return ThemeData(
    scaffoldBackgroundColor: kMyBackgroundColor,
    primaryColor: Colors.white,
    iconTheme: const IconThemeData(
      color: kMyPrimaryColor,
      size: 20.0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kMyPrimaryTextColor,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Colors.transparent,
    ),
    bottomAppBarTheme: const BottomAppBarTheme(
      shape: AutomaticNotchedShape(
        RoundedRectangleBorder(borderRadius: MyBorderRadius.allNormal()),
        StadiumBorder(),
      ),
    ),
    primaryTextTheme: const TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontSize: 25,
      ),
    ),
    //! Tab Bar
    tabBarTheme: TabBarTheme(
      unselectedLabelStyle: GoogleFonts.fuzzyBubbles(
        fontSize: 16,
      ),
      labelPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      labelStyle: GoogleFonts.fuzzyBubbles(
        fontSize: 16,
      ),
      labelColor: kMyPrimaryTextColor,
      indicatorSize: TabBarIndicatorSize.tab,
      unselectedLabelColor: kMyPrimaryColor,
      indicator: BoxDecoration(
        color: kMyPrimaryColor.withOpacity(0.5),
        borderRadius: const MyBorderRadius.allHigh(),
      ),
    ),
    // ! SLİDER THEME
    sliderTheme: const SliderThemeData(
      // track color
      activeTrackColor: kMyPrimaryColor,
      inactiveTrackColor: kMyPrimaryTextColor,
      valueIndicatorColor: kMyPrimaryColor,
      valueIndicatorShape: PaddleSliderValueIndicatorShape(),
      // tick in between

      activeTickMarkColor: Colors.transparent,
      inactiveTickMarkColor: Colors.black,
      thumbColor: kMyPrimaryColor,
      // overlayColor: Colors.amber,

      // data
      // trackHeight: 16,
      // thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20),
      // overlayShape: RoundSliderOverlayShape(overlayRadius: 50),
    ),

    // ! APPBAR THEME
    appBarTheme: AppBarTheme(
      toolbarHeight: 80,
      centerTitle: true,
      color: kMyBackgroundColor,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: const IconThemeData(
        color: kMyPrimaryColor,
        size: 22,
      ),
      titleTextStyle: GoogleFonts.fuzzyBubbles(
        color: kMyPrimaryColor,
        fontSize: kMyFontSizeNormal,
      ),
    ),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.fuzzyBubbles(color: kMyPrimaryColor, fontSize: 16),
      bodyText2: GoogleFonts.fuzzyBubbles(color: kMyPrimaryColor, fontSize: 16),
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: kMyPrimaryTextColor),
      labelStyle: const TextStyle(color: kMyPrimaryColor),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 20,
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: MyBorderRadius.allHigh(),
        borderSide: BorderSide(
          width: 2,
          color: kMyPrimaryColor,
        ),
        gapPadding: 10,
      ),
      errorStyle: const TextStyle(
        color: Colors.white,
        decoration: TextDecoration.underline,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(
          color: kMyPrimaryColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(
          color: kMyPrimaryColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(
          color: kMyPrimaryTextColor,
          width: 1.5,
        ),
        gapPadding: 10,
      ),
    ),

    //! CheckBox Theme
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(kMyPrimaryTextColor),
      fillColor: MaterialStateProperty.all(kMyPrimaryColor),
    ),
  );
}
