import 'package:etislat/feature/memberPage/data/model/member_model.dart';
import 'package:etislat/feature/memberPage/presentation/widget/profile_widget/money_widget.dart';
import 'package:etislat/feature/memberPage/presentation/widget/profile_widget/name_widget.dart';
import 'package:etislat/feature/memberPage/presentation/widget/profile_widget/phone_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key, required this.member});
  final Member member;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color:Colors.white,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          NameWidget(
            name: member.name,
            alignment: Alignment.bottomRight,
          ),
          SizedBox(height: 10.h),
          PhoneWidget(phone: member.phone),
          SizedBox(height: 6.h),
          MoneyWidget(money: member.money),
        ],
      ),
    );
  }
}
