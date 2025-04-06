import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  bool _isDarkMode = false;

  ThemeMode get themeMode => _themeMode;
  bool get isDarkMode => _isDarkMode;

  static const Color _primaryColor = Color(0xFF0F766E);
  static const Color _primaryLight = Color(0xFF14B8A6);
  static const Color _primaryDark = Color(0xFF0F5259);
  static const Color _secondaryColor = Color(0xFFEAB308);
  static const Color _secondaryLight = Color(0xFFFCD34D);
  static const Color _accentColor = Color(0xFFDC2626);

  static const Color _lightTextColor = Color(0xFF1E293B);
  static const Color _lightTextLight = Color(0xFF64748B);
  static const Color _lightTextMuted = Color(0xFF94A3B8);
  static const Color _lightBgColor = Color(0xFFFFFFFF);
  static const Color _lightBgSecondary = Color(0xFFF8FAFC);
  static const Color _lightBgTertiary = Color(0xFFF1F5F9);
  static const Color _lightBorderColor = Color(0xFFE2E8F0);

  static const Color _darkTextColor = Color(0xFFF1F5F9);
  static const Color _darkTextLight = Color(0xFFCBD5E1);
  static const Color _darkTextMuted = Color(0xFF94A3B8);
  static const Color _darkBgColor = Color(0xFF0F172A);
  static const Color _darkBgSecondary = Color(0xFF1E293B);
  static const Color _darkBgTertiary = Color(0xFF334155);
  static const Color _darkBorderColor = Color(0xFF334155);

  ThemeProvider() {
    final brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    _isDarkMode = brightness == Brightness.dark;
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _themeMode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  void setTheme(ThemeMode themeMode) {
    _themeMode = themeMode;
    _isDarkMode = themeMode == ThemeMode.dark;
    notifyListeners();
  }

  ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: _primaryColor,
        primaryContainer: _primaryLight,
        secondary: _secondaryColor,
        secondaryContainer: _secondaryLight,
        tertiary: _accentColor,
        background: _lightBgColor,
        surface: _lightBgSecondary,
        surfaceVariant: _lightBgTertiary,
        onBackground: _lightTextColor,
        onSurface: _lightTextColor,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
      ),
      scaffoldBackgroundColor: _lightBgColor,
      appBarTheme: AppBarTheme(
        backgroundColor: _lightBgColor,
        foregroundColor: _lightTextColor,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        color: _lightBgSecondary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: _lightBorderColor),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: _lightTextColor,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: _lightTextColor,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: _lightTextColor,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          color: _lightTextColor,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: _lightTextColor,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: _lightTextColor,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: _lightTextColor,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: _lightTextColor,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: _lightTextColor,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(color: _lightTextColor),
        bodyMedium: TextStyle(color: _lightTextLight),
        bodySmall: TextStyle(color: _lightTextMuted),
        labelLarge: TextStyle(
          color: _lightTextColor,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(color: _lightTextColor),
        labelSmall: TextStyle(color: _lightTextMuted),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _lightTextColor,
          side: BorderSide(color: _lightBorderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      iconTheme: IconThemeData(color: _lightTextColor),
      dividerTheme: DividerThemeData(color: _lightBorderColor, thickness: 1),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return _primaryColor;
          }
          return null;
        }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return _primaryColor;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return _primaryLight.withOpacity(0.5);
          }
          return null;
        }),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _lightBgSecondary,
        focusColor: _primaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _lightBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _primaryColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _lightBorderColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  // Dark theme
  ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: _primaryLight,
        primaryContainer: _primaryDark,
        secondary: _secondaryLight,
        secondaryContainer: _secondaryColor,
        tertiary: _accentColor,
        background: _darkBgColor,
        surface: _darkBgSecondary,
        surfaceVariant: _darkBgTertiary,
        onBackground: _darkTextColor,
        onSurface: _darkTextColor,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
      ),
      scaffoldBackgroundColor: _darkBgColor,
      appBarTheme: AppBarTheme(
        backgroundColor: _darkBgColor,
        foregroundColor: _darkTextColor,
        elevation: 0,
      ),
      cardTheme: CardTheme(
        color: _darkBgSecondary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(color: _darkBorderColor),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: _darkTextColor,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: _darkTextColor,
          fontWeight: FontWeight.bold,
        ),
        displaySmall: TextStyle(
          color: _darkTextColor,
          fontWeight: FontWeight.bold,
        ),
        headlineLarge: TextStyle(
          color: _darkTextColor,
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: _darkTextColor,
          fontWeight: FontWeight.bold,
        ),
        headlineSmall: TextStyle(
          color: _darkTextColor,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          color: _darkTextColor,
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: _darkTextColor,
          fontWeight: FontWeight.w600,
        ),
        titleSmall: TextStyle(
          color: _darkTextColor,
          fontWeight: FontWeight.w600,
        ),
        bodyLarge: TextStyle(color: _darkTextColor),
        bodyMedium: TextStyle(color: _darkTextLight),
        bodySmall: TextStyle(color: _darkTextMuted),
        labelLarge: TextStyle(
          color: _darkTextColor,
          fontWeight: FontWeight.w600,
        ),
        labelMedium: TextStyle(color: _darkTextColor),
        labelSmall: TextStyle(color: _darkTextMuted),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryLight,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: _darkTextColor,
          side: BorderSide(color: _darkBorderColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: _primaryLight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),
      iconTheme: IconThemeData(color: _darkTextColor),
      dividerTheme: DividerThemeData(color: _darkBorderColor, thickness: 1),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return _primaryLight;
          }
          return null;
        }),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return _primaryLight;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return _primaryColor.withOpacity(0.5);
          }
          return null;
        }),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: _darkBgSecondary,
        focusColor: _primaryLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _darkBorderColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _primaryLight, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: _darkBorderColor),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      dialogTheme: DialogTheme(
        backgroundColor: _darkBgSecondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: _darkBgTertiary,
        contentTextStyle: TextStyle(color: _darkTextColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        behavior: SnackBarBehavior.floating,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: _darkBgSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: _darkBgSecondary,
        selectedItemColor: _primaryLight,
        unselectedItemColor: _darkTextLight,
      ),
      tabBarTheme: TabBarTheme(
        labelColor: _primaryLight,
        unselectedLabelColor: _darkTextLight,
        indicatorColor: _primaryLight,
      ),
      chipTheme: ChipThemeData(
        backgroundColor: _darkBgTertiary,
        labelStyle: TextStyle(color: _darkTextColor),
        side: BorderSide(color: _darkBorderColor),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
    );
  }

  ThemeData getLightThemeWithFont(String fontFamily) {
    return lightTheme.copyWith(
      textTheme: lightTheme.textTheme.apply(fontFamily: fontFamily),
    );
  }

  ThemeData getDarkThemeWithFont(String fontFamily) {
    return darkTheme.copyWith(
      textTheme: darkTheme.textTheme.apply(fontFamily: fontFamily),
    );
  }
}
