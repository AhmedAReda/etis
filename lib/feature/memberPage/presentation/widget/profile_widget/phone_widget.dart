import 'package:etislat/core/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneWidget extends StatelessWidget {
  const PhoneWidget({super.key, required this.phone});
  final int phone;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomText(
            text: '$phone',
            fontsize: 20,
            fontcolor:  Colors.black,
            fontWeight: FontWeight.w400),
        SizedBox(width: 5.w),
        const CustomText(
            text: ': رقم التليفون',
            fontsize: 17,
            fontcolor: Colors.black,
            fontWeight: FontWeight.w400),
      ],
    );
  }
}
