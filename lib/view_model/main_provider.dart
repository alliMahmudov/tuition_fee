
import '../../utils/tools/file_importers.dart';

class MainProvider extends ChangeNotifier {
  List<UniversityModel>? university;
  List<RegionModel>? region;
  List<FacultyModel>? faculty;
  bool isSelected = false;
  bool isLoading = false;
  Repository repository = Repository();

  update(){
    notifyListeners();
  }
  void readUniversity() async{
    university = await repository.readUniversity();
    loading();
  }

  void readRegion() async{
    region = await repository.readRegion();
    loading();
  }




  void loading(){
    isLoading=!isLoading;
    notifyListeners();
  }

  int? _selectedId;

  int? get selectedId => _selectedId;

  setSelectedId(int id) {
    _selectedId = id;
    notifyListeners();
  }

  void readByRegion() async{
    university = await repository.readUniByRegion(selectedId!);
    notifyListeners();
  }

}

