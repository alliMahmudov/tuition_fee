import '../../utils/tools/file_importers.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> with TickerProviderStateMixin{
  late AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 1,
        title: Text(
          "settings".tr(),
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: checkMode(context) ? Colors.black : Colors.white
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.blue),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          InkWell(
              onTap: () {
                controller = BottomSheet.createAnimationController(this);

                // Animation duration for displaying the BottomSheet
                controller.duration = const Duration(seconds: 1);

                // Animation duration for retracting the BottomSheet
                controller.reverseDuration = const Duration(seconds: 1);
                // Set animation curve duration for the BottomSheet
                controller.drive(CurveTween(curve: Curves.easeInToLinear));
                changeLanguage(context);
              },
              child: CustomButton(title: "language".tr())),
          InkWell(
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              child: CustomButton(title: "mode".tr())),

        ],
      ),
    );
  }

  void changeLanguage(context) {
    showModalBottomSheet(
      transitionAnimationController: controller,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30)
      ),
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            height: height(context) * .25,
            width: width(context),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "language".tr(),
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 26),
                ),
                const SizedBox(
                  height: 20,
                ),
                const LanguageButton(language: "🇷🇺 Русский"),
                const LanguageButton(language: "🇺🇿 O'zbekcha"),
              ],
            ),
          );
        });
  }
}
