import 'package:tuition_fee/presentation/screens/university_page.dart';
import 'package:tuition_fee/utils/tools/file_importers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    var isDarkTheme = prefs.getBool("isDarkTheme");
    return runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider(isDarkTheme ?? false),),
        ChangeNotifierProvider(create: (context) => MainProvider()),
      ],
      child: EasyLocalization(
          supportedLocales: const [Locale('uz', 'UZ'), Locale('ru', 'RU')],
          fallbackLocale: const Locale('uz', "UZ"),
          path: 'assets/translations',
          child: const MyApp()),
    ));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: const UniversityPage(),
    );
  }
}
