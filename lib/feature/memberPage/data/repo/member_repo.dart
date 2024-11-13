import 'package:etislat/core/service/sqldb.dart';
import 'package:etislat/feature/collectionpage/data/model/collection_model.dart';
import 'package:etislat/feature/memberPage/data/model/member_model.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberRepo {
  final SqlDb mysql;
  MemberRepo({required this.mysql});

  Future<CollectionModel> getallSpecificcollection(
      {required int collectionId}) async {
    final List<Map<String, dynamic>> response = await mysql.readData('''
    SELECT * FROM Collection
    WHERE collection_id = $collectionId
  ''');

    // Check if response has data
    if (response.isNotEmpty) {
      return CollectionModel.fromjson(response.first);
    } else {
      throw Exception("Collection not found");
    }
  }

 

  // Add a member to the database
  Future<int> addMember(Member member) async {
    String sql = '''
      INSERT INTO 'member' (member_name,member_phone ,paid, member_money, collectionid, collectionname)
      VALUES ('${member.name}','${member.phone}',${member.paid ? 1 : 0}, '${member.money}', ${member.collectionId},
        '${member.collectionName}')
    ''';
    return await mysql.insertData(sql);
  }

  // Update a member in the database
  Future<int> updateMember({required Member member}) async {
    String sql = '''
      UPDATE 'member' 
      SET member_name = '${member.name}', 
          paid = ${member.paid ? 1 : 0}, 
          member_money = '${member.money}', 
          member_phone = '${member.phone}',
          collectionid = ${member.collectionId}
      WHERE member_id = ${member.id}
    ''';
    return await mysql.updateData(sql);
  }

  Future<int> updateNote({required int memberid, required String note}) async {
    String sql = '''
      UPDATE 'member' 
      SET note = '${note}'    
      WHERE member_id = $memberid
    ''';
    return await mysql.updateData(sql);
  }

  Future<int> deleteNote({required int memberid}) async {
    String sql = '''
      UPDATE 'member' 
      SET note = NULL    
      WHERE member_id = $memberid
    ''';
    return await mysql.updateData(sql);
  }

  Future<int> makeAllMemberunPaid() async {
    String sql = '''
      UPDATE 'member' 
       SET paid = 0
    ''';
    return await mysql.updateData(sql);
  }

  Future<int> memberpaid({required int memberid, required bool paid}) async {
    String sql = '''
       UPDATE 'member' 
       SET paid = ${paid ? 1 : 0}
       WHERE member_id = $memberid
''';
    return await mysql.updateData(sql);
  }

  // Delete a member from the database
  Future<int> deleteMember(int memberId) async {
    String sql = '''
      DELETE FROM 'member' 
      WHERE member_id = $memberId
    ''';
    return await mysql.deleteData(sql);
  }

  // Get all members from the database
  Future<List<Member>> getAllMembers() async {
    String sql = '''
      SELECT * FROM member
    ''';
    List<Map> result = await mysql.readData(sql);
    return result.map((data) => Member.fromJson(data)).toList();
  }

  // Get a specific member by ID
  Future<Member?> getMemberById(int memberId) async {
    String sql = '''
      SELECT * FROM member 
      WHERE member_id = $memberId
    ''';
    List<Map> result = await mysql.readData(sql);
    if (result.isNotEmpty) {
      return Member.fromJson(result.first);
    } else {
      return null;
    }
  }

// get member paid
  Future<List<Member>> getAllMemberPaid({required bool paid}) async {
    String sql = '''
      SELECT * FROM member
       WHERE paid = $paid
    ''';
    List<Map> result = await mysql.readData(sql);
    return result.map((data) => Member.fromJson(data)).toList();
  }

  // Get all members for a specific collection
  Future<List<Member>> getMembersByCollection(
      {required int collectionId}) async {
    String sql = '''
      SELECT * FROM member 
      WHERE collectionid = $collectionId
    ''';
    List<Map> result = await mysql.readData(sql);
    return result.map((data) => Member.fromJson(data)).toList();
  }

  callmember({required String phone}) async {
    final Uri url = Uri(scheme: 'tel', path: '0$phone');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }

  sendWhatsAppMessage({required String phone, required String name}) async {
    // final String url = "https://wa.me/$phone?text=${Uri.encodeComponent(message)}";

    String tmessage =
        'عملنا العزيز أستاذ $name نحيط سيادتكم علما سيتم انقطاع الخدمه خلال ال 24 ساعه القادمه في حاله عدم سداد المبالغ المستحقه على حساب سيادتكم شكرا لثقتك بنا';
    String url = "https://wa.me/20$phone?text=$tmessage";
    // const String url = "https://wa.me/send?phone=201013003442";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  sendUnpaidWhatsAppMessage(
      {required List numbers,
      required String phonenumber,
      required List<String> names}) async {
    String nmessage = List.generate(
      numbers.length,
      (index) => '${names[index]}: ${numbers[index]}\n_________________',
    ).join('\n');
    // String message = numbers.join('\n_________________\n');
    String url = "https://wa.me/2$phonenumber?text=$nmessage";

    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  sendsms({required String phone}) async {
    String message =
        'عملنا العزيز برجاء العلم بانه تم تجاوز الحد المسموح به لمعاد سداد الفاتوره برجاء سداد الفاتوره في اسرع وقت لتجنب انقطاع الخدمه وايقاف الخط بشكل نهائي';
    String uri = 'sms:0$phone?body=$message';

    if (await canLaunchUrl(Uri.parse(uri))) {
      await launchUrl(Uri.parse(uri));
    } else {}
  }
}
