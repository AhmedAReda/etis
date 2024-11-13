import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class Button extends StatelessWidget {
  Button(
      {super.key,
      this.onPressed0,
      required this.text,
      this.Buttoncolor,
      this.textColor});
  final void Function()? onPressed0;
  final String text;
  final Color? Buttoncolor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Buttoncolor ?? Colors.black,
          borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.all(10),
      child: MaterialButton(
        onPressed: onPressed0,
        child: CustomText(
            text: text,
            fontsize: 16.sp,
            fontcolor: textColor ?? Colors.white,
            fontWeight: FontWeight.w300),
      ),
    );
  }
}
