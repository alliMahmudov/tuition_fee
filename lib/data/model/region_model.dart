class RegionModel {
  late int id;
  late String name;

  RegionModel({required this.id, required this.name});

  RegionModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
