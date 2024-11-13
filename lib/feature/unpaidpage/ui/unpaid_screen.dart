import 'package:etislat/feature/unpaidpage/ui/widget/all_member_unpaid_widget.dart';
import 'package:etislat/feature/unpaidpage/ui/widget/search_member_unpaid_widget.dart';
import 'package:etislat/feature/unpaidpage/ui/widget/share_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UnpaidScreen extends StatelessWidget {
  const UnpaidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 50.h, right: 6.w, left: 6.w),
      child: Column(
        children: [
          const ShareWidget(),
          SizedBox(height: 6.h),
          const SearchMemberUnpaidWidget(),
          const AllMemberUnpaidWidget()
        ],
      ),
    );
  }
}
