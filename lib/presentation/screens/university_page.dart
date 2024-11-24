import '../../utils/tools/file_importers.dart';

class UniversityPage extends StatefulWidget {
  const UniversityPage({super.key});

  @override
  State<UniversityPage> createState() => _UniversityPageState();
}

class _UniversityPageState extends State<UniversityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          "university".tr(),
          style: TextStyle(
              fontWeight: FontWeight.w600,
              color: checkMode(context) ? Colors.black : Colors.white),
        ),
        actions: [
          GestureDetector(
            onTap: () => _open(context),
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SvgPicture.asset("assets/icons/info.svg")),
          ),
        ],
        leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const SettingsPage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    var begin = const Offset(-1.0, -1.0);
                    var end = Offset.zero;
                    var curve = Curves.ease;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));

                    return SlideTransition(
                      position: animation.drive(tween),
                      child: child,
                    );
                  },
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset("assets/icons/setting_icon.svg"),
            )),
      ),
      body: Column(
        children: [
          /// REGIONS
          Container(
            margin: const EdgeInsets.only(top: 10),
            height: 35,
            child: Consumer<MainProvider>(
              builder: (context, value, child) {
                if (value.region == null) {
                  context.read<MainProvider>().readRegion();
                } else if (value.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      itemCount: value.region!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var region = value.region![index];
                        return RegionItem(region);
                      });
                }
                return Container();
              },
            ),
          ),

          Expanded(
              child: RegionItem.regionId == null
                  ? univer()
                  : univerByRegion()),
        ],
      ),
    );
  }

  void _open(context) {
    showDialog(context: (context), builder: (context){
      return AlertDialog.adaptive(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0)),
        title: const Text("attention").tr(),
        content: const Text("info").tr(),
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



  Widget univer() {
    return Consumer<MainProvider>(
      builder: (context, value, child) {
        if (value.university == null) {
          context.read<MainProvider>().readUniversity();
        } else if (value.isLoading) {
          context.read<MainProvider>().readUniversity();
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              var uni = value.university![index];
              return UniversityItem(uni);
            },
            itemCount: value.university!.length,
          );
        }
        return Container();
      },
    );
  }

  Widget univerByRegion() {
    return Consumer<MainProvider>(
      builder: (context, value, child) {
        return FutureBuilder(
          future: Repository().readUniByRegion(value.selectedId!),
          builder: (context, AsyncSnapshot<List<UniversityModel>> snapshot) {
            return snapshot.data == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: UniversityItem(snapshot.data![index]),
                      );
                    },
                    itemCount: snapshot.data!.length,
                  );
          },
        );
      },
    );
  }
}
