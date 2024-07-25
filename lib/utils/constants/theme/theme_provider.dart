

import '../../tools/file_importers.dart';


class ThemeProvider with ChangeNotifier{
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  set themeData(ThemeData themeData){
    _themeData = themeData;
    notifyListeners();
  }

  ThemeProvider(bool darkThemeOn) {
    themeData = darkThemeOn ? darkMode : lightMode;
  }
  void toggleTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();


    if(_themeData == lightMode){
      themeData = darkMode;
      prefs.setBool("isDarkTheme", true);
    } else {
      themeData = lightMode;
      prefs.setBool("isDarkTheme", false);
    }
    notifyListeners();
  }






}