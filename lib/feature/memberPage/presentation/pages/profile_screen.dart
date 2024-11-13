import 'package:etislat/feature/memberPage/data/model/member_model.dart';
import 'package:etislat/feature/memberPage/presentation/widget/profile_widget/all_button_widget.dart';
import 'package:etislat/feature/memberPage/presentation/widget/profile_widget/collectionname_widget.dart';
import 'package:etislat/feature/memberPage/presentation/widget/profile_widget/details_widget.dart';
import 'package:etislat/feature/memberPage/presentation/widget/profile_widget/listner_widget.dart';
import 'package:etislat/feature/memberPage/presentation/widget/profile_widget/note_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.member,
  });
  final Member member;
  // final CollectionModel? collectionModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffCCCCCC),
        body: Container(
          padding: EdgeInsets.only(top: 70.h, left: 10.w, right: 10.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CollectionnameWidget(collectionname: member.collectionName),
                SizedBox(height: 20.h),
                DetailsWidget(member: member),
                SizedBox(height: 10.h),
                NoteWidget(member: member),
                SizedBox(height: 20.h),
                Align(
                  child: AllButtonWidget(member: member),
                ),
                const ListnerWidget()
              ],
            ),
          ),
        ));
  }
}
