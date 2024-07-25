import 'faculty_model.dart';

class UniversityModel{
  late int id;
  late int city_id;
  late String name;
  late List<FacultyModel> faculties;

  UniversityModel({required this.id,required this.city_id, required this.name});

  UniversityModel.fromMap(Map<String, dynamic> map){
    id = map['id'];
    city_id = map['city_id'];
    name = map['name'];
  }

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'city_id': city_id,
      'name': name
    };
  }
}