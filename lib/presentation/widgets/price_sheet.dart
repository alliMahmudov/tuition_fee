import '../../utils/tools/file_importers.dart';
class PriceView extends StatelessWidget {
  final String type;
  final String price;

  const PriceView({required this.type, required this.price, super.key});

  @override
  Widget build(BuildContext context) {
    bool checkMode = Provider.of<ThemeProvider>(context).themeData == lightMode;
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(type,
              style: TextStyle(
                  color: checkMode
                      ? MyColors.textColorLight
                      : MyColors.textColorDark,
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
          Text(price,
              style: TextStyle(
                  color: checkMode ? Colors.black : Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 16)),
        ],
      ),
    );
  }
}
