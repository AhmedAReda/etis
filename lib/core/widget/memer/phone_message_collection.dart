import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class phone_message_collection extends StatelessWidget {
  const phone_message_collection({
    super.key,
    required this.collectionname,
    required this.phone,
    required this.whats,
    required this.gotocollection,
  });

  final String collectionname;
  final Function()? phone;
  final Function()? whats;
  final Function()? gotocollection;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      margin: EdgeInsets.only(left: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xff430000)),
            ),
            child: IconButton(
              onPressed: phone,
              icon: const Icon(
                Icons.phone,
                color: Color.fromARGB(255, 22, 105, 173),
                size: 25,
              ),
            ),
          ),
          SizedBox(width: 15.w),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: const Color(0xff430000)),
            ),
            child: IconButton(
              onPressed: whats,
              icon: const Icon(
                Icons.message,
                color: Color.fromARGB(255, 4, 107, 7),
                size: 25,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          InkWell(
            onTap: () {
              gotocollection;
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 234, 234),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: const Color(0xff430000)),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                collectionname,
                style: TextStyle(
                    fontSize: 15.sp,
                    decoration: TextDecoration.underline), // Underline text
                // maxLines: 1, // Limit to one line
                // overflow:
                //     TextOverflow.ellipsis, // Show ellipsis if text overflows
                textAlign: TextAlign.right,
              ),
            ),
          )
        ],
      ),
    );
  }
}
