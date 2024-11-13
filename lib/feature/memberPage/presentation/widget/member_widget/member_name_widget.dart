import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MemberNameWidget extends StatelessWidget {
  const MemberNameWidget({super.key, required this.collectionname});
  final String collectionname;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.black,
          //  border: Border.all(color: const Color(0xff430000), width: 2),
          borderRadius: BorderRadius.circular(5)),
      child: Text(
        collectionname,
        maxLines: 4,
        style: TextStyle(fontSize: 15.sp, color: Colors.white),
      ),
    );
  }
}
