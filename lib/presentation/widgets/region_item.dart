import 'package:tuition_fee/utils/tools/file_importers.dart';

class RegionItem extends StatefulWidget {
  final RegionModel region;

  const RegionItem(this.region, {super.key});

  static int? regionId;
  @override
  State<RegionItem> createState() => _RegionItemState();
}

class _RegionItemState extends State<RegionItem>{

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(builder: (context, value, child) {
      return InkWell(
        onTap: () {
          RegionItem.regionId = widget.region.id;

          value.setSelectedId(RegionItem.regionId!);
          print("Region ishladi ${widget.region.name}");
          Provider.of<MainProvider>(context, listen: false).readByRegion();

        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: value.selectedId == widget.region.id
                  ? MyColors.customBlue
                  : checkMode(context)
                      ? MyColors.backgroundLight
                      : MyColors.backgroundDark,
              borderRadius: BorderRadius.circular(50.0),
              border: Border.all(
                  color:
                  value.selectedId == widget.region.id ? Colors.transparent : Colors.grey.shade300)),
          child: Text(
            widget.region.name,
            style: TextStyle(
                color: value.selectedId == widget.region.id
                    ? Colors.white
                    : checkMode(context)
                        ? MyColors.backgroundDark
                        : MyColors.backgroundLight,
                fontWeight: FontWeight.w500),
          ),
        ),
      );
    });
  }
}
