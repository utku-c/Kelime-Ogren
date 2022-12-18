import 'package:flutter/material.dart';

// ! const Color
const kMyBackgroundColor = Color(0xFF8288C3);
const kMyPrimaryColor = Color(0xFF242961);
const kMyPrimaryTextColor = Color(0xFFD0BED4);
const kMyPrimaryBlack = Color(0xFF0B0B11);

// ! const Font Size

const double kMyFontSizeSoLow = 15;
const double kMyFontSizelow = 18;
const double kMyFontSizeNormal = 22;
const double kMyFontSizeHigh = 28;

// ! const BORDER RADİUS
const double kMydefaultRadiusHigh = 32;
const double kMydefaultRadiusNormal = 24;
const double kMydefaultRadiusLow = 16;

// ! const Animation Duration
const kAnimationDurationSoHigh = Duration(seconds: 3);
const kAnimationDurationHigh = Duration(milliseconds: 1500);
const kAnimationDurationNormal = Duration(milliseconds: 1000);
const kAnimationDurationLow = Duration(milliseconds: 500);

// ! const Page Paddin
const double kMyPaddingSoHigh = 40;
const double kMyPaddingHigh = 30;
const double kMyPaddingNormal = 20;
const double kMyPaddingLow = 10;

class PagePadding extends EdgeInsets {
  const PagePadding.allLow() : super.all(15);
  const PagePadding.allNormal() : super.all(20);
  const PagePadding.allHigh() : super.all(25);
  const PagePadding.allSoHigh() : super.all(30);
  const PagePadding.symtcHrztHigh() : super.symmetric(horizontal: 26);
  const PagePadding.symtcHrztNormal() : super.symmetric(horizontal: 20);
  const PagePadding.symtcHrztLow() : super.symmetric(horizontal: 16);
}

// ! const border Radius
class MyBorderRadius extends BorderRadius {
  // Bu şekide yazdığımızda dışarıdan biz giriyoruz
  // const MyBorderRadius.all(super.radius) : super.all();
  const MyBorderRadius.allHigh() : super.all(const Radius.circular(30));
  const MyBorderRadius.allNormal() : super.all(const Radius.circular(20));
  MyBorderRadius.circularSoHigh() : super.circular(36);
  MyBorderRadius.circularHigh() : super.circular(28);
  MyBorderRadius.circularNormal() : super.circular(22);
  MyBorderRadius.circularLow() : super.circular(16);
}

// ! TextDecoration Başlıklar İçin
const kMyTextDecoration = TextStyle(
  fontSize: kMyFontSizeNormal,
  fontWeight: FontWeight.bold,
);

// ! const BoxDecoration
final kMyDefaultCardDecoration = BoxDecoration(
  border: Border.all(
    color: kMyPrimaryColor,
    width: 2.5,
  ),
  color: kMyPrimaryTextColor,
  borderRadius: const MyBorderRadius.allNormal(),
);

// ! const BoxDecoration
final kMyDefaultBoxDecoration = BoxDecoration(
  color: kMyPrimaryTextColor.withOpacity(0.5),
  borderRadius: const MyBorderRadius.allNormal(),
);

// !
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
