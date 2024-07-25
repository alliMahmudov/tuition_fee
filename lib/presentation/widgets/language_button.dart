import '../../utils/tools/file_importers.dart';

class LanguageButton extends StatelessWidget {
  final String language;
  const LanguageButton({required this.language, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        language == "🇷🇺 Русский" ? context.setLocale(const Locale('ru', 'RU')) : context.setLocale(const Locale('uz', 'UZ'));
      },
      child: Container(
          alignment: Alignment.center,
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300, width: 1),),
          ),
          child: Text(language, style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 20),)
      ),
    );
  }
}
