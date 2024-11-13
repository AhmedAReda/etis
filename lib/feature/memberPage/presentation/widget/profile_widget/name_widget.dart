import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NameWidget extends StatelessWidget {
  const NameWidget(
      {super.key, required this.name, required this.alignment, this.style});
  final String name;
  final AlignmentGeometry alignment;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: alignment,
        child: Text(
          name,
          style: style ??
              TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
        ));
  }
}
