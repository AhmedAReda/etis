import 'package:etislat/core/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.name,
      required this.icon,
      required this.color,
      this.textcolor,required this.onTap});
  final String name;
  final Widget icon;
  final Color color;
  final Color? textcolor;
  final   Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(6)),
        child: Row(
          children: [
            icon,
            SizedBox(width: 5.w),
            CustomText(
                text: name,
                fontsize: 20,
                fontcolor: textcolor ?? Colors.black,
                fontWeight: FontWeight.w600)
          ],
        ),
      ),
    );
  }
}
