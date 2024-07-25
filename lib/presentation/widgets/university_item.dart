import '../../utils/tools/file_importers.dart';

class UniversityItem extends StatelessWidget {
  final UniversityModel university;
  const UniversityItem(this.university, {super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => FacultiesPage(name: university.name, univer_id: university.id),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              var begin = const Offset(1.0, 1.0);
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
        //Navigator.push(context, MaterialPageRoute(builder: (context)=> FacultiesPage(name: university.name, univer_id: university.id,)));
      },
      child:ListTile(
        leading: const Icon(Icons.school),
        title: Text(university.name, overflow: TextOverflow.ellipsis,style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
      )
      /*Container(
        alignment: Alignment.centerLeft,
        height: 40,
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(color: Colors.grey.shade300)
          ),),
        child: Text(university.name, overflow: TextOverflow.ellipsis,style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
      ),*/
    );
  }
}

/*ListTile(
        leading: const Icon(Icons.school),
        title: Text(university.name, overflow: TextOverflow.ellipsis,style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
      )*/