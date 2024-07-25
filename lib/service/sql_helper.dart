import '../utils/tools/file_importers.dart';
import 'dart:io' as io;

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();

  static Database? _db;

  DatabaseHelper();

  DatabaseHelper._instance();

  Future<Database?> get db async {
    return _db ?? await _initDB();
  }

  int sana = 0;

  Future<Database> _initDB() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "contracts.db");
    bool dbExists = await io.File(path).exists();

    if (!dbExists) {
      ByteData data = await rootBundle.load(join("assets", "contracts.db"));
      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await io.File(path).writeAsBytes(bytes, flush: true);
    }

    print("Database starting to work...${sana++}");
    var theDB = await openDatabase(path, version: 1);
    return theDB;
  }

  Future<List<Map<String, Object?>>?> getRegion() async {
    final data = await db;
    final List<Map<String, Object?>>? result = await data?.query('CITIES');
    return result;
  }

  Future<List<Map<String, Object?>>?> getUniversity() async {
    final data = await db;
    final List<Map<String, Object?>>? result = await data?.query('univers');
    return result;
  }

  Future<List<Map<String, Object?>>?> getFaculty(int univer_id) async {
    final data = await db;
    final List<Map<String, Object?>>? result = await data?.query(
        "faculties", where: 'univer_id = ?', whereArgs: [univer_id]);
    return result;
  }

  Future<List<Map<String, Object?>>?> getUniByRegion(int city_id) async {
    final data = await db;
    final List<Map<String, Object?>>? result = await data?.query("univers", where: 'city_id = ?', whereArgs: [city_id]);
    return result;
  }

  Future<List<Map<String, Object?>>?> getRegionBy(List regions) async {
    final data = await db;
    final List<Map<String, Object?>>? result = await data?.query('univers',
        where: 'city_id IN (${List.filled(regions.length, '?').join(', ')})',
        whereArgs: regions
    );
    return result;
  }



}

/* Future<List<UniversityModel>?> getData(List cityIds) async{
    List<UniversityModel>? data;
    if(cityIds.isEmpty){
      readUniversity();
    } else{
    final database = await db;

    String whereClause = "city_id IN (${cityIds.map((_) => '?').join(', ')})";

    List<Map<String, Object?>>? result = await database?.query('UNIVERS', where: whereClause, whereArgs: cityIds);
    print(result);
    data = result?.map((map) => UniversityModel.fromMap(map)).toList();
    print(data);
    }
    return data;
  }*/
