import 'package:etislat/feature/allpaaidpage/ui/widget/all_member_paid_widget.dart';
import 'package:etislat/feature/allpaaidpage/ui/widget/clear_button_Widget.dart';
import 'package:etislat/feature/allpaaidpage/ui/widget/search_member_paid_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Allpaidscreen extends StatelessWidget {
  const Allpaidscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60.h, right: 6.w, left: 6.w),
      child: const Column(
        children: [
          ClearButtonWidget(),
          SearchMemberPaidWidget(),
          AllMemberPaidWidget()
        ],
      ),
    );
  }
}
