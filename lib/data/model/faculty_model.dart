class FacultyModel{
  late String name;
  late String tuition_fee;
  late int univer_id;

  FacultyModel({required this.name, required this.tuition_fee, required this.univer_id});

  FacultyModel.fromMap(Map<String, dynamic> map){
    name = map['name'];
    tuition_fee = map['tuition_fee'];
    univer_id = map['univer_id'];
  }

  Map<String, dynamic> toMap(){
    return{
      'name': name,
      'tuition_fee': tuition_fee,
      'univer_id': univer_id
    };
  }

}