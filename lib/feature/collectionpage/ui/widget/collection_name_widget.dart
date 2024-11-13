import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CollectionNameWidget extends StatelessWidget {
  const CollectionNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: const Color(0xffFE0000),
            // border: Border.all(color: Color(0xff430000)),
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          "المجموعات",
          style: TextStyle(fontSize: 15.sp, color: Colors.white),
        ),
      ),
    );
  }
}
