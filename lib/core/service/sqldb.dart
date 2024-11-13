import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  initialDb() async {
    String databasepath = await getDatabasesPath();  
    String path = join(
        databasepath, 'note1.db'); 
    Database mydb = await openDatabase(path,
        onCreate: _oncreate,
        version: 1,
        onUpgrade: _onupgrade); // انشاء database
    return mydb;
  }

  _onupgrade(Database db, int oldversion, int newversion) async {
    await db.execute("ALTER TABLE 'notes' ADD 'favourite' Text");
  }

//انشاء الجداول
  _oncreate(Database db, int version) async {
    Batch batch = db.batch();
    batch.execute('''
CREATE TABLE Collection (
  collection_id INTEGER PRIMARY KEY AUTOINCREMENT,
  collection_name TEXT
)
''');
    batch.execute('''
CREATE TABLE member (
  member_id INTEGER PRIMARY KEY AUTOINCREMENT, 
  member_name VARCHAR(255) NOT NULL,
  member_phone INTEGER ,
  paid BOOLEAN ,
  member_money TEXT,
  note TEXT,
  collectionid INTEGER NOT NULL,
  collectionname Text,
  FOREIGN KEY (collectionid) REFERENCES Collection(collection_id)
)
''');
    await batch.commit();
  }

// read
  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

// insert
  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

// update
  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }

// delete
  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }

//  DELETE ALL DATBASE
  mydeletedatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'note1.db');
    await deleteDatabase(path);
  }
}
