import 'package:path/path.dart';
import 'package:shopio/model/category.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  //database name
  static final String _dbname = "shoppio.db";

  // database version
  static int _dbversion = 1;

  //TABLES NAME

  static final String _tablecategory = "category";

  //column name
  static final String _id = 'id';
  static final String _title = 'title';
  static final String _image = 'image';
  static final String _desc = 'description';

//  static final String _image='image_path';
  static final String _date = 'date';

  static Database? _database;

  Future<Database?> getdatabase() async {
    if (_database == null) {
      _database = await createdatabase();
    }
    return _database;
  }

  Future<Database> createdatabase() async {
    var path = join(await getDatabasesPath(), _dbname);
    print("database path ${path}");
    return await openDatabase(
      path,
      version: _dbversion,
      onCreate: (db, version) {
        return db.execute("CREATE TABLE $_tablecategory"
            "($_id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "$_title TEXT,"
            "$_desc TEXT,"
            "$_image TEXT,"
            "$_date INTEGER)");
      },
    );
  }

  Future<int?> insert(Category category) async {
    final db = await getdatabase();
    return await db?.insert(
      _tablecategory,
      category.toMap(),
    );
  }

  Future<List<Category>> getcategoylist() async {
    final db = await getdatabase();

    List<Category> categorylist = [];

    // List<Map<String,dynamic>> list = db!.query(_tablecategory);
    //var list =db!.query(_tablecategory);
    List<Map<String, dynamic>> list1 =
        await db!.rawQuery("select * from $_tablecategory");
    categorylist =
        List.generate(list1.length, (index) => Category.fromMap(list1[index]))
            .toList();
    return categorylist;
  }

  Future<int> update(Category category) async {
    final db = await getdatabase();
    // db!.update(_tablecategory, category.toMap(),where: '$_id=? and $_title= ?');
    return await db!.update(_tablecategory, category.toMap(),
        where: '$_id=?', whereArgs: [category.id]);
  }

  Future<List<Map<String, dynamic>>> delete(int id) async {
    final db=await getdatabase();
    return await db!.rawQuery("delete from $_tablecategory where $_id = $id");
  }
}
