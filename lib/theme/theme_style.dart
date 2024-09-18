import 'package:wbl_mobile_app/theme/colors.dart';
import 'package:flutter/material.dart';

class ThemeStyle {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: kPrimarySwatchColor,
      iconTheme: IconThemeData(color: kPrimarySwatchColor),
      foregroundColor: kPrimarySwatchColor,
      surfaceTintColor: kPrimarySwatchColor,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPurpleColor),
        foregroundColor: WidgetStateProperty.all(kPurpleColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
      ),
    ),
    actionIconTheme: ActionIconThemeData(
      endDrawerButtonIconBuilder: (context) {
        return Icon(Icons.menu, color: kPurpleColor);
      },
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(kPurpleColor)),
    ),
    menuButtonTheme: MenuButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPurpleColor),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPurpleColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPurpleColor),
        foregroundColor: WidgetStateProperty.all(kPurpleColor),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPurpleColor),
        foregroundColor: WidgetStateProperty.all(kPurpleColor),
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(color: kPurpleColor),
        ),
      ),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPurpleColor),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: kGreyWhiteColor,
      todayBackgroundColor: WidgetStatePropertyAll(kPrimarySwatchColor),
      confirmButtonStyle: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPrimarySwatchColor),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return kTextColor;
          }
          return kTextColor;
        },
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      side: WidgetStateBorderSide.resolveWith(
        (Set<WidgetState> states) {
          return BorderSide(color: kTextColor);
        },
      ),
    ),
    switchTheme: SwitchThemeData(
      trackColor: WidgetStateColor.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return kTextColor;
          }
          return kTextColor;
        },
      ),
    ),
    scaffoldBackgroundColor: kGreyWhiteColor,  // Set the app's background color
    primarySwatch: kPrimarySwatchColor,
    dialogBackgroundColor: kGreyWhiteColor,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: kGreyWhiteColor),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontFamily: 'Epilogue-Black', color: kPrimarySwatchColor),
      displayMedium: TextStyle(fontFamily: 'Epilogue-Black', color: kPrimarySwatchColor),
      displaySmall: TextStyle(fontFamily: 'Epilogue-Black', color: kPrimarySwatchColor),
      headlineLarge: TextStyle(fontFamily: 'Epilogue-Black', color: kPrimarySwatchColor),
      headlineMedium: TextStyle(fontFamily: 'Epilogue-Black', color: kPrimarySwatchColor),
      headlineSmall: TextStyle(fontFamily: 'Epilogue-Black', color: kPrimarySwatchColor),
      titleLarge: TextStyle(fontFamily: 'Epilogue-Bold', color: kPrimarySwatchColor),
      titleMedium: TextStyle(fontFamily: 'Epilogue-Bold', color: kPrimarySwatchColor),
      titleSmall: TextStyle(fontFamily: 'Epilogue-Black', color: kPrimarySwatchColor),
      bodyLarge: TextStyle(fontFamily: 'Epilogue-Black', color: kPrimarySwatchColor),
      bodyMedium: TextStyle(fontFamily: 'Epilogue-Black', color: kPrimarySwatchColor),
      bodySmall: TextStyle(fontFamily: 'Epilogue-Black', color: kPrimarySwatchColor),
      labelLarge: TextStyle(fontFamily: 'Epilogue-Black', color: kPrimarySwatchColor),
      labelMedium: TextStyle(fontFamily: 'Epilogue-Black', color: kPrimarySwatchColor),
      labelSmall: TextStyle(fontFamily: 'Epilogue-Black', color: kPrimarySwatchColor),
    ),
  );
}
