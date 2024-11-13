import 'package:etislat/feature/memberPage/presentation/widget/profile_widget/name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionnameWidget extends StatelessWidget {
  const CollectionnameWidget({super.key, required this.collectionname});
  final String collectionname;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(5)),
      child: NameWidget(
        name: collectionname,
        style: TextStyle(
            fontSize: 20.sp, fontWeight: FontWeight.w800, color: Colors.black),
        alignment: Alignment.center,
      ),
    );
  }
}
