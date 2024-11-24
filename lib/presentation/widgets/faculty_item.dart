import '../../utils/tools/file_importers.dart';


class FacultyItem extends StatefulWidget {
  final FacultyModel faculty;
  const FacultyItem(this.faculty, {super.key});

  @override
  State<FacultyItem> createState() => _FacultyItemState();
}

class _FacultyItemState extends State<FacultyItem> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 5, 15, 0),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade300)
          )
      ),
      child: InkWell(
          onTap: () {
            controller = BottomSheet.createAnimationController(this);

            // Animation duration for displaying the BottomSheet
            controller.duration = const Duration(milliseconds: 300);

            // Animation duration for retracting the BottomSheet
            controller.reverseDuration = const Duration(milliseconds: 300);
            // Set animation curve duration for the BottomSheet
            controller.drive(CurveTween(curve: Curves.easeInToLinear));
            facultyInfo(context);
          },
          child: ListTile(
            title: Text(widget.faculty.name, style: const TextStyle(
                fontWeight: FontWeight.w500, fontSize: 16),),
          )
        /*Container(
          alignment: Alignment.centerLeft,
          height: 40,
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(color: Colors.grey.shade300))),
          child: Text(
            faculty.name,
            maxLines: 4,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),*/
      ),
    );
  }

  void facultyInfo(context) {
  /*  showAdaptiveActionSheet(context: context, actions: [

      BottomSheetAction(title:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text("info_fee".tr(), style: TextStyle(color: MyColors.red),)),
          ],
        ),
      ), onPressed: (context) {}),

      BottomSheetAction(title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: Text(widget.faculty.name)),
        ],
      ), onPressed: (context){}),
      BottomSheetAction(title:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("kunduzgi".tr()),
            Text(widget.faculty.tuition_fee)


          ],
        ),
      ), onPressed: (context) {}),
      BottomSheetAction(title:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("sirtqi".tr()),
            Text(checkFee(widget.faculty.tuition_fee))
          ],
        ),
      ), onPressed: (context) {}),
      BottomSheetAction(title:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("kechgi".tr()),
            Text(checkFee(widget.faculty.tuition_fee))
          ],
        ),
      ), onPressed: (context) {}),
      BottomSheetAction(title:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("masofaviy".tr()),
            Text(checkFee(widget.faculty.tuition_fee))
          ],
        ),
      ), onPressed: (context) {}),
    ]);*/
    showModalBottomSheet(
        transitionAnimationController: controller,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(
            topRight: Radius.circular(30), topLeft: Radius.circular(30))),
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            height: height(context) * .4,
            width: width(context),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(0),
                topLeft: Radius.circular(0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    InkWell(
                        onTap: () => _open(context),
                        child: SvgPicture.asset("assets/icons/info.svg")),
                    const SizedBox(width: 10,),
                    Flexible(
                      child: Text(
                        widget.faculty.name,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                PriceView(
                    type: "kunduzgi".tr(), price: widget.faculty.tuition_fee),
                PriceView(type: "sirtqi".tr(),
                    price: checkFee(widget.faculty.tuition_fee)),
                PriceView(type: "kechgi".tr(),
                    price: checkFee(widget.faculty.tuition_fee)),
                PriceView(type: "masofaviy".tr(),
                    price: checkFee(widget.faculty.tuition_fee)),


              ],
            ),
          );
        });
  }

  void _open(context) {
   showDialog(context: context, builder: (context) {
      return AlertDialog.adaptive(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0)),
        title: const Text("attention").tr(),
        content: const Text("info_fee").tr(),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Ok",
                style: TextStyle(
                    color: checkMode(context)
                        ? Colors.black
                        : Colors.white),
              ))
        ],
      );
    });
  }

}