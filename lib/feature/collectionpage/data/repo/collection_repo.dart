import 'package:etislat/core/service/sqldb.dart';
import 'package:etislat/feature/collectionpage/data/model/collection_model.dart';

class CollectionRepo {
  final SqlDb mysql;

  CollectionRepo({required this.mysql});
   Future<int> getMemberCountByCollectionId(int collectionId) async {
    final List<Map<String, dynamic>> response = await mysql.readData('''
      SELECT COUNT(*) as memberCount 
      FROM member 
      WHERE collectionid = $collectionId
    ''');

    if (response.isNotEmpty) {
      return response[0]['memberCount'] as int;
    } else {
      return 0;
    }
  }
// add
  Future<int> addCollection(String collectionName) async {
    return await mysql.insertData('''
    INSERT INTO 'Collection' (collection_name)
    VALUES ('$collectionName')
    ''');
  }

// get
  Future<List<CollectionModel>> getallcollection() async {
    final List<Map<String, dynamic>> response =
        await mysql.readData('SELECT * FROM Collection');
    return response.map((data) => CollectionModel.fromjson(data)).toList();
  }

  // Update
  Future<int> updateCollection(
      int collectionId, String newCollectionName) async {
    int collectionUpdateResponse = await mysql.updateData('''
    UPDATE 'Collection' 
    SET collection_name = '$newCollectionName' 
    WHERE collection_id = $collectionId
    ''');
    int memberUpdateResponse = await mysql.updateData('''
    UPDATE 'member'
    SET collectionname = '$newCollectionName'
    WHERE collectionid = $collectionId
  ''');
    return collectionUpdateResponse + memberUpdateResponse;
  }

// Delete
  Future deleteCollection(int collectionId) async {
    await mysql.deleteData('''
    DELETE FROM Collection WHERE collection_id = $collectionId
    ''');
    String sql = '''
      DELETE FROM 'member' 
      WHERE collectionid = $collectionId
    ''';
    await mysql.deleteData(sql);
  }

// delete database
  Future<void> deleteDataBae() async {
    await mysql.mydeletedatabase();
  }
}
