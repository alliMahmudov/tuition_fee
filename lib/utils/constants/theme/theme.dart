import '../../tools/file_importers.dart';


ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme:  const ColorScheme.light(
    background: MyColors.backgroundLight,
    primary: MyColors.primaryLight,
    secondary: MyColors.secondaryLight,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: MyColors.backgroundDark,
    primary: MyColors.primaryDark,
    secondary: MyColors.secondaryDark,
  ),
);
