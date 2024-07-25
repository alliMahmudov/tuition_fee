import '../../utils/tools/file_importers.dart';


class CustomButton extends StatelessWidget {
  final String title;
  const CustomButton({required this.title, super.key});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      padding: const EdgeInsets.all(10),
      height: 55,
      decoration: BoxDecoration(
          color: checkMode(context) ? MyColors.customButtonLight : MyColors.customButtonDark,
          borderRadius: BorderRadius.circular(10)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
          const Icon(Icons.chevron_right, color: Colors.blue, size: 28,)
        ],
      ),
    );
  }
}
