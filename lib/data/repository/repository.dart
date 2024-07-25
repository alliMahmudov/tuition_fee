import 'package:tuition_fee/data/model/faculty_model.dart';
import 'package:tuition_fee/utils/tools/file_importers.dart';


class Repository{

  Future<List<UniversityModel>> readUniversity() async {
    final List<Map<String, Object?>>? universityMap = await DatabaseHelper.instance.getUniversity();
    final List<UniversityModel> university = [];
    universityMap?.forEach((element) {
      university.add(UniversityModel.fromMap(element));
    });
    return university;
  }

  Future<List<RegionModel>> readRegion() async {
    final List<Map<String, Object?>>? regionMap = await DatabaseHelper.instance.getRegion();
    final List<RegionModel> regions = [];
    regionMap?.forEach((element) {
      regions.add(RegionModel.fromMap(element));
    });
    return regions;
  }

  Future<List<FacultyModel>> readFacInfo(int univer_id) async{
    final List<Map<String, Object?>>? facMap = await DatabaseHelper.instance.getFaculty(univer_id);
    final List<FacultyModel> faculties = [];
    facMap?.forEach((element) {
      faculties.add(FacultyModel.fromMap(element));
    });
    return faculties;
  }

  Future<List<UniversityModel>> readUniByRegion(int city_id) async{
    final List<Map<String, Object?>>? facMap = await DatabaseHelper.instance.getUniByRegion(city_id);
    final List<UniversityModel> universities = [];
    facMap?.forEach((element) {
      universities.add(UniversityModel.fromMap(element));
    });
    return universities;
  }







}