// class CollectionModel {
//   final String collectionname;
//   final int collectoinid;

//   CollectionModel({required this.collectionname, required this.collectoinid});
//   factory CollectionModel.fromjson(Map<String, dynamic> json) {
//     return CollectionModel(
//         collectionname: json['collection_name'],
//         collectoinid: json['collection_id']);
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'collection_id': collectoinid,
//       'collection_name': collectionname,
//     };
//   }
// }

class CollectionModel {
  final String collectionname;
  final int collectoinid;
  int? memberCount; // Optional member count

  CollectionModel({required this.collectionname, required this.collectoinid, this.memberCount});

  factory CollectionModel.fromjson(Map<String, dynamic> json) {
    return CollectionModel(
      collectionname: json['collection_name'],
      collectoinid: json['collection_id'],
      memberCount: json['memberCount'], // This can be set later
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'collection_id': collectoinid,
      'collection_name': collectionname,
      'memberCount': memberCount,
    };
  }
}
