import '../../utils/tools/file_importers.dart';

class FacultiesPage extends StatefulWidget {
  final String name;
  final int univer_id;

  const FacultiesPage({super.key, required this.name, required this.univer_id});

  @override
  State<FacultiesPage> createState() => _FacultiesPageState();
}

class _FacultiesPageState extends State<FacultiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 1,
          backgroundColor: Theme.of(context).colorScheme.primary,
          centerTitle: true,
          title: Text(
            "faculties".tr(),
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: checkMode(context) ? Colors.black : Colors.white),
          ),
          iconTheme: const IconThemeData(color: Colors.blue),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
              child: Text(
                widget.name,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ),
            Expanded(child: faculty(widget.univer_id))
          ],
        ));
  }

  Widget faculty(int id) {
    return FutureBuilder(
      future: Repository().readFacInfo(id),
      builder: (context, AsyncSnapshot<List<FacultyModel>> snapshot) {
        return snapshot.data == null ? const Center(child: CircularProgressIndicator(),) :ListView.builder(
          itemBuilder: (context, index) {
            return FacultyItem(snapshot.data![index]);
          },
          itemCount: snapshot.data!.length,
        );
      },
    );
  }



}
