import 'package:etislat/core/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoneyWidget extends StatelessWidget {
  const MoneyWidget({super.key, required this.money});
  final String money;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        CustomText(
            text: money,
            fontsize: 20,
            fontcolor: Colors.black,
            fontWeight: FontWeight.w400),
        SizedBox(width: 5.w),
        const CustomText(
            text: ': سعر الباقه',
            fontsize: 17,
            fontcolor: Colors.black,
            fontWeight: FontWeight.w400),
      ],
    );
  }
}
