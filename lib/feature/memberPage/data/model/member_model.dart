class Member {
  final int id;
  final String name;
  final int phone;
  final bool paid;
  final String money;
  final int collectionId;
  final String collectionName;
  final String? note;

  Member(
      {required this.id,
      required this.name,
      required this.phone,
      required this.paid,
      required this.collectionId,
      required this.money,
      required this.collectionName,
      this.note
      });

  // Convert JSON data into a Member object
  factory Member.fromJson(Map<dynamic, dynamic> json) {
    return Member(
      id: json['member_id'],
      name: json['member_name'],
      paid: json['paid'] == 1,
      collectionId: json['collectionid'],
      money: json['member_money'],
      phone: json['member_phone'],  
      collectionName: json['collectionname'],
         note: json['note'],
    );
  }

  // Convert a Member object into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'member_id': id,
      'member_name': name,
      'paid': paid,
      'collectionid': collectionId,
      'member_money': money,
      'member_phone': phone,
      'collectionname': collectionName,
        'note':note

    };
  }
}
