
import 'package:esqueleto_flutter/core/design/themes/colors.dart';
import 'package:esqueleto_flutter/core/design/themes/custom_themes/appbar_theme.dart';
import 'package:esqueleto_flutter/core/design/themes/custom_themes/bottom_sheet_theme.dart';
import 'package:esqueleto_flutter/core/design/themes/custom_themes/checkbox_theme.dart';
import 'package:esqueleto_flutter/core/design/themes/custom_themes/chip_theme.dart';
import 'package:esqueleto_flutter/core/design/themes/custom_themes/elevated_button_theme.dart';
import 'package:esqueleto_flutter/core/design/themes/custom_themes/outlined_button_theme.dart';
import 'package:esqueleto_flutter/core/design/themes/custom_themes/text_field_theme.dart';
import 'package:esqueleto_flutter/core/design/themes/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      textTheme: TTextTheme.lightTextTheme,
      chipTheme: TChipTheme.lightChipTheme,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      checkboxTheme: TCheckBoxTheme.lightCheckboxTheme,
      bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Inter',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      textTheme: TTextTheme.darkTextTheme,
      chipTheme: TChipTheme.darkChipTheme,
      scaffoldBackgroundColor: TColors.darkBackground,
      appBarTheme: TAppBarTheme.darkAppBarTheme,
      checkboxTheme: TCheckBoxTheme.darkCheckboxTheme,
      bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
      inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme);
}
